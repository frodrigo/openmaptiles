DROP TRIGGER IF EXISTS trigger_update ON osm_marine_point;

CREATE OR REPLACE FUNCTION update_osm_marine_point(new_osm_id bigint) RETURNS void AS
$$
BEGIN
    -- etldoc: ne_10m_geography_marine_polys -> osm_marine_point
    -- etldoc: osm_marine_point              -> osm_marine_point

    WITH important_marine_point AS (
        SELECT osm.osm_id, ne.scalerank
        FROM osm_marine_point AS osm
             LEFT JOIN ne_10m_geography_marine_polys AS ne ON
              trim(regexp_replace(ne.name, '\\s+', ' ', 'g')) ILIKE osm.name
           OR trim(regexp_replace(ne.name, '\\s+', ' ', 'g')) ILIKE osm.tags->'name:en'
           OR trim(regexp_replace(ne.name, '\\s+', ' ', 'g')) ILIKE osm.tags->'name:es'
           OR osm.name ILIKE trim(regexp_replace(ne.name, '\\s+', ' ', 'g')) || ' %'
    )
    UPDATE osm_marine_point AS osm
    SET "rank" = scalerank
    FROM important_marine_point AS ne
    WHERE (new_osm_id IS NULL OR osm.osm_id = new_osm_id)
      AND osm.osm_id = ne.osm_id
      AND "rank" IS DISTINCT FROM scalerank;

    UPDATE osm_marine_point
    SET tags = update_tags(tags, geometry)
    WHERE (new_osm_id IS NULL OR osm_id = new_osm_id)
      AND COALESCE(tags->'name:latin', tags->'name:nonlatin', tags->'name_int') IS NULL
      AND tags != update_tags(tags, geometry);

END;
$$ LANGUAGE plpgsql;

SELECT update_osm_marine_point(NULL);

CREATE INDEX IF NOT EXISTS osm_marine_point_rank_idx ON osm_marine_point ("rank");

-- Handle updates
CREATE SCHEMA IF NOT EXISTS water_name_marine;

CREATE OR REPLACE FUNCTION water_name_marine.update() RETURNS trigger AS
$$
BEGIN
    PERFORM update_osm_marine_point(NEW.osm_id);
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER trigger_update
    AFTER INSERT OR UPDATE
    ON osm_marine_point
    INITIALLY DEFERRED
    FOR EACH ROW
EXECUTE PROCEDURE water_name_marine.update();
