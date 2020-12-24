require 'csv'
require 'yaml'
require 'json'

superclass_name_fr = class_name_fr = subclass_name_fr = nil
csv = CSV.new(File.new(ARGV[0]).read, headers: true).collect{ |row| Hash[row.collect{ |k, v| [k, v == '' ? nil : v] }] }.collect{ |row|
  row.to_h.slice('superclass:name:fr', 'superclass', 'class:name:fr', 'class', 'subclass:name:fr', 'zoom', 'style', 'priority', 'key', 'value', 'extra_tags')
}.collect{ |row|
  if row['superclass:name:fr']
    superclass_name_fr = row['superclass:name:fr']
    class_name_fr = subclass_name_fr = nil
  end
  if row['class:name:fr']
    class_name_fr = row['class:name:fr']
    subclass_name_fr = class_name_fr
  end
  if row['subclass:name:fr']
    subclass_name_fr = row['subclass:name:fr']
  end
  row['superclass:name:fr'] = superclass_name_fr
  row['class:name:fr'] = class_name_fr
  row['subclass:name:fr'] = subclass_name_fr
  row
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


hierarchy = Hash[csv.group_by{ |row| row['superclass'] }.collect{ |superclass, c|
  c0 = c[0]
  c = Hash[c.collect{ |r|
    r.slice('class:name:fr', 'class', 'subclass:name:fr', 'zoom', 'style', 'priority', 'key', 'value', 'extra_tags')
  }.group_by{ |r| r['class'] }.collect{ |classs, sc|
    sc0 = sc[0]
    sc = Hash[sc.collect{ |rr|
      [rr['value'], {label: {en: rr['value'], fr: rr['subclass:name:fr']}}]
    }]
    [classs, {label: {en: classs, fr: sc0['class:name:fr']}, subclass: sc}]
  }]
  pop = c.delete(nil)
  pop = pop[:subclass] if pop
  [superclass, {label: {en: superclass, fr: c0['superclass:name:fr']}, class: c.merge(pop || {})}]
}]
file = File.open('ontology.json', 'w')
file.write(JSON.pretty_generate(hierarchy))

yg = csv.group_by{ |row|
  row['key']
}
yg['landuse'] = [{'value' => '__any__'}]
yg['leisure'] = [{'value' => '__any__'}]
y = yg.collect{ |key, group|
  [key, group.collect{ |row| row['value'] }.sort.uniq]
}
y = {'def_poi': Hash[y]}
yaml_str = YAML.dump(y)

plus_tags = CSV.new(File.new(ARGV[1]).read, headers: true).collect{ |row|
  row['tag'].gsub(' ', '').gsub(' ', '')
}.select{ |tag|
  tag != ''
}.uniq

include_tags = csv.map{ |row| row['extra_tags'] }.select{ |extra_tags| extra_tags }.collect{ |extra_tags|
  extra_tags.collect{ |extra_tag| extra_tag[0] }
}.flatten
include_tags += plus_tags
include_tags = include_tags.sort.uniq
include_tags = include_tags.join("', '")
include_tags = "'#{include_tags}'" if include_tags.size > 0

poi_yaml = File.open('poi_tourism.yaml').read()
poi_yaml = YAML::load(poi_yaml)

query = '(SELECT osm_id, osm_id AS id, geometry, name, name_en, name_de, {name_languages}, tourism_superclass, tourism_class, tourism_subclass, tourism_zoom, tourism_priority, tourism_style, agg_stop, layer, level, indoor, tourism_rank, {extra_attributes} FROM layer_poi_tourism(!bbox!, z(!scale_denominator!), !pixel_width!)) AS t'
query = query.gsub('{extra_attributes}', plus_tags.map{ |t| "tags->'#{t}' AS \"#{t}\"" }.join(', '))
poi_yaml['layer']['datasource']['query'] = query

keep_fields = %w[id geometry name name_en name_de tourism_superclass tourism_class tourism_subclass tourism_zoom tourism_priority tourism_style agg_stop layer level indoor tourism_rank]
poi_yaml['layer']['fields'] = poi_yaml['layer']['fields'].slice(*keep_fields).merge(Hash[plus_tags.map{ |t| [t, nil] }])
File.open('poi_tourism.yaml', 'w').write(YAML::dump(poi_yaml))

file = File.open('mapping.yaml', 'w')
file.write("""
tags:
  include: [#{include_tags}]
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
    columns: *poi_fields
    mapping: *poi_mapping
    filters:
      reject:
        access: ['no']

  # etldoc: imposm3 -> osm_poi_polygon
  poi_polygon:
    type: polygon
    columns: *poi_fields
    mapping: *poi_mapping
    filters:
      reject:
        access: ['no']
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
      values = (etags[1] || "").split(';').map{ |t| "'#{t}'"}.join(', ')
      if ['*', nil].include?(etags[1])
        extra_tags = "(tags?'#{etags[0]}' AND tags->'#{etags[0]}' != 'no')"
      elsif etags[0][-1] == '!'
        extra_tags = "(NOT tags?'#{etags[0][0..-2]}' OR tags->'#{etags[0][0..-2]}' NOT IN (#{values}))"
      else
        extra_tags = "tags->'#{etags[0]}' IN (#{values})"
      end
    }.join(' AND ')
  end

  if _superclass == "'remarkable'" && _class == "'attraction_activity'" && _subclass == "'attraction'"
    "(SELECT
  #{_superclass}, #{_class}, #{_subclass},
  CASE
    WHEN score >= 11 THEN 13
    WHEN score >= 5 THEN 14
    ELSE 17
  END AS zoom,
  '⬤' AS style,
  CASE
    WHEN score >= 11 THEN 0
    WHEN score >= 8 THEN 50
    ELSE 100
  END AS priority
FROM (
  SELECT
    CASE tags->'heritage' WHEN '1' THEN 10 WHEN '2' THEN 5 WHEN '3' THEN 2 ELSE 1 END +
    CASE WHEN tags ?& ARRAY['wikipedia', 'wikidata'] THEN 5 ELSE 0 END +
    CASE WHEN tags?'name' THEN 1 ELSE 0 END +
    CASE WHEN tags ?& ARRAY['website', 'phone', 'email', 'opening_hours'] THEN 1 ELSE 0 END AS score
  WHERE tags?'#{row['key']}' AND tags->'#{row['key']}' = '#{row['value']}'#{extra_tags}
) AS score)"
  else
    "            SELECT #{_superclass}, #{_class}, #{_subclass}, #{_zoom}, #{_style}, #{_priority} WHERE tags?'#{row['key']}' AND tags->'#{row['key']}' = '#{row['value']}'#{extra_tags}"
  end
}.join(" UNION ALL\n")

file = File.open('class.sql', 'w')
file.write("""
CREATE OR REPLACE FUNCTION poi_tourism_class(key TEXT, value TEXT, tags hstore) RETURNS TABLE (
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
$$
LANGUAGE SQL
IMMUTABLE PARALLEL SAFE;
""")
