require 'csv'
require 'yaml'

csv = CSV.new(STDIN, headers: true).collect{ |row| Hash[row.collect{ |k, v| [k, v == '' ? nil : v] }] }.collect{ |row|
  row.to_h.slice('superclass', 'class', 'zoom', 'style', 'priority', 'key', 'value', 'extra_tags')
}.select{ |row|
  row['superclass']
}.map{ |row|
  if row['extra_tags']
    row['extra_tags'] = row['extra_tags'].split(',').map{ |kv| kv.split('=').map(&:strip) }
  end
  row
}


error = csv.select{ |row|
  row.slice('priority', 'superclass', 'key', 'value').any?{ |k, v| k.nil? || v.nil? || k.include?(' ') || v.include?(' ') } or
  ![nil, '', '⬤', '◯', '•'].include?(row['style'])
}

if !error.empty?
  puts "ERROR"
  error.each{ |row| puts row.inspect }
  exit 1
end

yg = csv.group_by{ |row|
  row['key']
}
yg['landuse'] = [{'value' => '__any__'}]
yg['leisure'] = [{'value' => '__any__'}]
y = yg.collect{ |key, group|
  [key, group.collect{ |row| row['value'] }.sort]
}
y = {'def_poi': Hash[y]}
yaml_str = YAML.dump(y)

include_tags = csv.map{ |row| row['extra_tags'] }.select{ |extra_tags| extra_tags }.collect{ |extra_tags|
  extra_tags.collect{ |extra_tag| extra_tag[0] }
}.flatten.uniq
include_tags = include_tags.join("', '")
include_tags = "'#{include_tags}'" if include_tags.size > 0

file = File.open('mapping-teritorio.yaml', 'w')
file.write("""
tags:
  include_: [#{include_tags}]
#{yaml_str.gsub('def_poi:', 'def_poi: &poi_mapping').gsub('---', '')}

def_poi_fields: &poi_fields
  - name: osm_id
    type: id
  - name: geometry
    type: geometry
  - name: name
    key: name
    type: string
  - name: name_en
    key: name:en
    type: string
  - name: name_de
    key: name:de
    type: string
  - name: tags
    type: hstore_tags
  - name: subclass
    type: mapping_value
  - name: mapping_key
    type: mapping_key
  - name: station
    key: station
    type: string
  - name: funicular
    key: funicular
    type: string
  - name: information
    key: information
    type: string
  - name: uic_ref
    key: uic_ref
    type: string
  - name: religion
    key: religion
    type: string
  - name: level
    key: level
    type: integer
  - name: indoor
    key: indoor
    type: bool
  - name: layer
    key: layer
    type: integer
  - name: sport
    key: sport
    type: string
  - name: access -- for reject filters
    key: access
    type: string

tables:
  # etldoc: imposm3 -> osm_poi_point
  poi_point:
    type: point
    fields: *poi_fields
    mapping: *poi_mapping
    filters:
      reject:
        access: ['no', 'private']

  # etldoc: imposm3 -> osm_poi_polygon
  poi_polygon:
    type: polygon
    fields: *poi_fields
    mapping: *poi_mapping
    filters:
      reject:
        access: ['no', 'private']
""")


whens = csv.collect{ |row|
  _superclass = "'#{row['superclass']}'"
  _class = "'#{row['class'] || row['value']}'"
  _subclass = row['class'] ? "'#{row['subclass'] || row['value']}'" : 'NULL'
  _zoom = row['zoom'] ? row['zoom'] : 18
  _style = row['style'] && row['style'] != '' ? "'#{row['style']}'" : 'NULL'
  _priority = row['priority']

  extra_tags = ''
  if row['extra_tags']
    extra_tags = ' AND ' + row['extra_tags'].collect{ |etags|
      if etags[0] == 'access'
        extra_tags = "(tags?'#{etags[0]}' AND tags->'#{etags[0]}' NOT IN ('no', 'private'))"
      elsif ['*', ''].include?(etags[1])
        extra_tags = "tags?'#{etags[0]}'"
      else
        extra_tags = "tags->'#{etags[0]}' = '#{etags[1]}'"
      end
    }.join(' AND ')
  end

  "            SELECT #{_superclass}, #{_class}, #{_subclass}, #{_zoom}, #{_style}, #{_priority} WHERE tags?'#{row['key']}' AND tags->'#{row['key']}' = '#{row['value']}'#{extra_tags}"
}.join(" UNION ALL\n")

file = File.open('class-teritorio.sql', 'w')
file.write("""
CREATE OR REPLACE FUNCTION teritorio_poi_class(key TEXT, value TEXT, tags hstore) RETURNS TABLE (
    superclass TEXT,
    class TEXT,
    subclass TEXT,
    zoom INTEGER,
    style TEXT,
    priority INTEGER
) AS $$
    SELECT * FROM (
#{whens}
    ) AS t(superclass, class, subclass, zoom, style, priority)
    ORDER BY
        zoom,
        priority
    LIMIT 1
$$ LANGUAGE SQL IMMUTABLE;
""")
