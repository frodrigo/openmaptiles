
CREATE OR REPLACE FUNCTION teritorio_poi_class(key TEXT, value TEXT, tags hstore) RETURNS TABLE (
    superclass TEXT,
    class TEXT,
    subclass TEXT,
    style TEXT,
    priority INTEGER
) AS $$
    SELECT * FROM (
        SELECT 'local_products', 'oil_mill', NULL, '⬤', 500 WHERE key = 'craft' AND value = 'oil_mill' UNION ALL
        SELECT 'local_products', 'farm', NULL, '⬤', 500 WHERE key = 'shop' AND value = 'farm' UNION ALL
        SELECT 'local_products', 'carpet', NULL, '⬤', 500 WHERE key = 'shop' AND value = 'carpet' UNION ALL
        SELECT 'local_products', 'alcohol', NULL, '⬤', 500 WHERE key = 'shop' AND value = 'alcohol' UNION ALL
        SELECT 'local_products', 'chocolate', NULL, '⬤', 500 WHERE key = 'shop' AND value = 'chocolate' UNION ALL
        SELECT 'local_products', 'deli', NULL, '⬤', 500 WHERE key = 'shop' AND value = 'deli' UNION ALL
        SELECT 'local_products', 'tailor', NULL, '⬤', 500 WHERE key = 'shop' AND value = 'tailor' UNION ALL
        SELECT 'local_products', 'craft', 'beekeeper', '⬤', 500 WHERE key = 'craft' AND value = 'beekeeper' UNION ALL
        SELECT 'local_products', 'craft', 'handicraft', '⬤', 500 WHERE key = 'craft' AND value = 'handicraft' UNION ALL
        SELECT 'local_products', 'craft', 'basket_maker', '⬤', 500 WHERE key = 'craft' AND value = 'basket_maker' UNION ALL
        SELECT 'local_products', 'craft', 'brewery', '⬤', 500 WHERE key = 'craft' AND value = 'brewery' UNION ALL
        SELECT 'local_products', 'craft', 'luthier', '⬤', 500 WHERE key = 'craft' AND value = 'luthier' UNION ALL
        SELECT 'local_products', 'craft', 'jeweller ', '⬤', 500 WHERE key = 'craft' AND value = 'jeweller ' UNION ALL
        SELECT 'local_products', 'craft', 'distillery', '⬤', 500 WHERE key = 'craft' AND value = 'distillery' UNION ALL
        SELECT 'local_products', 'craft', 'grinding_mill', '⬤', 500 WHERE key = 'craft' AND value = 'grinding_mill' UNION ALL
        SELECT 'local_products', 'craft', 'pottery', '⬤', 500 WHERE key = 'craft' AND value = 'pottery' UNION ALL
        SELECT 'local_products', 'craft', 'leather', '⬤', 500 WHERE key = 'craft' AND value = 'leather' UNION ALL
        SELECT 'local_products', 'craft', 'sculptor ', '⬤', 500 WHERE key = 'craft' AND value = 'sculptor ' UNION ALL
        SELECT 'local_products', 'craft', 'winery', '⬤', 500 WHERE key = 'craft' AND value = 'winery' UNION ALL
        SELECT 'convenience', 'supermarket', NULL, '⬤', 600 WHERE key = 'shop' AND value = 'supermarket' UNION ALL
        SELECT 'convenience', 'convenience', NULL, '⬤', 600 WHERE key = 'shop' AND value = 'convenience' UNION ALL
        SELECT 'convenience', 'greengrocer', NULL, '⬤', 600 WHERE key = 'shop' AND value = 'greengrocer' UNION ALL
        SELECT 'convenience', 'bakery', NULL, '⬤', 600 WHERE key = 'shop' AND value = 'bakery' UNION ALL
        SELECT 'convenience', 'tobacco', NULL, '⬤', 600 WHERE key = 'shop' AND value = 'tobacco' UNION ALL
        SELECT 'convenience', 'newsagent', NULL, '⬤', 600 WHERE key = 'shop' AND value = 'newsagent' UNION ALL
        SELECT 'convenience', 'photo', NULL, '⬤', 600 WHERE key = 'shop' AND value = 'photo' UNION ALL
        SELECT 'convenience', 'kiosk', NULL, '⬤', 600 WHERE key = 'shop' AND value = 'kiosk' UNION ALL
        SELECT 'convenience', 'chemist', NULL, '⬤', 600 WHERE key = 'shop' AND value = 'chemist' UNION ALL
        SELECT 'convenience', 'marketplace', NULL, '⬤', 600 WHERE key = 'amenity' AND value = 'marketplace' UNION ALL
        SELECT 'convenience', 'sports', NULL, '⬤', 600 WHERE key = 'shop' AND value = 'sports' UNION ALL
        SELECT 'convenience', 'butcher', NULL, '⬤', 600 WHERE key = 'shop' AND value = 'butcher' UNION ALL
        SELECT 'convenience', 'hairdresser', NULL, '⬤', 600 WHERE key = 'shop' AND value = 'hairdresser' UNION ALL
        SELECT 'convenience', 'seefood', NULL, '⬤', 600 WHERE key = 'shop' AND value = 'seefood' UNION ALL
        SELECT 'convenience', 'florist', NULL, '⬤', 600 WHERE key = 'shop' AND value = 'florist' UNION ALL
        SELECT 'local_services', 'bank', NULL, '⬤', 700 WHERE key = 'amenity' AND value = 'bank' UNION ALL
        SELECT 'local_services', 'atm', NULL, '•', 700 WHERE key = 'amenity' AND value = 'atm' UNION ALL
        SELECT 'local_services', 'post_office', NULL, '⬤', 700 WHERE key = 'amenity' AND value = 'post_office' UNION ALL
        SELECT 'local_services', 'laundry', NULL, '⬤', 700 WHERE key = 'shop' AND value = 'laundry' UNION ALL
        SELECT 'local_services', 'dry_cleaning', NULL, '⬤', 700 WHERE key = 'shop' AND value = 'dry_cleaning' UNION ALL
        SELECT 'local_services', 'massage', NULL, NULL, 700 WHERE key = 'shop' AND value = 'massage' UNION ALL
        SELECT 'local_services', 'estate_agent', NULL, '⬤', 700 WHERE key = 'office' AND value = 'estate_agent' UNION ALL
        SELECT 'local_services', 'fuel', NULL, '⬤', 700 WHERE key = 'amenity' AND value = 'fuel' UNION ALL
        SELECT 'local_services', 'car_repair', NULL, '⬤', 700 WHERE key = 'shop' AND value = 'car_repair' UNION ALL
        SELECT 'local_services', 'car_parts', NULL, '⬤', 700 WHERE key = 'shop' AND value = 'car_parts' UNION ALL
        SELECT 'local_services', 'office', NULL, '⬤', 700 WHERE key = 'information' AND value = 'office' UNION ALL
        SELECT 'local_services', 'townhall', NULL, '•', 700 WHERE key = 'amenity' AND value = 'townhall' UNION ALL
        SELECT 'local_services', 'copyshop', NULL, '⬤', 700 WHERE key = 'shop' AND value = 'copyshop' UNION ALL
        SELECT 'local_services', 'ticket', NULL, '⬤', 700 WHERE key = 'shop' AND value = 'ticket' UNION ALL
        SELECT 'local_services', 'travel_agency', NULL, '⬤', 700 WHERE key = 'shop' AND value = 'travel_agency' UNION ALL
        SELECT 'safety', 'care', 'pharmacy', '⬤', 50 WHERE key = 'amenity' AND value = 'pharmacy' UNION ALL
        SELECT 'safety', 'care', 'doctors', '•', 50 WHERE key = 'amenity' AND value = 'doctors' AND (tags?'healthcare:speciality' AND tags->'healthcare:speciality' != 'no') UNION ALL
        SELECT 'safety', 'care', 'dentist', '•', 50 WHERE key = 'amenity' AND value = 'dentist' UNION ALL
        SELECT 'safety', 'care', 'physiotherapist', '•', 50 WHERE key = 'healthcare' AND value = 'physiotherapist' UNION ALL
        SELECT 'safety', 'care', 'veterinary', '•', 50 WHERE key = 'amenity' AND value = 'veterinary' UNION ALL
        SELECT 'safety', 'emergency', 'hospital', '⬤', 0 WHERE key = 'amenity' AND value = 'hospital' AND (tags?'emergency' AND tags->'emergency' != 'no') UNION ALL
        SELECT 'safety', 'emergency', 'clinic', '⬤', 0 WHERE key = 'amenity' AND value = 'clinic' AND (tags?'emergency' AND tags->'emergency' != 'no') UNION ALL
        SELECT 'safety', 'emergency', 'defibrillator', '⬤', 0 WHERE key = 'emergency' AND value = 'defibrillator' UNION ALL
        SELECT 'safety', 'rescue', 'water_rescue_station', '⬤', 0 WHERE key = 'emergency' AND value = 'water_rescue_station' UNION ALL
        SELECT 'safety', 'rescue', 'lifeguard_base', '⬤', 0 WHERE key = 'emergency' AND value = 'lifeguard_base' UNION ALL
        SELECT 'safety', 'rescue', 'life_ring', '•', 4 WHERE key = 'emergency' AND value = 'life_ring' UNION ALL
        SELECT 'safety', 'rescue', 'life_ring', '•', 4 WHERE key = 'amenity' AND value = 'life_ring' UNION ALL
        SELECT 'safety', 'rescue', 'mountain_rescue', '⬤', 0 WHERE key = 'emergency' AND value = 'mountain_rescue' UNION ALL
        SELECT 'safety', 'rescue', 'police', '⬤', 0 WHERE key = 'amenity' AND value = 'police' UNION ALL
        SELECT 'safety', 'rescue', 'fire_station', '⬤', 0 WHERE key = 'amenity' AND value = 'fire_station' UNION ALL
        SELECT 'mobility', 'charging_station', NULL, '•', 200 WHERE key = 'amenity' AND value = 'charging_station' AND (tags?'byclicle' AND tags->'byclicle' != 'no') AND (tags?'car' AND tags->'car' != 'no') AND (tags?'scooter' AND tags->'scooter' != 'no') UNION ALL
        SELECT 'mobility', 'railway', 'station', '◯', 60 WHERE key = 'railway' AND value = 'station' UNION ALL
        SELECT 'mobility', 'railway', 'halt', '◯', 60 WHERE key = 'railway' AND value = 'halt' UNION ALL
        SELECT 'mobility', 'railway', 'train_station_entrance', '•', 60 WHERE key = 'railway' AND value = 'train_station_entrance' UNION ALL
        SELECT 'mobility', 'railway', 'subway_entrance', '◯', 60 WHERE key = 'railway' AND value = 'subway_entrance' UNION ALL
        SELECT 'mobility', 'railway', 'tram_stop', '◯', 60 WHERE key = 'railway' AND value = 'tram_stop' UNION ALL
        SELECT 'mobility', 'motorway', 'bus_station', '◯', 70 WHERE key = 'amenity' AND value = 'bus_station' UNION ALL
        SELECT 'mobility', 'motorway', 'bus_stop', '◯', 70 WHERE key = 'highway' AND value = 'bus_stop' UNION ALL
        SELECT 'mobility', 'motorway', 'parking', '◯', 70 WHERE key = 'amenity' AND value = 'parking' AND (tags?'access' AND tags->'access' != 'no') UNION ALL
        SELECT 'mobility', 'motorway', 'car_pooling', '◯', 70 WHERE key = 'amenity' AND value = 'car_pooling' UNION ALL
        SELECT 'mobility', 'motorway', 'taxi', '◯', 70 WHERE key = 'amenity' AND value = 'taxi' UNION ALL
        SELECT 'mobility', 'motorway', 'motorway_junction', '•', 70 WHERE key = 'highway' AND value = 'motorway_junction' AND (tags?'ref' AND tags->'ref' != 'no') UNION ALL
        SELECT 'mobility', 'motorway', 'toll_booth', '•', 70 WHERE key = 'barrier' AND value = 'toll_booth' UNION ALL
        SELECT 'mobility', 'aeroway', 'aerodrome', '◯', 0 WHERE key = 'aeroway' AND value = 'aerodrome' AND (tags?'aerodrome:international' AND tags->'aerodrome:international' != 'no') UNION ALL
        SELECT 'mobility', 'waterway', 'ferry_terminal', '◯', 60 WHERE key = 'amenity' AND value = 'ferry_terminal' UNION ALL
        SELECT 'mobility', 'waterway', 'dock', '•', 60 WHERE key = 'waterway' AND value = 'dock' UNION ALL
        SELECT 'mobility', 'bicycle', 'bicycle', '⬤', 200 WHERE key = 'shop' AND value = 'bicycle' AND (tags?'service:bicycle:rental' AND tags->'service:bicycle:rental' != 'no') UNION ALL
        SELECT 'mobility', 'bicycle', 'bicycle_parking', '◯', 200 WHERE key = 'amenity' AND value = 'bicycle_parking' UNION ALL
        SELECT 'mobility', 'bicycle', 'motorcycle_parking', '◯', 200 WHERE key = 'amenity' AND value = 'motorcycle_parking' UNION ALL
        SELECT 'mobility', 'bicycle', 'bicycle_rental', '◯', 200 WHERE key = 'amenity' AND value = 'bicycle_rental' UNION ALL
        SELECT 'mobility', 'bicycle', 'compressed_air', '•', 200 WHERE key = 'amenity' AND value = 'compressed_air' UNION ALL
        SELECT 'mobility', 'bicycle', 'cycle_barrier', '•', 200 WHERE key = 'barrier' AND value = 'cycle_barrier' UNION ALL
        SELECT 'amenity_local', 'playground', NULL, '⬤', 500 WHERE key = 'leisure' AND value = 'playground' UNION ALL
        SELECT 'amenity_local', 'bench', NULL, '•', 1000 WHERE key = 'amenity' AND value = 'bench' UNION ALL
        SELECT 'amenity_local', 'stile', NULL, '•', 1000 WHERE key = 'barrier' AND value = 'stile' UNION ALL
        SELECT 'amenity_local', 'information', 'post_box', '•', 1000 WHERE key = 'amenity' AND value = 'post_box' UNION ALL
        SELECT 'amenity_local', 'information', 'telephone', '•', 1000 WHERE key = 'amenity' AND value = 'telephone' UNION ALL
        SELECT 'amenity_local', 'information', NULL, '•', 300 WHERE key = 'tourism' AND value = 'information' AND (tags?'information:board' AND tags->'information:board' != 'no') UNION ALL
        SELECT 'amenity_local', 'sanitary', 'shower', '◯', 1000 WHERE key = 'amenity' AND value = 'shower' UNION ALL
        SELECT 'amenity_local', 'sanitary', 'drinking_water', '◯', 300 WHERE key = 'amenity' AND value = 'drinking_water' UNION ALL
        SELECT 'amenity_local', 'sanitary', 'toilets', '◯', 300 WHERE key = 'amenity' AND value = 'toilets' AND (tags?'access' AND tags->'access' != 'no') UNION ALL
        SELECT 'amenity_local', 'picnic', 'picnic_site', '⬤', 300 WHERE key = 'tourism' AND value = 'picnic_site' UNION ALL
        SELECT 'amenity_local', 'picnic', 'picnic_table', '•', 1000 WHERE key = 'leisure' AND value = 'picnic_table' UNION ALL
        SELECT 'amenity_local', 'picnic', 'firepit', '•', 1000 WHERE key = 'leisure' AND value = 'firepit' UNION ALL
        SELECT 'amenity_local', 'picnic', 'bbq', '•', 1000 WHERE key = 'amenity' AND value = 'bbq' UNION ALL
        SELECT 'amenity_local', 'hut', 'alpine_hut', '⬤', 100 WHERE key = 'tourism' AND value = 'alpine_hut' UNION ALL
        SELECT 'amenity_local', 'hut', 'wilderness_hut', '⬤', 100 WHERE key = 'tourism' AND value = 'wilderness_hut' UNION ALL
        SELECT 'amenity_local', 'hut', 'shelter', '•', 100 WHERE key = 'amenity' AND value = 'shelter' UNION ALL
        SELECT 'amenity_local', 'waste', 'recycling', '⬤', 300 WHERE key = 'amentiy' AND value = 'recycling' AND (tags?'recycling_type' AND tags->'recycling_type' != 'no') UNION ALL
        SELECT 'amenity_local', 'waste', 'recycling', '•', 800 WHERE key = 'amentiy' AND value = 'recycling' AND (tags?'recycling_type' AND tags->'recycling_type' != 'no') UNION ALL
        SELECT 'amenity_local', 'waste', 'waste_disposal', '•', 1000 WHERE key = 'amenity' AND value = 'waste_disposal' UNION ALL
        SELECT 'amenity_local', 'waste', 'waste_basket', '•', 1000 WHERE key = 'amenity' AND value = 'waste_basket' UNION ALL
        SELECT 'amenity_local', 'waste', 'vending_machine', '•', 1000 WHERE key = 'amenity' AND value = 'vending_machine' AND (tags?'vending:excrement_bags' AND tags->'vending:excrement_bags' != 'no') UNION ALL
        SELECT 'amenity_local', 'waste', 'waste_basket', '•', 1000 WHERE key = 'amenity' AND value = 'waste_basket' AND (tags?'waste' AND tags->'waste' != 'no') UNION ALL
        SELECT 'remarkable', 'attraction_activity', 'attraction', '⬤', 0 WHERE key = 'tourism' AND value = 'attraction' UNION ALL
        SELECT 'remarkable', 'attraction_activity', 'aquarium', '⬤', 0 WHERE key = 'tourism' AND value = 'aquarium' UNION ALL
        SELECT 'remarkable', 'attraction_activity', 'theme_park', '⬤', 0 WHERE key = 'tourism' AND value = 'theme_park' UNION ALL
        SELECT 'remarkable', 'attraction_activity', 'water_park', '⬤', 0 WHERE key = 'tourism' AND value = 'water_park' UNION ALL
        SELECT 'remarkable', 'attraction_activity', 'zoo', '⬤', 0 WHERE key = 'tourism' AND value = 'zoo' UNION ALL
        SELECT 'remarkable', 'attraction_activity', 'wiewpoint', '⬤', 100 WHERE key = 'tourism' AND value = 'wiewpoint' UNION ALL
        SELECT 'remarkable', 'park', 'garden', '⬤', 300 WHERE key = 'leisure' AND value = 'garden' UNION ALL
        SELECT 'remarkable', 'park', 'park', '⬤', 30 WHERE key = 'leisure' AND value = 'park' AND (tags?'access' AND tags->'access' != 'no') UNION ALL
        SELECT 'remarkable', 'natural_activity', 'beach_resort', '⬤', 0 WHERE key = 'leisure' AND value = 'beach_resort' UNION ALL
        SELECT 'remarkable', 'natural_activity', 'peak', '•', 0 WHERE key = 'natural' AND value = 'peak' UNION ALL
        SELECT 'remarkable', 'natural_activity', 'nature_reserve', '⬤', 0 WHERE key = 'leisure' AND value = 'nature_reserve' UNION ALL
        SELECT 'remarkable', 'natural_activity', 'protected_area', '⬤', 0 WHERE key = 'boundary' AND value = 'protected_area' UNION ALL
        SELECT 'remarkable', 'hide', 'wildlife_hide', '•', 100 WHERE key = 'leisure' AND value = 'wildlife_hide' UNION ALL
        SELECT 'remarkable', 'hide', 'bird_hide', '•', 100 WHERE key = 'leisure' AND value = 'bird_hide' UNION ALL
        SELECT 'remarkable', 'hide', 'tower', '•', 100 WHERE key = 'man_made' AND value = 'tower' AND (tags?'tower:type' AND tags->'tower:type' != 'no') UNION ALL
        SELECT 'remarkable', 'outdoor_activity', 'swimming_area', '⬤', 0 WHERE key = 'leisure' AND value = 'swimming_area' UNION ALL
        SELECT 'remarkable', 'outdoor_activity', 'winter_sports', '⬤', 0 WHERE key = 'landuse' AND value = 'winter_sports' UNION ALL
        SELECT 'remarkable', 'outdoor_activity', 'marina', '⬤', 0 WHERE key = 'leisure' AND value = 'marina' UNION ALL
        SELECT 'remarkable', 'outdoor_activity', 'fishing', '⬤', 0 WHERE key = 'leisure' AND value = 'fishing' UNION ALL
        SELECT 'remarkable', 'outdoor_activity', 'stadium', '⬤', 30 WHERE key = 'leisure' AND value = 'stadium' UNION ALL
        SELECT 'culture', 'artwork', NULL, '•', 800 WHERE key = 'tourism' AND value = 'artwork' UNION ALL
        SELECT 'culture', 'visit', 'place_of_worship', '⬤', 30 WHERE key = 'amenity' AND value = 'place_of_worship' UNION ALL
        SELECT 'culture', 'visit', 'arts_centre', '⬤', 30 WHERE key = 'amenity' AND value = 'arts_centre' UNION ALL
        SELECT 'culture', 'visit', 'museum', '⬤', 0 WHERE key = 'tourism' AND value = 'museum' UNION ALL
        SELECT 'culture', 'historic', 'castle', '⬤', 30 WHERE key = 'historic' AND value = 'castle' UNION ALL
        SELECT 'culture', 'historic', 'monument', '⬤', 30 WHERE key = 'historic' AND value = 'monument' UNION ALL
        SELECT 'culture', 'historic', 'memorial', '•', 800 WHERE key = 'historic' AND value = 'memorial' UNION ALL
        SELECT 'culture', 'historic', 'archaeological_site', '⬤', 30 WHERE key = 'historic' AND value = 'archaeological_site' UNION ALL
        SELECT 'culture', 'historic', 'castle_wall', NULL, 800 WHERE key = 'historic' AND value = 'castle_wall' UNION ALL
        SELECT 'culture', 'historic', 'city_wall', NULL, 800 WHERE key = 'barrier' AND value = 'city_wall' UNION ALL
        SELECT 'culture', 'historic', 'church', NULL, 800 WHERE key = 'historic' AND value = 'church' UNION ALL
        SELECT 'culture', 'historic', 'city_gate', '•', 800 WHERE key = 'historic' AND value = 'city_gate' UNION ALL
        SELECT 'culture', 'historic', 'wayside_cross', '•', 800 WHERE key = 'historic' AND value = 'wayside_cross' UNION ALL
        SELECT 'culture', 'historic', 'wayside_shrine', '•', 800 WHERE key = 'historic' AND value = 'wayside_shrine' UNION ALL
        SELECT 'culture', 'show', 'theatre', '⬤', 100 WHERE key = 'amenity' AND value = 'theatre' UNION ALL
        SELECT 'culture', 'show', 'cinema', '⬤', 100 WHERE key = 'amenity' AND value = 'cinema' UNION ALL
        SELECT 'culture', 'show', 'gallery', '⬤', 100 WHERE key = 'tourism' AND value = 'gallery' UNION ALL
        SELECT 'hosting', 'hotel', 'hotel', '⬤', 30 WHERE key = 'tourism' AND value = 'hotel' UNION ALL
        SELECT 'hosting', 'hotel', 'motel', '⬤', 30 WHERE key = 'tourism' AND value = 'motel' UNION ALL
        SELECT 'hosting', 'hotel', 'hostel', '⬤', 30 WHERE key = 'tourism' AND value = 'hostel' UNION ALL
        SELECT 'hosting', 'hotel', 'guest_house', '⬤', 30 WHERE key = 'tourism' AND value = 'guest_house' UNION ALL
        SELECT 'hosting', 'resort', 'apartment', '⬤', 30 WHERE key = 'tourism' AND value = 'apartment' UNION ALL
        SELECT 'hosting', 'resort', 'camp_site', '⬤', 30 WHERE key = 'tourism' AND value = 'camp_site' UNION ALL
        SELECT 'hosting', 'resort', 'caravan_site', NULL, 30 WHERE key = 'tourism' AND value = 'caravan_site' UNION ALL
        SELECT 'hosting', 'resort', 'resort', '⬤', 30 WHERE key = 'leisure' AND value = 'resort' UNION ALL
        SELECT 'hosting', 'rental', 'chalet', '⬤', 30 WHERE key = 'tourism' AND value = 'chalet' UNION ALL
        SELECT 'hosting', 'rental', 'apartment', '•', 30 WHERE key = 'tourism' AND value = 'apartment' UNION ALL
        SELECT 'catering', 'food', 'restaurant', '⬤', 40 WHERE key = 'amenity' AND value = 'restaurant' UNION ALL
        SELECT 'catering', 'food', 'fast_food', '⬤', 40 WHERE key = 'amenity' AND value = 'fast_food' UNION ALL
        SELECT 'catering', 'food', 'food_court', '⬤', 40 WHERE key = 'amenity' AND value = 'food_court' UNION ALL
        SELECT 'catering', 'food', 'pastry', '⬤', 40 WHERE key = 'shop' AND value = 'pastry' AND (tags?'?' AND tags->'?' != 'no') UNION ALL
        SELECT 'catering', 'food', 'ice_cream', '⬤', 40 WHERE key = 'amenity' AND value = 'ice_cream' UNION ALL
        SELECT 'catering', 'drink', 'pub', '⬤', 50 WHERE key = 'amenity' AND value = 'pub' UNION ALL
        SELECT 'catering', 'drink', 'bar', '⬤', 50 WHERE key = 'amenity' AND value = 'bar' UNION ALL
        SELECT 'catering', 'drink', 'cafe', '⬤', 50 WHERE key = 'amenity' AND value = 'cafe' UNION ALL
        SELECT 'leisure', 'community_centre', NULL, '•', 200 WHERE key = 'amenity' AND value = 'community_centre' UNION ALL
        SELECT 'leisure', 'nightclub', NULL, '⬤', 200 WHERE key = 'amenity' AND value = 'nightclub' UNION ALL
        SELECT 'leisure', 'swimming_pool', NULL, '⬤', 200 WHERE key = 'leisure' AND value = 'swimming_pool' AND (tags?'access' AND tags->'access' != 'no') UNION ALL
        SELECT 'leisure', 'golf_course', NULL, '⬤', 200 WHERE key = 'leisure' AND value = 'golf_course' UNION ALL
        SELECT 'leisure', 'ice_ring', NULL, '⬤', 200 WHERE key = 'leisure' AND value = 'ice_ring' UNION ALL
        SELECT 'leisure', 'horse_riding', NULL, '⬤', 200 WHERE key = 'leisure' AND value = 'horse_riding' UNION ALL
        SELECT 'leisure', 'miniature_golf', NULL, '⬤', 200 WHERE key = 'leisure' AND value = 'miniature_golf' UNION ALL
        SELECT 'leisure', 'pitch', NULL, '•', 599 WHERE key = 'leisure' AND value = 'pitch' UNION ALL
        SELECT 'leisure', 'sport', 'athletics', '•', 500 WHERE key = 'sport' AND value = 'athletics' UNION ALL
        SELECT 'leisure', 'sport', 'badminton', '•', 500 WHERE key = 'sport' AND value = 'badminton' UNION ALL
        SELECT 'leisure', 'sport', 'basketball', '•', 500 WHERE key = 'sport' AND value = 'basketball' UNION ALL
        SELECT 'leisure', 'sport', 'beachvolleyball', '•', 500 WHERE key = 'sport' AND value = 'beachvolleyball' UNION ALL
        SELECT 'leisure', 'sport', 'bmx', '•', 500 WHERE key = 'sport' AND value = 'bmx' UNION ALL
        SELECT 'leisure', 'sport', 'canoe', '•', 500 WHERE key = 'sport' AND value = 'canoe' UNION ALL
        SELECT 'leisure', 'sport', 'climbing', '•', 500 WHERE key = 'sport' AND value = 'climbing' UNION ALL
        SELECT 'leisure', 'sport', 'climbing_adventure', '•', 500 WHERE key = 'sport' AND value = 'climbing_adventure' UNION ALL
        SELECT 'leisure', 'sport', 'bullfighting', '•', 500 WHERE key = 'sport' AND value = 'bullfighting' UNION ALL
        SELECT 'leisure', 'sport', 'billiards', '•', 500 WHERE key = 'sport' AND value = 'billiards' UNION ALL
        SELECT 'leisure', 'sport', 'boules', '•', 500 WHERE key = 'sport' AND value = 'boules' UNION ALL
        SELECT 'leisure', 'sport', 'cycling', '•', 500 WHERE key = 'sport' AND value = 'cycling' UNION ALL
        SELECT 'leisure', 'sport', 'equestrian', '•', 500 WHERE key = 'sport' AND value = 'equestrian' UNION ALL
        SELECT 'leisure', 'sport', 'futsal', '•', 500 WHERE key = 'sport' AND value = 'futsal' UNION ALL
        SELECT 'leisure', 'sport', 'diving', '•', 500 WHERE key = 'sport' AND value = 'diving' UNION ALL
        SELECT 'leisure', 'sport', 'free_flying', '•', 500 WHERE key = 'sport' AND value = 'free_flying' UNION ALL
        SELECT 'leisure', 'sport', 'golf', '•', 500 WHERE key = 'sport' AND value = 'golf' UNION ALL
        SELECT 'leisure', 'sport', 'gymnastics', '•', 500 WHERE key = 'sport' AND value = 'gymnastics' UNION ALL
        SELECT 'leisure', 'sport', 'handball', '•', 500 WHERE key = 'sport' AND value = 'handball' UNION ALL
        SELECT 'leisure', 'sport', 'ice_hockey', '•', 500 WHERE key = 'sport' AND value = 'ice_hockey' UNION ALL
        SELECT 'leisure', 'sport', 'horse_racing', '•', 500 WHERE key = 'sport' AND value = 'horse_racing' UNION ALL
        SELECT 'leisure', 'sport', 'karting', '•', 500 WHERE key = 'sport' AND value = 'karting' UNION ALL
        SELECT 'leisure', 'sport', 'kitesurfing', '•', 500 WHERE key = 'sport' AND value = 'kitesurfing' UNION ALL
        SELECT 'leisure', 'sport', 'motocross', '•', 500 WHERE key = 'sport' AND value = 'motocross' UNION ALL
        SELECT 'leisure', 'sport', 'motor', '•', 500 WHERE key = 'sport' AND value = 'motor' UNION ALL
        SELECT 'leisure', 'sport', 'multi', '•', 500 WHERE key = 'sport' AND value = 'multi' UNION ALL
        SELECT 'leisure', 'sport', 'orienteering', '•', 500 WHERE key = 'sport' AND value = 'orienteering' UNION ALL
        SELECT 'leisure', 'sport', 'paddle_tennis', '•', 500 WHERE key = 'sport' AND value = 'paddle_tennis' UNION ALL
        SELECT 'leisure', 'sport', 'paintball', '•', 500 WHERE key = 'sport' AND value = 'paintball' UNION ALL
        SELECT 'leisure', 'sport', 'pelota', '•', 500 WHERE key = 'sport' AND value = 'pelota' UNION ALL
        SELECT 'leisure', 'sport', 'racquet', '•', 500 WHERE key = 'sport' AND value = 'racquet' UNION ALL
        SELECT 'leisure', 'sport', 'rowing', '•', 500 WHERE key = 'sport' AND value = 'rowing' UNION ALL
        SELECT 'leisure', 'sport', 'rugby', '•', 500 WHERE key = 'sport' AND value = 'rugby' UNION ALL
        SELECT 'leisure', 'sport', 'rugby_league', '•', 500 WHERE key = 'sport' AND value = 'rugby_league' UNION ALL
        SELECT 'leisure', 'sport', 'rugby_union', '•', 500 WHERE key = 'sport' AND value = 'rugby_union' UNION ALL
        SELECT 'leisure', 'sport', 'running', '•', 500 WHERE key = 'sport' AND value = 'running' UNION ALL
        SELECT 'leisure', 'sport', 'sailing', '•', 500 WHERE key = 'sport' AND value = 'sailing' UNION ALL
        SELECT 'leisure', 'sport', 'scuba_diving', '•', 500 WHERE key = 'sport' AND value = 'scuba_diving' UNION ALL
        SELECT 'leisure', 'sport', 'shooting', '•', 500 WHERE key = 'sport' AND value = 'shooting' UNION ALL
        SELECT 'leisure', 'sport', 'skateboard', '•', 500 WHERE key = 'sport' AND value = 'skateboard' UNION ALL
        SELECT 'leisure', 'sport', 'soccer', '•', 500 WHERE key = 'sport' AND value = 'soccer' UNION ALL
        SELECT 'leisure', 'sport', 'surfing', '•', 500 WHERE key = 'sport' AND value = 'surfing' UNION ALL
        SELECT 'leisure', 'sport', 'swimming', '•', 500 WHERE key = 'sport' AND value = 'swimming' UNION ALL
        SELECT 'leisure', 'sport', 'table_soccer', '•', 500 WHERE key = 'sport' AND value = 'table_soccer' UNION ALL
        SELECT 'leisure', 'sport', 'table_tennis', '•', 500 WHERE key = 'sport' AND value = 'table_tennis' UNION ALL
        SELECT 'leisure', 'sport', 'tennis', '•', 500 WHERE key = 'sport' AND value = 'tennis' UNION ALL
        SELECT 'leisure', 'sport', 'volleyball', '•', 500 WHERE key = 'sport' AND value = 'volleyball' UNION ALL
        SELECT 'leisure', 'sport', 'water_ski', '•', 500 WHERE key = 'sport' AND value = 'water_ski' UNION ALL
        SELECT 'leisure', 'sport', 'yoga', '•', 500 WHERE key = 'sport' AND value = 'yoga' UNION ALL
        SELECT 'public_landmark', 'courthouse', NULL, '•', 100 WHERE key = 'amenity' AND value = 'courthouse' UNION ALL
        SELECT 'public_landmark', 'embassy', NULL, '•', 100 WHERE key = 'amenity' AND value = 'embassy' UNION ALL
        SELECT 'public_landmark', 'grave_yard', NULL, '•', 100 WHERE key = 'amenity' AND value = 'grave_yard' UNION ALL
        SELECT 'public_landmark', 'cemetery', NULL, '•', 100 WHERE key = 'landuse' AND value = 'cemetery' UNION ALL
        SELECT 'public_landmark', 'reservoir', NULL, '•', 100 WHERE key = 'landuse' AND value = 'reservoir' UNION ALL
        SELECT 'public_landmark', 'library', NULL, '•', 100 WHERE key = 'amenity' AND value = 'library' UNION ALL
        SELECT 'public_landmark', 'kindergarten', NULL, '•', 100 WHERE key = 'amenity' AND value = 'kindergarten' AND (tags?'school:FR' AND tags->'school:FR' != 'no') UNION ALL
        SELECT 'public_landmark', 'school', NULL, '•', 100 WHERE key = 'amenity' AND value = 'school' UNION ALL
        SELECT 'public_landmark', 'college', NULL, '•', 100 WHERE key = 'amenity' AND value = 'college' UNION ALL
        SELECT 'public_landmark', 'university', NULL, '•', 100 WHERE key = 'amenity' AND value = 'university' UNION ALL
        SELECT 'public_landmark', 'prison', NULL, '•', 100 WHERE key = 'amenity' AND value = 'prison' UNION ALL
        SELECT 'public_landmark', 'mall', NULL, '•', 100 WHERE key = 'shop' AND value = 'mall' UNION ALL
        SELECT 'public_landmark', 'border_control.', NULL, '•', 100 WHERE key = 'barrier' AND value = 'border_control.' UNION ALL
        SELECT 'public_landmark', 'basin', NULL, '•', 100 WHERE key = 'landuse' AND value = 'basin' UNION ALL
        SELECT 'public_landmark', 'brownfield', NULL, '•', 100 WHERE key = 'landuse' AND value = 'brownfield' UNION ALL
        SELECT 'shopping', 'sport_supply', 'bicycle', '⬤', 500 WHERE key = 'shop' AND value = 'bicycle' UNION ALL
        SELECT 'shopping', 'sport_supply', 'outdoor', '⬤', 500 WHERE key = 'shop' AND value = 'outdoor' UNION ALL
        SELECT 'shopping', 'feed', 'coffee', '⬤', 400 WHERE key = 'shop' AND value = 'coffee' UNION ALL
        SELECT 'shopping', 'feed', 'beverages', '⬤', 400 WHERE key = 'shop' AND value = 'beverages' UNION ALL
        SELECT 'shopping', 'feed', 'confectionery', '⬤', 400 WHERE key = 'shop' AND value = 'confectionery' UNION ALL
        SELECT 'shopping', 'feed', 'frozen_food', '⬤', 400 WHERE key = 'shop' AND value = 'frozen_food' UNION ALL
        SELECT 'shopping', 'feed', 'ice_cream', '⬤', 400 WHERE key = 'shop' AND value = 'ice_cream' UNION ALL
        SELECT 'shopping', 'supply', 'furniture', '⬤', 700 WHERE key = 'shop' AND value = 'furniture' UNION ALL
        SELECT 'shopping', 'supply', 'computer', '⬤', 700 WHERE key = 'shop' AND value = 'computer' UNION ALL
        SELECT 'shopping', 'supply', 'camera', '⬤', 700 WHERE key = 'shop' AND value = 'camera' UNION ALL
        SELECT 'shopping', 'supply', 'mobile_phone', '⬤', 700 WHERE key = 'shop' AND value = 'mobile_phone' UNION ALL
        SELECT 'shopping', 'supply', 'electronics', '⬤', 700 WHERE key = 'shop' AND value = 'electronics' UNION ALL
        SELECT 'shopping', 'supply', 'hifi', '⬤', 700 WHERE key = 'shop' AND value = 'hifi' UNION ALL
        SELECT 'shopping', 'supply', 'doityourself', '⬤', 700 WHERE key = 'shop' AND value = 'doityourself' UNION ALL
        SELECT 'shopping', 'supply', 'musical_instrument', '⬤', 700 WHERE key = 'shop' AND value = 'musical_instrument' UNION ALL
        SELECT 'shopping', 'supply', 'toys', '⬤', 700 WHERE key = 'shop' AND value = 'toys' UNION ALL
        SELECT 'shopping', 'supply', 'stationery', '⬤', 700 WHERE key = 'shop' AND value = 'stationery' UNION ALL
        SELECT 'shopping', 'supply', 'video', '⬤', 700 WHERE key = 'shop' AND value = 'video' UNION ALL
        SELECT 'shopping', 'supply', 'video_games', '⬤', 700 WHERE key = 'shop' AND value = 'video_games' UNION ALL
        SELECT 'shopping', 'supply', 'erotic', '⬤', 700 WHERE key = 'shop' AND value = 'erotic' UNION ALL
        SELECT 'shopping', 'supply', 'optician', '⬤', 700 WHERE key = 'shop' AND value = 'optician' UNION ALL
        SELECT 'shopping', 'supply', 'hearing_aids', '⬤', 700 WHERE key = 'shop' AND value = 'hearing_aids' UNION ALL
        SELECT 'shopping', 'supply', 'hardware', '⬤', 700 WHERE key = 'shop' AND value = 'hardware' UNION ALL
        SELECT 'shopping', 'supply', 'bed', '⬤', 700 WHERE key = 'shop' AND value = 'bed' UNION ALL
        SELECT 'shopping', 'supply', 'general', '⬤', 700 WHERE key = 'shop' AND value = 'general' UNION ALL
        SELECT 'shopping', 'supply', 'lamps', '⬤', 700 WHERE key = 'shop' AND value = 'lamps' UNION ALL
        SELECT 'shopping', 'supply', 'motorcycle', '⬤', 700 WHERE key = 'shop' AND value = 'motorcycle' UNION ALL
        SELECT 'shopping', 'supply', 'weapons', '⬤', 700 WHERE key = 'shop' AND value = 'weapons' UNION ALL
        SELECT 'shopping', 'supply', 'charity', '⬤', 700 WHERE key = 'shop' AND value = 'charity' UNION ALL
        SELECT 'shopping', 'supply', 'wholesale', '⬤', 700 WHERE key = 'shop' AND value = 'wholesale' UNION ALL
        SELECT 'shopping', 'fashion', 'boutique', '⬤', 700 WHERE key = 'shop' AND value = 'boutique' UNION ALL
        SELECT 'shopping', 'fashion', 'clothes', '⬤', 700 WHERE key = 'shop' AND value = 'clothes' UNION ALL
        SELECT 'shopping', 'fashion', 'second_hand', '⬤', 700 WHERE key = 'shop' AND value = 'second_hand' UNION ALL
        SELECT 'shopping', 'fashion', 'bag', '⬤', 700 WHERE key = 'shop' AND value = 'bag' UNION ALL
        SELECT 'shopping', 'fashion', 'watches', '⬤', 700 WHERE key = 'shop' AND value = 'watches' UNION ALL
        SELECT 'shopping', 'fashion', 'interior_decoration', '⬤', 700 WHERE key = 'shop' AND value = 'interior_decoration' UNION ALL
        SELECT 'shopping', 'fashion', 'jewelry', '⬤', 700 WHERE key = 'shop' AND value = 'jewelry' UNION ALL
        SELECT 'shopping', 'fashion', 'perfumery', '⬤', 700 WHERE key = 'shop' AND value = 'perfumery' UNION ALL
        SELECT 'shopping', 'fashion', 'cosmetics', '⬤', 700 WHERE key = 'shop' AND value = 'cosmetics' UNION ALL
        SELECT 'shopping', 'fashion', 'fabric', '⬤', 700 WHERE key = 'shop' AND value = 'fabric' UNION ALL
        SELECT 'shopping', 'fashion', 'perfume', '⬤', 700 WHERE key = 'shop' AND value = 'perfume' UNION ALL
        SELECT 'shopping', 'fashion', 'accessories', '⬤', 700 WHERE key = 'shop' AND value = 'accessories' UNION ALL
        SELECT 'shopping', 'fashion', 'shoes', '⬤', 700 WHERE key = 'shop' AND value = 'shoes' UNION ALL
        SELECT 'shopping', 'fashion', 'gift', '⬤', 700 WHERE key = 'shop' AND value = 'gift' UNION ALL
        SELECT 'shopping', 'fashion', 'tattoo', '⬤', 700 WHERE key = 'shop' AND value = 'tattoo' UNION ALL
        SELECT 'shopping', 'culture', 'art', '⬤', 600 WHERE key = 'shop' AND value = 'art' UNION ALL
        SELECT 'shopping', 'culture', 'antiques', '⬤', 600 WHERE key = 'shop' AND value = 'antiques' UNION ALL
        SELECT 'shopping', 'culture', 'music', '⬤', 600 WHERE key = 'shop' AND value = 'music' UNION ALL
        SELECT 'shopping', 'culture', 'books', '⬤', 600 WHERE key = 'shop' AND value = 'books' UNION ALL
        SELECT 'shopping', 'animals', 'pet', '⬤', 1000 WHERE key = 'shop' AND value = 'pet' UNION ALL
        SELECT 'shopping', 'animals', 'pet_grooming', '⬤', 1000 WHERE key = 'shop' AND value = 'pet_grooming' UNION ALL
        SELECT key, value, NULL, NULL, NULL
    ) AS t(superclass, class, subclass, style, priority)
    ORDER BY priority
    LIMIT 1
$$ LANGUAGE SQL IMMUTABLE;
