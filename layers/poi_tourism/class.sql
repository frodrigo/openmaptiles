CREATE OR REPLACE FUNCTION poi_tourism_class(key TEXT, value TEXT, tags hstore) RETURNS TABLE (
    superclass TEXT,
    class TEXT,
    subclass TEXT,
    zoom INTEGER,
    style TEXT,
    priority INTEGER
) AS $$
    SELECT * FROM (
        SELECT 'local_products', 'oil_mill', NULL, 18, '⬤', 500 WHERE key = 'craft' AND value = 'oil_mill' UNION ALL
        SELECT 'local_products', 'farm', NULL, 18, '⬤', 500 WHERE key = 'shop' AND value = 'farm' UNION ALL
        SELECT 'local_products', 'carpet', NULL, 18, '⬤', 500 WHERE key = 'shop' AND value = 'carpet' UNION ALL
        SELECT 'local_products', 'alcohol', NULL, 18, '⬤', 500 WHERE key = 'shop' AND value = 'alcohol' UNION ALL
        SELECT 'local_products', 'chocolate', NULL, 18, '⬤', 500 WHERE key = 'shop' AND value = 'chocolate' UNION ALL
        SELECT 'local_products', 'deli', NULL, 18, '⬤', 500 WHERE key = 'shop' AND value = 'deli' UNION ALL
        SELECT 'local_products', 'tailor', NULL, 18, '⬤', 500 WHERE key = 'shop' AND value = 'tailor' UNION ALL
        SELECT 'local_products', 'craft', 'beekeeper', 18, '⬤', 500 WHERE key = 'craft' AND value = 'beekeeper' UNION ALL
        SELECT 'local_products', 'craft', 'handicraft', 18, '⬤', 500 WHERE key = 'craft' AND value = 'handicraft' UNION ALL
        SELECT 'local_products', 'craft', 'basket_maker', 18, '⬤', 500 WHERE key = 'craft' AND value = 'basket_maker' UNION ALL
        SELECT 'local_products', 'craft', 'brewery', 18, '⬤', 500 WHERE key = 'craft' AND value = 'brewery' UNION ALL
        SELECT 'local_products', 'craft', 'luthier', 18, '⬤', 500 WHERE key = 'craft' AND value = 'luthier' UNION ALL
        SELECT 'local_products', 'craft', 'jeweller ', 18, '⬤', 500 WHERE key = 'craft' AND value = 'jeweller ' UNION ALL
        SELECT 'local_products', 'craft', 'distillery', 18, '⬤', 500 WHERE key = 'craft' AND value = 'distillery' UNION ALL
        SELECT 'local_products', 'craft', 'grinding_mill', 18, '⬤', 500 WHERE key = 'craft' AND value = 'grinding_mill' UNION ALL
        SELECT 'local_products', 'craft', 'pottery', 18, '⬤', 500 WHERE key = 'craft' AND value = 'pottery' UNION ALL
        SELECT 'local_products', 'craft', 'leather', 18, '⬤', 500 WHERE key = 'craft' AND value = 'leather' UNION ALL
        SELECT 'local_products', 'craft', 'sculptor ', 18, '⬤', 500 WHERE key = 'craft' AND value = 'sculptor ' UNION ALL
        SELECT 'local_products', 'craft', 'winery', 18, '⬤', 500 WHERE key = 'craft' AND value = 'winery' UNION ALL
        SELECT 'convenience', 'supermarket', NULL, 16, '⬤', 600 WHERE key = 'shop' AND value = 'supermarket' UNION ALL
        SELECT 'convenience', 'convenience', NULL, 16, '⬤', 600 WHERE key = 'shop' AND value = 'convenience' UNION ALL
        SELECT 'convenience', 'greengrocer', NULL, 16, '⬤', 600 WHERE key = 'shop' AND value = 'greengrocer' UNION ALL
        SELECT 'convenience', 'bakery', NULL, 16, '⬤', 600 WHERE key = 'shop' AND value = 'bakery' UNION ALL
        SELECT 'convenience', 'tobacco', NULL, 16, '⬤', 600 WHERE key = 'shop' AND value = 'tobacco' UNION ALL
        SELECT 'convenience', 'newsagent', NULL, 16, '⬤', 600 WHERE key = 'shop' AND value = 'newsagent' UNION ALL
        SELECT 'convenience', 'photo', NULL, 16, '⬤', 600 WHERE key = 'shop' AND value = 'photo' UNION ALL
        SELECT 'convenience', 'kiosk', NULL, 16, '⬤', 600 WHERE key = 'shop' AND value = 'kiosk' UNION ALL
        SELECT 'convenience', 'chemist', NULL, 16, '⬤', 600 WHERE key = 'shop' AND value = 'chemist' UNION ALL
        SELECT 'convenience', 'marketplace', NULL, 16, '⬤', 600 WHERE key = 'amenity' AND value = 'marketplace' UNION ALL
        SELECT 'convenience', 'sports', NULL, 16, '⬤', 600 WHERE key = 'shop' AND value = 'sports' UNION ALL
        SELECT 'convenience', 'butcher', NULL, 16, '⬤', 600 WHERE key = 'shop' AND value = 'butcher' UNION ALL
        SELECT 'convenience', 'hairdresser', NULL, 16, '⬤', 600 WHERE key = 'shop' AND value = 'hairdresser' UNION ALL
        SELECT 'convenience', 'seefood', NULL, 16, '⬤', 600 WHERE key = 'shop' AND value = 'seefood' UNION ALL
        SELECT 'convenience', 'florist', NULL, 19, '⬤', 600 WHERE key = 'shop' AND value = 'florist' UNION ALL
        SELECT 'local_services', 'bank', NULL, 16, '⬤', 700 WHERE key = 'amenity' AND value = 'bank' UNION ALL
        SELECT 'local_services', 'atm', NULL, 19, '•', 700 WHERE key = 'amenity' AND value = 'atm' UNION ALL
        SELECT 'local_services', 'post_office', NULL, 16, '⬤', 700 WHERE key = 'amenity' AND value = 'post_office' UNION ALL
        SELECT 'local_services', 'laundry', NULL, 18, '⬤', 700 WHERE key = 'shop' AND value = 'laundry' UNION ALL
        SELECT 'local_services', 'dry_cleaning', NULL, 18, '⬤', 700 WHERE key = 'shop' AND value = 'dry_cleaning' UNION ALL
        SELECT 'local_services', 'massage', NULL, 18, NULL, 700 WHERE key = 'shop' AND value = 'massage' UNION ALL
        SELECT 'local_services', 'estate_agent', NULL, 18, '⬤', 700 WHERE key = 'office' AND value = 'estate_agent' UNION ALL
        SELECT 'local_services', 'fuel', NULL, 15, '⬤', 700 WHERE key = 'amenity' AND value = 'fuel' UNION ALL
        SELECT 'local_services', 'car_repair', NULL, 18, '⬤', 700 WHERE key = 'shop' AND value = 'car_repair' UNION ALL
        SELECT 'local_services', 'car_parts', NULL, 18, '⬤', 700 WHERE key = 'shop' AND value = 'car_parts' UNION ALL
        SELECT 'local_services', 'office', NULL, 12, '⬤', 700 WHERE key = 'information' AND value = 'office' UNION ALL
        SELECT 'local_services', 'townhall', NULL, 14, '•', 700 WHERE key = 'amenity' AND value = 'townhall' UNION ALL
        SELECT 'local_services', 'copyshop', NULL, 19, '⬤', 700 WHERE key = 'shop' AND value = 'copyshop' UNION ALL
        SELECT 'local_services', 'ticket', NULL, 17, '⬤', 700 WHERE key = 'shop' AND value = 'ticket' UNION ALL
        SELECT 'local_services', 'travel_agency', NULL, 18, '⬤', 700 WHERE key = 'shop' AND value = 'travel_agency' UNION ALL
        SELECT 'safety', 'care', 'pharmacy', 14, '⬤', 50 WHERE key = 'amenity' AND value = 'pharmacy' UNION ALL
        SELECT 'safety', 'care', 'doctors', 17, '•', 50 WHERE key = 'amenity' AND value = 'doctors' AND (tags?'healthcare:speciality' AND tags->'healthcare:speciality' != 'no') UNION ALL
        SELECT 'safety', 'care', 'dentist', 17, '•', 50 WHERE key = 'amenity' AND value = 'dentist' UNION ALL
        SELECT 'safety', 'care', 'physiotherapist', 17, '•', 50 WHERE key = 'healthcare' AND value = 'physiotherapist' UNION ALL
        SELECT 'safety', 'care', 'veterinary', 17, '•', 50 WHERE key = 'amenity' AND value = 'veterinary' UNION ALL
        SELECT 'safety', 'emergency', 'hospital', 12, '⬤', 0 WHERE key = 'amenity' AND value = 'hospital' AND (tags?'emergency' AND tags->'emergency' != 'no') UNION ALL
        SELECT 'safety', 'emergency', 'clinic', 12, '⬤', 0 WHERE key = 'amenity' AND value = 'clinic' AND (tags?'emergency' AND tags->'emergency' != 'no') UNION ALL
        SELECT 'safety', 'emergency', 'defibrillator', 17, '⬤', 0 WHERE key = 'emergency' AND value = 'defibrillator' UNION ALL
        SELECT 'safety', 'rescue', 'water_rescue_station', 12, '⬤', 0 WHERE key = 'emergency' AND value = 'water_rescue_station' UNION ALL
        SELECT 'safety', 'rescue', 'lifeguard_base', 12, '⬤', 0 WHERE key = 'emergency' AND value = 'lifeguard_base' UNION ALL
        SELECT 'safety', 'rescue', 'life_ring', 19, '•', 4 WHERE key = 'emergency' AND value = 'life_ring' UNION ALL
        SELECT 'safety', 'rescue', 'life_ring', 19, '•', 4 WHERE key = 'amenity' AND value = 'life_ring' UNION ALL
        SELECT 'safety', 'rescue', 'mountain_rescue', 12, '⬤', 0 WHERE key = 'emergency' AND value = 'mountain_rescue' UNION ALL
        SELECT 'safety', 'rescue', 'police', 12, '⬤', 0 WHERE key = 'amenity' AND value = 'police' UNION ALL
        SELECT 'safety', 'rescue', 'fire_station', 12, '⬤', 0 WHERE key = 'amenity' AND value = 'fire_station' UNION ALL
        SELECT 'mobility', 'charging_station', NULL, 16, '•', 200 WHERE key = 'amenity' AND value = 'charging_station' AND (tags?'byclicle' AND tags->'byclicle' != 'no') AND (tags?'car' AND tags->'car' != 'no') AND (tags?'scooter' AND tags->'scooter' != 'no') UNION ALL
        SELECT 'mobility', 'railway', 'station', 13, '◯', 60 WHERE key = 'railway' AND value = 'station' UNION ALL
        SELECT 'mobility', 'railway', 'halt', 16, '◯', 60 WHERE key = 'railway' AND value = 'halt' UNION ALL
        SELECT 'mobility', 'railway', 'train_station_entrance', 19, '•', 60 WHERE key = 'railway' AND value = 'train_station_entrance' UNION ALL
        SELECT 'mobility', 'railway', 'subway_entrance', 19, '◯', 60 WHERE key = 'railway' AND value = 'subway_entrance' UNION ALL
        SELECT 'mobility', 'railway', 'tram_stop', 17, '◯', 60 WHERE key = 'railway' AND value = 'tram_stop' UNION ALL
        SELECT 'mobility', 'motorway', 'bus_station', 13, '◯', 70 WHERE key = 'amenity' AND value = 'bus_station' UNION ALL
        SELECT 'mobility', 'motorway', 'bus_stop', 13, '◯', 70 WHERE key = 'highway' AND value = 'bus_stop' UNION ALL
        SELECT 'mobility', 'motorway', 'parking', 13, '◯', 70 WHERE key = 'amenity' AND value = 'parking' AND (tags?'access' AND tags->'access' != 'no') UNION ALL
        SELECT 'mobility', 'motorway', 'car_pooling', 17, '◯', 70 WHERE key = 'amenity' AND value = 'car_pooling' UNION ALL
        SELECT 'mobility', 'motorway', 'taxi', 13, '◯', 70 WHERE key = 'amenity' AND value = 'taxi' UNION ALL
        SELECT 'mobility', 'motorway', 'motorway_junction', 12, '•', 70 WHERE key = 'highway' AND value = 'motorway_junction' AND (tags?'ref' AND tags->'ref' != 'no') UNION ALL
        SELECT 'mobility', 'motorway', 'toll_booth', 12, '•', 70 WHERE key = 'barrier' AND value = 'toll_booth' UNION ALL
        SELECT 'mobility', 'aeroway', 'aerodrome', 11, '◯', 0 WHERE key = 'aeroway' AND value = 'aerodrome' AND (tags?'aerodrome:international' AND tags->'aerodrome:international' != 'no') UNION ALL
        SELECT 'mobility', 'waterway', 'ferry_terminal', 13, '◯', 60 WHERE key = 'amenity' AND value = 'ferry_terminal' UNION ALL
        SELECT 'mobility', 'waterway', 'dock', 19, '•', 60 WHERE key = 'waterway' AND value = 'dock' UNION ALL
        SELECT 'mobility', 'bicycle', 'bicycle', 16, '⬤', 200 WHERE key = 'shop' AND value = 'bicycle' AND (tags?'service:bicycle:rental' AND tags->'service:bicycle:rental' != 'no') UNION ALL
        SELECT 'mobility', 'bicycle', 'bicycle_parking', 17, '◯', 200 WHERE key = 'amenity' AND value = 'bicycle_parking' UNION ALL
        SELECT 'mobility', 'bicycle', 'motorcycle_parking', 17, '◯', 200 WHERE key = 'amenity' AND value = 'motorcycle_parking' UNION ALL
        SELECT 'mobility', 'bicycle', 'bicycle_rental', 16, '◯', 200 WHERE key = 'amenity' AND value = 'bicycle_rental' UNION ALL
        SELECT 'mobility', 'bicycle', 'compressed_air', 19, '•', 200 WHERE key = 'amenity' AND value = 'compressed_air' UNION ALL
        SELECT 'mobility', 'bicycle', 'cycle_barrier', 19, '•', 200 WHERE key = 'barrier' AND value = 'cycle_barrier' UNION ALL
        SELECT 'amenity_local', 'playground', NULL, 16, '⬤', 500 WHERE key = 'leisure' AND value = 'playground' UNION ALL
        SELECT 'amenity_local', 'bench', NULL, 19, '•', 1000 WHERE key = 'amenity' AND value = 'bench' UNION ALL
        SELECT 'amenity_local', 'stile', NULL, 19, '•', 1000 WHERE key = 'barrier' AND value = 'stile' UNION ALL
        SELECT 'amenity_local', 'information', 'post_box', 19, '•', 1000 WHERE key = 'amenity' AND value = 'post_box' UNION ALL
        SELECT 'amenity_local', 'information', 'telephone', 19, '•', 1000 WHERE key = 'amenity' AND value = 'telephone' UNION ALL
        SELECT 'amenity_local', 'information', NULL, 14, '•', 300 WHERE key = 'tourism' AND value = 'information' AND (tags?'information:board' AND tags->'information:board' != 'no') UNION ALL
        SELECT 'amenity_local', 'sanitary', 'shower', 19, '◯', 1000 WHERE key = 'amenity' AND value = 'shower' UNION ALL
        SELECT 'amenity_local', 'sanitary', 'drinking_water', 14, '◯', 300 WHERE key = 'amenity' AND value = 'drinking_water' UNION ALL
        SELECT 'amenity_local', 'sanitary', 'toilets', 14, '◯', 300 WHERE key = 'amenity' AND value = 'toilets' AND (tags?'access' AND tags->'access' != 'no') UNION ALL
        SELECT 'amenity_local', 'picnic', 'picnic_site', 14, '⬤', 300 WHERE key = 'tourism' AND value = 'picnic_site' UNION ALL
        SELECT 'amenity_local', 'picnic', 'picnic_table', 19, '•', 1000 WHERE key = 'leisure' AND value = 'picnic_table' UNION ALL
        SELECT 'amenity_local', 'picnic', 'firepit', 19, '•', 1000 WHERE key = 'leisure' AND value = 'firepit' UNION ALL
        SELECT 'amenity_local', 'picnic', 'bbq', 19, '•', 1000 WHERE key = 'amenity' AND value = 'bbq' UNION ALL
        SELECT 'amenity_local', 'hut', 'alpine_hut', 12, '⬤', 100 WHERE key = 'tourism' AND value = 'alpine_hut' UNION ALL
        SELECT 'amenity_local', 'hut', 'wilderness_hut', 12, '⬤', 100 WHERE key = 'tourism' AND value = 'wilderness_hut' UNION ALL
        SELECT 'amenity_local', 'hut', 'shelter', 12, '•', 100 WHERE key = 'amenity' AND value = 'shelter' UNION ALL
        SELECT 'amenity_local', 'waste', 'recycling', 10, '⬤', 300 WHERE key = 'amentiy' AND value = 'recycling' AND (tags?'recycling_type' AND tags->'recycling_type' != 'no') UNION ALL
        SELECT 'amenity_local', 'waste', 'recycling', 17, '•', 800 WHERE key = 'amentiy' AND value = 'recycling' AND (tags?'recycling_type' AND tags->'recycling_type' != 'no') UNION ALL
        SELECT 'amenity_local', 'waste', 'waste_disposal', 19, '•', 1000 WHERE key = 'amenity' AND value = 'waste_disposal' UNION ALL
        SELECT 'amenity_local', 'waste', 'waste_basket', 19, '•', 1000 WHERE key = 'amenity' AND value = 'waste_basket' UNION ALL
        SELECT 'amenity_local', 'waste', 'vending_machine', 19, '•', 1000 WHERE key = 'amenity' AND value = 'vending_machine' AND (tags?'vending:excrement_bags' AND tags->'vending:excrement_bags' != 'no') UNION ALL
        SELECT 'amenity_local', 'waste', 'waste_basket', 19, '•', 1000 WHERE key = 'amenity' AND value = 'waste_basket' AND (tags?'waste' AND tags->'waste' != 'no') UNION ALL
        SELECT 'remarkable', 'attraction_activity', 'attraction', 13, '⬤', 0 WHERE key = 'tourism' AND value = 'attraction' UNION ALL
        SELECT 'remarkable', 'attraction_activity', 'aquarium', 13, '⬤', 0 WHERE key = 'tourism' AND value = 'aquarium' UNION ALL
        SELECT 'remarkable', 'attraction_activity', 'theme_park', 13, '⬤', 0 WHERE key = 'tourism' AND value = 'theme_park' UNION ALL
        SELECT 'remarkable', 'attraction_activity', 'water_park', 13, '⬤', 0 WHERE key = 'tourism' AND value = 'water_park' UNION ALL
        SELECT 'remarkable', 'attraction_activity', 'zoo', 13, '⬤', 0 WHERE key = 'tourism' AND value = 'zoo' UNION ALL
        SELECT 'remarkable', 'attraction_activity', 'wiewpoint', 14, '⬤', 100 WHERE key = 'tourism' AND value = 'wiewpoint' UNION ALL
        SELECT 'remarkable', 'park', 'garden', 13, '⬤', 300 WHERE key = 'leisure' AND value = 'garden' UNION ALL
        SELECT 'remarkable', 'park', 'park', 13, '⬤', 30 WHERE key = 'leisure' AND value = 'park' AND (tags?'access' AND tags->'access' != 'no') UNION ALL
        SELECT 'remarkable', 'natural_activity', 'beach_resort', 13, '⬤', 0 WHERE key = 'leisure' AND value = 'beach_resort' UNION ALL
        SELECT 'remarkable', 'natural_activity', 'peak', 12, '•', 0 WHERE key = 'natural' AND value = 'peak' UNION ALL
        SELECT 'remarkable', 'natural_activity', 'nature_reserve', 10, '⬤', 0 WHERE key = 'leisure' AND value = 'nature_reserve' UNION ALL
        SELECT 'remarkable', 'natural_activity', 'protected_area', 10, '⬤', 0 WHERE key = 'boundary' AND value = 'protected_area' UNION ALL
        SELECT 'remarkable', 'hide', 'wildlife_hide', 17, '•', 100 WHERE key = 'leisure' AND value = 'wildlife_hide' UNION ALL
        SELECT 'remarkable', 'hide', 'bird_hide', 17, '•', 100 WHERE key = 'leisure' AND value = 'bird_hide' UNION ALL
        SELECT 'remarkable', 'hide', 'tower', 17, '•', 100 WHERE key = 'man_made' AND value = 'tower' AND (tags?'tower:type' AND tags->'tower:type' != 'no') UNION ALL
        SELECT 'remarkable', 'outdoor_activity', 'swimming_area', 14, '⬤', 0 WHERE key = 'leisure' AND value = 'swimming_area' UNION ALL
        SELECT 'remarkable', 'outdoor_activity', 'winter_sports', 14, '⬤', 0 WHERE key = 'landuse' AND value = 'winter_sports' UNION ALL
        SELECT 'remarkable', 'outdoor_activity', 'marina', 14, '⬤', 0 WHERE key = 'leisure' AND value = 'marina' UNION ALL
        SELECT 'remarkable', 'outdoor_activity', 'fishing', 14, '⬤', 0 WHERE key = 'leisure' AND value = 'fishing' UNION ALL
        SELECT 'remarkable', 'outdoor_activity', 'stadium', 14, '⬤', 30 WHERE key = 'leisure' AND value = 'stadium' UNION ALL
        SELECT 'culture', 'artwork', NULL, 18, '•', 800 WHERE key = 'tourism' AND value = 'artwork' UNION ALL
        SELECT 'culture', 'visit', 'place_of_worship', 14, '⬤', 30 WHERE key = 'amenity' AND value = 'place_of_worship' UNION ALL
        SELECT 'culture', 'visit', 'arts_centre', 17, '⬤', 30 WHERE key = 'amenity' AND value = 'arts_centre' UNION ALL
        SELECT 'culture', 'visit', 'museum', 14, '⬤', 0 WHERE key = 'tourism' AND value = 'museum' UNION ALL
        SELECT 'culture', 'historic', 'castle', 14, '⬤', 30 WHERE key = 'historic' AND value = 'castle' UNION ALL
        SELECT 'culture', 'historic', 'monument', 14, '⬤', 30 WHERE key = 'historic' AND value = 'monument' UNION ALL
        SELECT 'culture', 'historic', 'memorial', 19, '•', 800 WHERE key = 'historic' AND value = 'memorial' UNION ALL
        SELECT 'culture', 'historic', 'archaeological_site', 14, '⬤', 30 WHERE key = 'historic' AND value = 'archaeological_site' UNION ALL
        SELECT 'culture', 'historic', 'castle_wall', 14, NULL, 800 WHERE key = 'historic' AND value = 'castle_wall' UNION ALL
        SELECT 'culture', 'historic', 'city_wall', 14, NULL, 800 WHERE key = 'barrier' AND value = 'city_wall' UNION ALL
        SELECT 'culture', 'historic', 'church', 14, NULL, 800 WHERE key = 'historic' AND value = 'church' UNION ALL
        SELECT 'culture', 'historic', 'city_gate', 14, '•', 800 WHERE key = 'historic' AND value = 'city_gate' UNION ALL
        SELECT 'culture', 'historic', 'wayside_cross', 18, '•', 800 WHERE key = 'historic' AND value = 'wayside_cross' UNION ALL
        SELECT 'culture', 'historic', 'wayside_shrine', 19, '•', 800 WHERE key = 'historic' AND value = 'wayside_shrine' UNION ALL
        SELECT 'culture', 'show', 'theatre', 15, '⬤', 100 WHERE key = 'amenity' AND value = 'theatre' UNION ALL
        SELECT 'culture', 'show', 'cinema', 15, '⬤', 100 WHERE key = 'amenity' AND value = 'cinema' UNION ALL
        SELECT 'culture', 'show', 'gallery', 18, '⬤', 100 WHERE key = 'tourism' AND value = 'gallery' UNION ALL
        SELECT 'hosting', 'hotel', 'hotel', 15, '⬤', 30 WHERE key = 'tourism' AND value = 'hotel' UNION ALL
        SELECT 'hosting', 'hotel', 'motel', 15, '⬤', 30 WHERE key = 'tourism' AND value = 'motel' UNION ALL
        SELECT 'hosting', 'hotel', 'hostel', 15, '⬤', 30 WHERE key = 'tourism' AND value = 'hostel' UNION ALL
        SELECT 'hosting', 'hotel', 'guest_house', 17, '⬤', 30 WHERE key = 'tourism' AND value = 'guest_house' UNION ALL
        SELECT 'hosting', 'resort', 'apartment', 15, '⬤', 30 WHERE key = 'tourism' AND value = 'apartment' UNION ALL
        SELECT 'hosting', 'resort', 'camp_site', 15, '⬤', 30 WHERE key = 'tourism' AND value = 'camp_site' UNION ALL
        SELECT 'hosting', 'resort', 'caravan_site', 15, '⬤', 30 WHERE key = 'tourism' AND value = 'caravan_site' UNION ALL
        SELECT 'hosting', 'resort', 'resort', 15, '⬤', 30 WHERE key = 'leisure' AND value = 'resort' UNION ALL
        SELECT 'hosting', 'rental', 'chalet', 17, '⬤', 30 WHERE key = 'tourism' AND value = 'chalet' UNION ALL
        SELECT 'hosting', 'rental', 'apartment', 18, '•', 30 WHERE key = 'tourism' AND value = 'apartment' UNION ALL
        SELECT 'catering', 'food', 'restaurant', 16, '⬤', 40 WHERE key = 'amenity' AND value = 'restaurant' UNION ALL
        SELECT 'catering', 'food', 'fast_food', 17, '⬤', 40 WHERE key = 'amenity' AND value = 'fast_food' UNION ALL
        SELECT 'catering', 'food', 'food_court', 17, '⬤', 40 WHERE key = 'amenity' AND value = 'food_court' UNION ALL
        SELECT 'catering', 'food', 'pastry', 17, '⬤', 40 WHERE key = 'shop' AND value = 'pastry' AND (tags?'?' AND tags->'?' != 'no') UNION ALL
        SELECT 'catering', 'food', 'ice_cream', 18, '⬤', 40 WHERE key = 'amenity' AND value = 'ice_cream' UNION ALL
        SELECT 'catering', 'drink', 'pub', 17, '⬤', 50 WHERE key = 'amenity' AND value = 'pub' UNION ALL
        SELECT 'catering', 'drink', 'bar', 17, '⬤', 50 WHERE key = 'amenity' AND value = 'bar' UNION ALL
        SELECT 'catering', 'drink', 'cafe', 17, '⬤', 50 WHERE key = 'amenity' AND value = 'cafe' UNION ALL
        SELECT 'leisure', 'community_centre', NULL, 17, '•', 200 WHERE key = 'amenity' AND value = 'community_centre' UNION ALL
        SELECT 'leisure', 'nightclub', NULL, 17, '⬤', 200 WHERE key = 'amenity' AND value = 'nightclub' UNION ALL
        SELECT 'leisure', 'swimming_pool', NULL, 14, '⬤', 200 WHERE key = 'leisure' AND value = 'swimming_pool' AND (tags?'access' AND tags->'access' != 'no') UNION ALL
        SELECT 'leisure', 'golf_course', NULL, 14, '⬤', 200 WHERE key = 'leisure' AND value = 'golf_course' UNION ALL
        SELECT 'leisure', 'ice_ring', NULL, 14, '⬤', 200 WHERE key = 'leisure' AND value = 'ice_ring' UNION ALL
        SELECT 'leisure', 'horse_riding', NULL, 14, '⬤', 200 WHERE key = 'leisure' AND value = 'horse_riding' UNION ALL
        SELECT 'leisure', 'miniature_golf', NULL, 16, '⬤', 200 WHERE key = 'leisure' AND value = 'miniature_golf' UNION ALL
        SELECT 'leisure', 'pitch', NULL, 14, '•', 200 WHERE key = 'leisure' AND value = 'pitch' UNION ALL
        SELECT 'leisure', 'sport', 'athletics', 18, '•', 500 WHERE key = 'sport' AND value = 'athletics' UNION ALL
        SELECT 'leisure', 'sport', 'badminton', 18, '•', 500 WHERE key = 'sport' AND value = 'badminton' UNION ALL
        SELECT 'leisure', 'sport', 'basketball', 18, '•', 500 WHERE key = 'sport' AND value = 'basketball' UNION ALL
        SELECT 'leisure', 'sport', 'beachvolleyball', 18, '•', 500 WHERE key = 'sport' AND value = 'beachvolleyball' UNION ALL
        SELECT 'leisure', 'sport', 'bmx', 18, '•', 500 WHERE key = 'sport' AND value = 'bmx' UNION ALL
        SELECT 'leisure', 'sport', 'canoe', 18, '•', 500 WHERE key = 'sport' AND value = 'canoe' UNION ALL
        SELECT 'leisure', 'sport', 'climbing', 18, '•', 500 WHERE key = 'sport' AND value = 'climbing' UNION ALL
        SELECT 'leisure', 'sport', 'climbing_adventure', 18, '•', 500 WHERE key = 'sport' AND value = 'climbing_adventure' UNION ALL
        SELECT 'leisure', 'sport', 'bullfighting', 18, '•', 500 WHERE key = 'sport' AND value = 'bullfighting' UNION ALL
        SELECT 'leisure', 'sport', 'billiards', 18, '•', 500 WHERE key = 'sport' AND value = 'billiards' UNION ALL
        SELECT 'leisure', 'sport', 'boules', 18, '•', 500 WHERE key = 'sport' AND value = 'boules' UNION ALL
        SELECT 'leisure', 'sport', 'cycling', 18, '•', 500 WHERE key = 'sport' AND value = 'cycling' UNION ALL
        SELECT 'leisure', 'sport', 'equestrian', 18, '•', 500 WHERE key = 'sport' AND value = 'equestrian' UNION ALL
        SELECT 'leisure', 'sport', 'futsal', 18, '•', 500 WHERE key = 'sport' AND value = 'futsal' UNION ALL
        SELECT 'leisure', 'sport', 'diving', 18, '•', 500 WHERE key = 'sport' AND value = 'diving' UNION ALL
        SELECT 'leisure', 'sport', 'free_flying', 18, '•', 500 WHERE key = 'sport' AND value = 'free_flying' UNION ALL
        SELECT 'leisure', 'sport', 'golf', 18, '•', 500 WHERE key = 'sport' AND value = 'golf' UNION ALL
        SELECT 'leisure', 'sport', 'gymnastics', 18, '•', 500 WHERE key = 'sport' AND value = 'gymnastics' UNION ALL
        SELECT 'leisure', 'sport', 'handball', 18, '•', 500 WHERE key = 'sport' AND value = 'handball' UNION ALL
        SELECT 'leisure', 'sport', 'ice_hockey', 18, '•', 500 WHERE key = 'sport' AND value = 'ice_hockey' UNION ALL
        SELECT 'leisure', 'sport', 'horse_racing', 18, '•', 500 WHERE key = 'sport' AND value = 'horse_racing' UNION ALL
        SELECT 'leisure', 'sport', 'karting', 18, '•', 500 WHERE key = 'sport' AND value = 'karting' UNION ALL
        SELECT 'leisure', 'sport', 'kitesurfing', 18, '•', 500 WHERE key = 'sport' AND value = 'kitesurfing' UNION ALL
        SELECT 'leisure', 'sport', 'motocross', 18, '•', 500 WHERE key = 'sport' AND value = 'motocross' UNION ALL
        SELECT 'leisure', 'sport', 'motor', 18, '•', 500 WHERE key = 'sport' AND value = 'motor' UNION ALL
        SELECT 'leisure', 'sport', 'multi', 18, '•', 500 WHERE key = 'sport' AND value = 'multi' UNION ALL
        SELECT 'leisure', 'sport', 'orienteering', 18, '•', 500 WHERE key = 'sport' AND value = 'orienteering' UNION ALL
        SELECT 'leisure', 'sport', 'paddle_tennis', 18, '•', 500 WHERE key = 'sport' AND value = 'paddle_tennis' UNION ALL
        SELECT 'leisure', 'sport', 'paintball', 18, '•', 500 WHERE key = 'sport' AND value = 'paintball' UNION ALL
        SELECT 'leisure', 'sport', 'pelota', 18, '•', 500 WHERE key = 'sport' AND value = 'pelota' UNION ALL
        SELECT 'leisure', 'sport', 'racquet', 18, '•', 500 WHERE key = 'sport' AND value = 'racquet' UNION ALL
        SELECT 'leisure', 'sport', 'rowing', 18, '•', 500 WHERE key = 'sport' AND value = 'rowing' UNION ALL
        SELECT 'leisure', 'sport', 'rugby', 18, '•', 500 WHERE key = 'sport' AND value = 'rugby' UNION ALL
        SELECT 'leisure', 'sport', 'rugby_league', 18, '•', 500 WHERE key = 'sport' AND value = 'rugby_league' UNION ALL
        SELECT 'leisure', 'sport', 'rugby_union', 18, '•', 500 WHERE key = 'sport' AND value = 'rugby_union' UNION ALL
        SELECT 'leisure', 'sport', 'running', 18, '•', 500 WHERE key = 'sport' AND value = 'running' UNION ALL
        SELECT 'leisure', 'sport', 'sailing', 18, '•', 500 WHERE key = 'sport' AND value = 'sailing' UNION ALL
        SELECT 'leisure', 'sport', 'scuba_diving', 18, '•', 500 WHERE key = 'sport' AND value = 'scuba_diving' UNION ALL
        SELECT 'leisure', 'sport', 'shooting', 18, '•', 500 WHERE key = 'sport' AND value = 'shooting' UNION ALL
        SELECT 'leisure', 'sport', 'skateboard', 18, '•', 500 WHERE key = 'sport' AND value = 'skateboard' UNION ALL
        SELECT 'leisure', 'sport', 'soccer', 18, '•', 500 WHERE key = 'sport' AND value = 'soccer' UNION ALL
        SELECT 'leisure', 'sport', 'surfing', 18, '•', 500 WHERE key = 'sport' AND value = 'surfing' UNION ALL
        SELECT 'leisure', 'sport', 'swimming', 18, '•', 500 WHERE key = 'sport' AND value = 'swimming' UNION ALL
        SELECT 'leisure', 'sport', 'table_soccer', 18, '•', 500 WHERE key = 'sport' AND value = 'table_soccer' UNION ALL
        SELECT 'leisure', 'sport', 'table_tennis', 18, '•', 500 WHERE key = 'sport' AND value = 'table_tennis' UNION ALL
        SELECT 'leisure', 'sport', 'tennis', 18, '•', 500 WHERE key = 'sport' AND value = 'tennis' UNION ALL
        SELECT 'leisure', 'sport', 'volleyball', 18, '•', 500 WHERE key = 'sport' AND value = 'volleyball' UNION ALL
        SELECT 'leisure', 'sport', 'water_ski', 18, '•', 500 WHERE key = 'sport' AND value = 'water_ski' UNION ALL
        SELECT 'leisure', 'sport', 'yoga', 18, '•', 500 WHERE key = 'sport' AND value = 'yoga' UNION ALL
        SELECT 'public_landmark', 'courthouse', NULL, 14, '•', 100 WHERE key = 'amenity' AND value = 'courthouse' UNION ALL
        SELECT 'public_landmark', 'embassy', NULL, 14, '•', 100 WHERE key = 'amenity' AND value = 'embassy' UNION ALL
        SELECT 'public_landmark', 'grave_yard', NULL, 14, '•', 100 WHERE key = 'amenity' AND value = 'grave_yard' UNION ALL
        SELECT 'public_landmark', 'cemetery', NULL, 14, '•', 100 WHERE key = 'landuse' AND value = 'cemetery' UNION ALL
        SELECT 'public_landmark', 'reservoir', NULL, 14, '•', 100 WHERE key = 'landuse' AND value = 'reservoir' UNION ALL
        SELECT 'public_landmark', 'library', NULL, 14, '•', 100 WHERE key = 'amenity' AND value = 'library' UNION ALL
        SELECT 'public_landmark', 'kindergarten', NULL, 14, '•', 100 WHERE key = 'amenity' AND value = 'kindergarten' AND (tags?'school:FR' AND tags->'school:FR' != 'no') UNION ALL
        SELECT 'public_landmark', 'school', NULL, 14, '•', 100 WHERE key = 'amenity' AND value = 'school' UNION ALL
        SELECT 'public_landmark', 'college', NULL, 14, '•', 100 WHERE key = 'amenity' AND value = 'college' UNION ALL
        SELECT 'public_landmark', 'university', NULL, 14, '•', 100 WHERE key = 'amenity' AND value = 'university' UNION ALL
        SELECT 'public_landmark', 'prison', NULL, 14, '•', 100 WHERE key = 'amenity' AND value = 'prison' UNION ALL
        SELECT 'public_landmark', 'mall', NULL, 14, '•', 100 WHERE key = 'shop' AND value = 'mall' UNION ALL
        SELECT 'public_landmark', 'border_control.', NULL, 14, '•', 100 WHERE key = 'barrier' AND value = 'border_control.' UNION ALL
        SELECT 'public_landmark', 'basin', NULL, 14, '•', 100 WHERE key = 'landuse' AND value = 'basin' UNION ALL
        SELECT 'public_landmark', 'brownfield', NULL, 14, '•', 100 WHERE key = 'landuse' AND value = 'brownfield' UNION ALL
        SELECT 'shopping', 'sport_supply', 'bicycle', 16, '⬤', 500 WHERE key = 'shop' AND value = 'bicycle' UNION ALL
        SELECT 'shopping', 'sport_supply', 'outdoor', 16, '⬤', 500 WHERE key = 'shop' AND value = 'outdoor' UNION ALL
        SELECT 'shopping', 'feed', 'coffee', 18, '⬤', 400 WHERE key = 'shop' AND value = 'coffee' UNION ALL
        SELECT 'shopping', 'feed', 'beverages', 18, '⬤', 400 WHERE key = 'shop' AND value = 'beverages' UNION ALL
        SELECT 'shopping', 'feed', 'confectionery', 18, '⬤', 400 WHERE key = 'shop' AND value = 'confectionery' UNION ALL
        SELECT 'shopping', 'feed', 'frozen_food', 18, '⬤', 400 WHERE key = 'shop' AND value = 'frozen_food' UNION ALL
        SELECT 'shopping', 'feed', 'ice_cream', 18, '⬤', 400 WHERE key = 'shop' AND value = 'ice_cream' UNION ALL
        SELECT 'shopping', 'supply', 'furniture', 18, '⬤', 700 WHERE key = 'shop' AND value = 'furniture' UNION ALL
        SELECT 'shopping', 'supply', 'computer', 18, '⬤', 700 WHERE key = 'shop' AND value = 'computer' UNION ALL
        SELECT 'shopping', 'supply', 'camera', 18, '⬤', 700 WHERE key = 'shop' AND value = 'camera' UNION ALL
        SELECT 'shopping', 'supply', 'mobile_phone', 18, '⬤', 700 WHERE key = 'shop' AND value = 'mobile_phone' UNION ALL
        SELECT 'shopping', 'supply', 'electronics', 18, '⬤', 700 WHERE key = 'shop' AND value = 'electronics' UNION ALL
        SELECT 'shopping', 'supply', 'hifi', 18, '⬤', 700 WHERE key = 'shop' AND value = 'hifi' UNION ALL
        SELECT 'shopping', 'supply', 'doityourself', 18, '⬤', 700 WHERE key = 'shop' AND value = 'doityourself' UNION ALL
        SELECT 'shopping', 'supply', 'musical_instrument', 18, '⬤', 700 WHERE key = 'shop' AND value = 'musical_instrument' UNION ALL
        SELECT 'shopping', 'supply', 'toys', 18, '⬤', 700 WHERE key = 'shop' AND value = 'toys' UNION ALL
        SELECT 'shopping', 'supply', 'stationery', 18, '⬤', 700 WHERE key = 'shop' AND value = 'stationery' UNION ALL
        SELECT 'shopping', 'supply', 'video', 18, '⬤', 700 WHERE key = 'shop' AND value = 'video' UNION ALL
        SELECT 'shopping', 'supply', 'video_games', 18, '⬤', 700 WHERE key = 'shop' AND value = 'video_games' UNION ALL
        SELECT 'shopping', 'supply', 'erotic', 18, '⬤', 700 WHERE key = 'shop' AND value = 'erotic' UNION ALL
        SELECT 'shopping', 'supply', 'optician', 18, '⬤', 700 WHERE key = 'shop' AND value = 'optician' UNION ALL
        SELECT 'shopping', 'supply', 'hearing_aids', 18, '⬤', 700 WHERE key = 'shop' AND value = 'hearing_aids' UNION ALL
        SELECT 'shopping', 'supply', 'hardware', 18, '⬤', 700 WHERE key = 'shop' AND value = 'hardware' UNION ALL
        SELECT 'shopping', 'supply', 'bed', 18, '⬤', 700 WHERE key = 'shop' AND value = 'bed' UNION ALL
        SELECT 'shopping', 'supply', 'general', 18, '⬤', 700 WHERE key = 'shop' AND value = 'general' UNION ALL
        SELECT 'shopping', 'supply', 'lamps', 18, '⬤', 700 WHERE key = 'shop' AND value = 'lamps' UNION ALL
        SELECT 'shopping', 'supply', 'motorcycle', 18, '⬤', 700 WHERE key = 'shop' AND value = 'motorcycle' UNION ALL
        SELECT 'shopping', 'supply', 'weapons', 18, '⬤', 700 WHERE key = 'shop' AND value = 'weapons' UNION ALL
        SELECT 'shopping', 'supply', 'charity', 18, '⬤', 700 WHERE key = 'shop' AND value = 'charity' UNION ALL
        SELECT 'shopping', 'supply', 'wholesale', 18, '⬤', 700 WHERE key = 'shop' AND value = 'wholesale' UNION ALL
        SELECT 'shopping', 'fashion', 'boutique', 18, '⬤', 700 WHERE key = 'shop' AND value = 'boutique' UNION ALL
        SELECT 'shopping', 'fashion', 'clothes', 18, '⬤', 700 WHERE key = 'shop' AND value = 'clothes' UNION ALL
        SELECT 'shopping', 'fashion', 'second_hand', 18, '⬤', 700 WHERE key = 'shop' AND value = 'second_hand' UNION ALL
        SELECT 'shopping', 'fashion', 'bag', 18, '⬤', 700 WHERE key = 'shop' AND value = 'bag' UNION ALL
        SELECT 'shopping', 'fashion', 'watches', 18, '⬤', 700 WHERE key = 'shop' AND value = 'watches' UNION ALL
        SELECT 'shopping', 'fashion', 'interior_decoration', 18, '⬤', 700 WHERE key = 'shop' AND value = 'interior_decoration' UNION ALL
        SELECT 'shopping', 'fashion', 'jewelry', 18, '⬤', 700 WHERE key = 'shop' AND value = 'jewelry' UNION ALL
        SELECT 'shopping', 'fashion', 'perfumery', 18, '⬤', 700 WHERE key = 'shop' AND value = 'perfumery' UNION ALL
        SELECT 'shopping', 'fashion', 'cosmetics', 18, '⬤', 700 WHERE key = 'shop' AND value = 'cosmetics' UNION ALL
        SELECT 'shopping', 'fashion', 'fabric', 18, '⬤', 700 WHERE key = 'shop' AND value = 'fabric' UNION ALL
        SELECT 'shopping', 'fashion', 'perfume', 18, '⬤', 700 WHERE key = 'shop' AND value = 'perfume' UNION ALL
        SELECT 'shopping', 'fashion', 'accessories', 18, '⬤', 700 WHERE key = 'shop' AND value = 'accessories' UNION ALL
        SELECT 'shopping', 'fashion', 'shoes', 18, '⬤', 700 WHERE key = 'shop' AND value = 'shoes' UNION ALL
        SELECT 'shopping', 'fashion', 'gift', 18, '⬤', 700 WHERE key = 'shop' AND value = 'gift' UNION ALL
        SELECT 'shopping', 'fashion', 'tattoo', 18, '⬤', 700 WHERE key = 'shop' AND value = 'tattoo' UNION ALL
        SELECT 'shopping', 'culture', 'art', 18, '⬤', 600 WHERE key = 'shop' AND value = 'art' UNION ALL
        SELECT 'shopping', 'culture', 'antiques', 18, '⬤', 600 WHERE key = 'shop' AND value = 'antiques' UNION ALL
        SELECT 'shopping', 'culture', 'music', 18, '⬤', 600 WHERE key = 'shop' AND value = 'music' UNION ALL
        SELECT 'shopping', 'culture', 'books', 18, '⬤', 600 WHERE key = 'shop' AND value = 'books' UNION ALL
        SELECT 'shopping', 'animals', 'pet', 18, '⬤', 1000 WHERE key = 'shop' AND value = 'pet' UNION ALL
        SELECT 'shopping', 'animals', 'pet_grooming', 18, '⬤', 1000 WHERE key = 'shop' AND value = 'pet_grooming' UNION ALL
        SELECT key, value, NULL, 14, NULL, NULL
    ) AS t(superclass, class, subclass, zoom, style, priority)
    ORDER BY priority
    LIMIT 1
$$
LANGUAGE SQL
IMMUTABLE PARALLEL SAFE;
