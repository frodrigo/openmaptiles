
-- etldoc: layer_poi_tourism[shape=record fillcolor=lightpink, style="rounded,filled",
-- etldoc:     label="layer_poi_tourism | <z12> z12 | <z13> z13 | <z14_> z14+" ] ;

CREATE OR REPLACE FUNCTION layer_poi_tourism(bbox geometry, zoom_level integer, pixel_width numeric)
RETURNS TABLE(osm_id bigint, geometry geometry, name text, name_en text, name_de text, tags hstore, superclass text, class text, subclass text, zoom integer, style text, agg_stop integer, layer integer, level integer, indoor integer, "rank" int) AS $$
    SELECT osm_id_hash AS osm_id, geometry, NULLIF(name, '') AS name,
        COALESCE(NULLIF(name_en, ''), name) AS name_en,
        COALESCE(NULLIF(name_de, ''), name, name_en) AS name_de,
        tags,
        (poi_tourism_class(mapping_key, subclass, tags)).superclass AS superclass,
        (poi_tourism_class(mapping_key, subclass, tags)).class AS class,
        (poi_tourism_class(mapping_key, subclass, tags)).subclass AS subclass,
        (poi_tourism_class(mapping_key, subclass, tags)).zoom AS zoom,
        (poi_tourism_class(mapping_key, subclass, tags)).style AS style,
--        CASE
--            WHEN subclass = 'information'
--                THEN NULLIF(information, '')
--            WHEN subclass = 'place_of_worship'
--                    THEN NULLIF(religion, '')
--            WHEN subclass = 'pitch'
--                    THEN NULLIF(sport, '')
--            ELSE subclass
--        END AS subclass,
        agg_stop,
        NULLIF(layer, 0) AS layer,
        "level",
        CASE WHEN indoor=TRUE THEN 1 END as indoor,
        row_number() OVER (
            PARTITION BY LabelGrid(geometry, 100 * pixel_width)
            ORDER BY CASE WHEN name = '' THEN 2000 ELSE (poi_tourism_class(mapping_key, subclass, tags)).priority END ASC
        )::int AS "rank"
    FROM (
        -- etldoc: osm_poi_point ->  layer_poi_tourism:z12
        -- etldoc: osm_poi_point ->  layer_poi_tourism:z13
        SELECT *,
            osm_id*10 AS osm_id_hash FROM osm_poi_point
            WHERE geometry && bbox
                AND zoom_level BETWEEN 12 AND 13
                AND ((subclass='station' AND mapping_key = 'railway')
                    OR subclass IN ('halt', 'ferry_terminal')
                    OR (SELECT (poi_tourism_class(mapping_key, subclass, tags)).zoom) <= zoom_level
                    )
        UNION ALL

        -- etldoc: osm_poi_point ->  layer_poi_tourism:z14_
        SELECT *,
            osm_id*10 AS osm_id_hash FROM osm_poi_point
            WHERE geometry && bbox
                AND zoom_level >= 14

        UNION ALL
        -- etldoc: osm_poi_polygon ->  layer_poi_tourism:z12
        -- etldoc: osm_poi_polygon ->  layer_poi_tourism:z13
        SELECT *,
            NULL::INTEGER AS agg_stop,
            CASE WHEN osm_id<0 THEN -osm_id*10+4
                ELSE osm_id*10+1
            END AS osm_id_hash
        FROM osm_poi_polygon
            WHERE geometry && bbox
                AND zoom_level BETWEEN 12 AND 13
                AND ((subclass='station' AND mapping_key = 'railway')
                    OR subclass IN ('halt', 'ferry_terminal')
                    OR (SELECT (poi_tourism_class(mapping_key, subclass, tags)).zoom) <= zoom_level
                    )

        UNION ALL
        -- etldoc: osm_poi_polygon ->  layer_poi_tourism:z14_
        SELECT *,
            NULL::INTEGER AS agg_stop,
            CASE WHEN osm_id<0 THEN -osm_id*10+4
                ELSE osm_id*10+1
            END AS osm_id_hash
        FROM osm_poi_polygon
            WHERE geometry && bbox
                AND zoom_level >= 14
        ) as poi_union
    ORDER BY zoom, "rank"
    ;
$$ LANGUAGE SQL STABLE
                PARALLEL SAFE;
