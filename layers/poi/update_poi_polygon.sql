DROP TRIGGER IF EXISTS trigger_update_polygon ON osm_poi_polygon;

-- etldoc:  osm_poi_polygon ->  osm_poi_polygon

CREATE OR REPLACE FUNCTION update_poi_polygon(new_osm_id bigint) RETURNS void AS
$$
BEGIN
    UPDATE osm_poi_polygon
    SET geometry =
            CASE
                WHEN ST_NPoints(ST_ConvexHull(geometry)) = ST_NPoints(geometry)
                    THEN ST_Centroid(geometry)
                ELSE ST_PointOnSurface(geometry)
                END
    WHERE (new_osm_id IS NULL OR osm_id = new_osm_id)
      AND ST_GeometryType(geometry) <> 'ST_Point';

    UPDATE osm_poi_polygon
    SET subclass = 'subway'
    WHERE (new_osm_id IS NULL OR osm_id = new_osm_id)
      AND station = 'subway'
      AND subclass = 'station';

    UPDATE osm_poi_polygon
    SET subclass = 'halt'
    WHERE (new_osm_id IS NULL OR osm_id = new_osm_id)
      AND funicular = 'yes'
      AND subclass = 'station';

    UPDATE osm_poi_polygon
    SET tags = update_tags(tags, geometry)
    WHERE (new_osm_id IS NULL OR osm_id = new_osm_id)
      AND COALESCE(tags->'name:latin', tags->'name:nonlatin', tags->'name_int') IS NULL
      AND tags != update_tags(tags, geometry);

END;
$$ LANGUAGE plpgsql;

SELECT update_poi_polygon(NULL);

-- Handle updates

CREATE SCHEMA IF NOT EXISTS poi_polygon;

CREATE OR REPLACE FUNCTION poi_polygon.update() RETURNS trigger AS
$$
BEGIN
    PERFORM update_poi_polygon(NEW.osm_id);
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE CONSTRAINT TRIGGER trigger_update_polygon
    AFTER INSERT OR UPDATE
    ON osm_poi_polygon
    INITIALLY DEFERRED
    FOR EACH ROW
EXECUTE PROCEDURE poi_polygon.update();
