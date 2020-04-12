DROP TRIGGER IF EXISTS trigger_flag ON osm_city_polygon;
DROP TRIGGER IF EXISTS trigger_store ON osm_city_polygon;
DROP TRIGGER IF EXISTS trigger_refresh ON place_city_polygon.updates;

CREATE EXTENSION IF NOT EXISTS unaccent;

CREATE SCHEMA IF NOT EXISTS place_city_polygon;

CREATE TABLE IF NOT EXISTS place_city_polygon.osm_ids
(
    osm_id bigint
);

CREATE OR REPLACE FUNCTION update_osm_city_polygon(full_update boolean) RETURNS void AS
$$
    -- etldoc: osm_city_polygon          -> osm_city_polygon

    UPDATE osm_city_polygon
    SET tags = update_tags(tags, geometry),
        geometry = ST_PointOnSurface(geometry)
    WHERE (full_update OR osm_id IN (SELECT osm_id FROM place_city_polygon.osm_ids))
      AND COALESCE(tags->'name:latin', tags->'name:nonlatin', tags->'name_int') IS NULL
      AND tags != update_tags(tags, geometry)
       OR ST_GeometryType(geometry) <> 'ST_Point';

$$ LANGUAGE SQL;

SELECT update_osm_city_polygon(true);

CREATE INDEX IF NOT EXISTS osm_city_polygon_rank_idx ON osm_city_polygon ("rank");

-- Handle updates

CREATE OR REPLACE FUNCTION place_city_polygon.store() RETURNS trigger AS
$$
BEGIN
    IF (tg_op = 'DELETE') THEN
        INSERT INTO place_city_polygon.osm_ids VALUES (OLD.osm_id);
    ELSE
        INSERT INTO place_city_polygon.osm_ids VALUES (NEW.osm_id);
    END IF;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TABLE IF NOT EXISTS place_city_polygon.updates
(
    id serial PRIMARY KEY,
    t text,
    UNIQUE (t)
);
CREATE OR REPLACE FUNCTION place_city_polygon.flag() RETURNS trigger AS
$$
BEGIN
    INSERT INTO place_city_polygon.updates(t) VALUES ('y') ON CONFLICT(t) DO NOTHING;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION place_city_polygon.refresh() RETURNS trigger AS
$$
DECLARE
    t TIMESTAMP WITH TIME ZONE := clock_timestamp();
BEGIN
    RAISE LOG 'Refresh place_city_polygon rank';
    PERFORM update_osm_city_polygon(false);
    -- noinspection SqlWithoutWhere
    DELETE FROM place_city_polygon.osm_ids;
    -- noinspection SqlWithoutWhere
    DELETE FROM place_city_polygon.updates;

    RAISE LOG 'Refresh place_city done in %', age(clock_timestamp(), t);
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_store
    AFTER INSERT OR UPDATE OR DELETE
    ON osm_city_polygon
    FOR EACH ROW
EXECUTE PROCEDURE place_city_polygon.store();

CREATE TRIGGER trigger_flag
    AFTER INSERT OR UPDATE OR DELETE
    ON osm_city_polygon
    FOR EACH STATEMENT
EXECUTE PROCEDURE place_city_polygon.flag();

CREATE CONSTRAINT TRIGGER trigger_refresh
    AFTER INSERT
    ON place_city_polygon.updates
    INITIALLY DEFERRED
    FOR EACH ROW
EXECUTE PROCEDURE place_city_polygon.refresh();
