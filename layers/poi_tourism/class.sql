CREATE OR REPLACE FUNCTION poi_tourism_class(key TEXT, value TEXT, tags hstore) RETURNS TABLE (
    superclass TEXT,
    class TEXT,
    subclass TEXT,
    zoom INTEGER,
    style TEXT,
    priority INTEGER
) AS $$
    SELECT * FROM (
            SELECT 'local_products', 'oil_mill', NULL, 17, '⬤', 500 WHERE tags?'craft' AND tags->'craft' = 'oil_mill' UNION ALL
            SELECT 'local_products', 'farm', NULL, 16, '⬤', 500 WHERE tags?'shop' AND tags->'shop' = 'farm' UNION ALL
            SELECT 'local_products', 'carpet', NULL, 17, '⬤', 500 WHERE tags?'shop' AND tags->'shop' = 'carpet' UNION ALL
            SELECT 'local_products', 'alcohol', NULL, 17, '⬤', 500 WHERE tags?'shop' AND tags->'shop' = 'alcohol' UNION ALL
            SELECT 'local_products', 'chocolate', NULL, 17, '⬤', 500 WHERE tags?'shop' AND tags->'shop' = 'chocolate' UNION ALL
            SELECT 'local_products', 'deli', NULL, 17, '⬤', 500 WHERE tags?'shop' AND tags->'shop' = 'deli' UNION ALL
            SELECT 'local_products', 'tailor', NULL, 17, '⬤', 500 WHERE tags?'shop' AND tags->'shop' = 'tailor' UNION ALL
            SELECT 'local_products', 'craft', 'beekeeper', 17, '⬤', 500 WHERE tags?'craft' AND tags->'craft' = 'beekeeper' UNION ALL
            SELECT 'local_products', 'craft', 'handicraft', 17, '⬤', 500 WHERE tags?'craft' AND tags->'craft' = 'handicraft' UNION ALL
            SELECT 'local_products', 'craft', 'basket_maker', 17, '⬤', 500 WHERE tags?'craft' AND tags->'craft' = 'basket_maker' UNION ALL
            SELECT 'local_products', 'craft', 'brewery', 17, '⬤', 500 WHERE tags?'craft' AND tags->'craft' = 'brewery' UNION ALL
            SELECT 'local_products', 'craft', 'luthier', 17, '⬤', 500 WHERE tags?'craft' AND tags->'craft' = 'luthier' UNION ALL
            SELECT 'local_products', 'craft', 'jeweller ', 17, '⬤', 500 WHERE tags?'craft' AND tags->'craft' = 'jeweller ' UNION ALL
            SELECT 'local_products', 'craft', 'distillery', 17, '⬤', 500 WHERE tags?'craft' AND tags->'craft' = 'distillery' UNION ALL
            SELECT 'local_products', 'craft', 'grinding_mill', 17, '⬤', 500 WHERE tags?'craft' AND tags->'craft' = 'grinding_mill' UNION ALL
            SELECT 'local_products', 'craft', 'pottery', 17, '⬤', 500 WHERE tags?'craft' AND tags->'craft' = 'pottery' UNION ALL
            SELECT 'local_products', 'craft', 'leather', 17, '⬤', 500 WHERE tags?'craft' AND tags->'craft' = 'leather' UNION ALL
            SELECT 'local_products', 'craft', 'sculptor ', 17, '⬤', 500 WHERE tags?'craft' AND tags->'craft' = 'sculptor ' UNION ALL
            SELECT 'local_products', 'craft', 'winery', 17, '⬤', 500 WHERE tags?'craft' AND tags->'craft' = 'winery' UNION ALL
            SELECT 'convenience', 'supermarket', NULL, 18, '⬤', 600 WHERE tags?'shop' AND tags->'shop' = 'supermarket' UNION ALL
            SELECT 'convenience', 'convenience', NULL, 18, '⬤', 600 WHERE tags?'shop' AND tags->'shop' = 'convenience' UNION ALL
            SELECT 'convenience', 'greengrocer', NULL, 18, '⬤', 600 WHERE tags?'shop' AND tags->'shop' = 'greengrocer' UNION ALL
            SELECT 'convenience', 'bakery', NULL, 18, '⬤', 600 WHERE tags?'shop' AND tags->'shop' = 'bakery' UNION ALL
            SELECT 'convenience', 'tobacco', NULL, 18, '⬤', 600 WHERE tags?'shop' AND tags->'shop' = 'tobacco' UNION ALL
            SELECT 'convenience', 'newsagent', NULL, 17, '⬤', 600 WHERE tags?'shop' AND tags->'shop' = 'newsagent' UNION ALL
            SELECT 'convenience', 'photo', NULL, 18, '⬤', 600 WHERE tags?'shop' AND tags->'shop' = 'photo' UNION ALL
            SELECT 'convenience', 'kiosk', NULL, 18, '⬤', 600 WHERE tags?'shop' AND tags->'shop' = 'kiosk' UNION ALL
            SELECT 'convenience', 'chemist', NULL, 18, '⬤', 600 WHERE tags?'shop' AND tags->'shop' = 'chemist' UNION ALL
            SELECT 'convenience', 'marketplace', NULL, 16, '⬤', 600 WHERE tags?'amenity' AND tags->'amenity' = 'marketplace' UNION ALL
            SELECT 'convenience', 'sports', NULL, 18, '⬤', 600 WHERE tags?'shop' AND tags->'shop' = 'sports' UNION ALL
            SELECT 'convenience', 'butcher', NULL, 18, '⬤', 600 WHERE tags?'shop' AND tags->'shop' = 'butcher' UNION ALL
            SELECT 'convenience', 'hairdresser', NULL, 18, '⬤', 600 WHERE tags?'shop' AND tags->'shop' = 'hairdresser' UNION ALL
            SELECT 'convenience', 'seefood', NULL, 18, '⬤', 600 WHERE tags?'shop' AND tags->'shop' = 'seefood' UNION ALL
            SELECT 'convenience', 'florist', NULL, 18, '⬤', 600 WHERE tags?'shop' AND tags->'shop' = 'florist' UNION ALL
            SELECT 'local_services', 'bank', NULL, 17, '⬤', 700 WHERE tags?'amenity' AND tags->'amenity' = 'bank' UNION ALL
            SELECT 'local_services', 'atm', NULL, 18, '•', 700 WHERE tags?'amenity' AND tags->'amenity' = 'atm' UNION ALL
            SELECT 'local_services', 'post_office', NULL, 16, '⬤', 500 WHERE tags?'amenity' AND tags->'amenity' = 'post_office' UNION ALL
            SELECT 'local_services', 'laundry', NULL, 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'laundry' UNION ALL
            SELECT 'local_services', 'dry_cleaning', NULL, 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'dry_cleaning' UNION ALL
            SELECT 'local_services', 'massage', NULL, 18, NULL, 700 WHERE tags?'shop' AND tags->'shop' = 'massage' UNION ALL
            SELECT 'local_services', 'estate_agent', NULL, 18, '⬤', 700 WHERE tags?'office' AND tags->'office' = 'estate_agent' UNION ALL
            SELECT 'local_services', 'fuel', NULL, 15, '⬤', 700 WHERE tags?'amenity' AND tags->'amenity' = 'fuel' UNION ALL
            SELECT 'local_services', 'car_repair', NULL, 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'car_repair' UNION ALL
            SELECT 'local_services', 'car_parts', NULL, 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'car_parts' UNION ALL
            SELECT 'local_services', 'office', NULL, 13, '⬤', 50 WHERE tags?'information' AND tags->'information' = 'office' UNION ALL
            SELECT 'local_services', 'townhall', NULL, 15, '•', 300 WHERE tags?'amenity' AND tags->'amenity' = 'townhall' UNION ALL
            SELECT 'local_services', 'copyshop', NULL, 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'copyshop' UNION ALL
            SELECT 'local_services', 'ticket', NULL, 17, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'ticket' UNION ALL
            SELECT 'local_services', 'travel_agency', NULL, 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'travel_agency' UNION ALL
            SELECT 'safety', 'care', 'pharmacy', 17, '⬤', 100 WHERE tags?'amenity' AND tags->'amenity' = 'pharmacy' UNION ALL
            SELECT 'safety', 'care', 'doctors', 18, '•', 50 WHERE tags?'amenity' AND tags->'amenity' = 'doctors' AND tags->'healthcare:speciality' = 'general' UNION ALL
            SELECT 'safety', 'care', 'dentist', 18, '•', 50 WHERE tags?'amenity' AND tags->'amenity' = 'dentist' UNION ALL
            SELECT 'safety', 'care', 'physiotherapist', 18, '•', 50 WHERE tags?'healthcare' AND tags->'healthcare' = 'physiotherapist' UNION ALL
            SELECT 'safety', 'care', 'veterinary', 18, '•', 50 WHERE tags?'amenity' AND tags->'amenity' = 'veterinary' UNION ALL
            SELECT 'safety', 'emergency', 'hospital', 15, '⬤', 0 WHERE tags?'amenity' AND tags->'amenity' = 'hospital' AND tags->'emergency' = 'yes' UNION ALL
            SELECT 'safety', 'emergency', 'clinic', 15, '⬤', 0 WHERE tags?'amenity' AND tags->'amenity' = 'clinic' AND tags->'emergency' = 'yes' UNION ALL
            SELECT 'safety', 'emergency', 'defibrillator', 17, '⬤', 0 WHERE tags?'emergency' AND tags->'emergency' = 'defibrillator' UNION ALL
            SELECT 'safety', 'rescue', 'water_rescue_station', 17, '⬤', 0 WHERE tags?'emergency' AND tags->'emergency' = 'water_rescue_station' UNION ALL
            SELECT 'safety', 'rescue', 'lifeguard_base', 17, '⬤', 0 WHERE tags?'emergency' AND tags->'emergency' = 'lifeguard_base' UNION ALL
            SELECT 'safety', 'rescue', 'life_ring', 18, '•', 4 WHERE tags?'emergency' AND tags->'emergency' = 'life_ring' UNION ALL
            SELECT 'safety', 'rescue', 'life_ring', 18, '•', 4 WHERE tags?'amenity' AND tags->'amenity' = 'life_ring' UNION ALL
            SELECT 'safety', 'rescue', 'mountain_rescue', 17, '⬤', 0 WHERE tags?'emergency' AND tags->'emergency' = 'mountain_rescue' UNION ALL
            SELECT 'safety', 'rescue', 'police', 17, '⬤', 0 WHERE tags?'amenity' AND tags->'amenity' = 'police' UNION ALL
            SELECT 'safety', 'rescue', 'fire_station', 15, '⬤', 0 WHERE tags?'amenity' AND tags->'amenity' = 'fire_station' UNION ALL
            SELECT 'mobility', 'charging_station', NULL, 16, '◯', 200 WHERE tags?'amenity' AND tags->'amenity' = 'charging_station' AND tags->'bycycle' = '' AND tags->'car' = '' AND tags->'scooter' = '' UNION ALL
            SELECT 'mobility', 'railway', 'station', 13, '⬤', 60 WHERE tags?'railway' AND tags->'railway' = 'station' UNION ALL
            SELECT 'mobility', 'railway', 'halt', 16, '◯', 60 WHERE tags?'railway' AND tags->'railway' = 'halt' UNION ALL
            SELECT 'mobility', 'railway', 'train_station_entrance', 18, '•', 60 WHERE tags?'railway' AND tags->'railway' = 'train_station_entrance' UNION ALL
            SELECT 'mobility', 'railway', 'subway_entrance', 18, '◯', 60 WHERE tags?'railway' AND tags->'railway' = 'subway_entrance' UNION ALL
            SELECT 'mobility', 'railway', 'tram_stop', 17, '◯', 60 WHERE tags?'railway' AND tags->'railway' = 'tram_stop' UNION ALL
            SELECT 'mobility', 'motorway', 'bus_station', 13, '⬤', 70 WHERE tags?'amenity' AND tags->'amenity' = 'bus_station' UNION ALL
            SELECT 'mobility', 'motorway', 'bus_stop', 17, '◯', 70 WHERE tags?'highway' AND tags->'highway' = 'bus_stop' UNION ALL
            SELECT 'mobility', 'motorway', 'parking', 13, '◯', 100 WHERE tags?'amenity' AND tags->'amenity' = 'parking' AND (tags?'access' AND tags->'access' NOT IN ('no', 'private')) UNION ALL
            SELECT 'mobility', 'motorway', 'car_pooling', 17, '◯', 70 WHERE tags?'amenity' AND tags->'amenity' = 'car_pooling' UNION ALL
            SELECT 'mobility', 'motorway', 'taxi', 16, '◯', 70 WHERE tags?'amenity' AND tags->'amenity' = 'taxi' UNION ALL
            SELECT 'mobility', 'motorway', 'motorway_junction', 13, '•', 70 WHERE tags?'highway' AND tags->'highway' = 'motorway_junction' AND tags->'ref' = '' UNION ALL
            SELECT 'mobility', 'motorway', 'toll_booth', 13, '•', 70 WHERE tags?'barrier' AND tags->'barrier' = 'toll_booth' UNION ALL
            SELECT 'mobility', 'aeroway', 'aerodrome', 12, '⬤', 0 WHERE tags?'aeroway' AND tags->'aeroway' = 'aerodrome' AND tags->'aerodrome:international' = '' UNION ALL
            SELECT 'mobility', 'waterway', 'ferry_terminal', 13, '⬤', 60 WHERE tags?'amenity' AND tags->'amenity' = 'ferry_terminal' UNION ALL
            SELECT 'mobility', 'waterway', 'dock', 19, '•', 60 WHERE tags?'waterway' AND tags->'waterway' = 'dock' UNION ALL
            SELECT 'mobility', 'bicycle', 'bicycle', 16, '⬤', 200 WHERE tags?'shop' AND tags->'shop' = 'bicycle' AND tags->'service:bicycle:rental' = '' UNION ALL
            SELECT 'mobility', 'bicycle', 'bicycle_parking', 17, '◯', 200 WHERE tags?'amenity' AND tags->'amenity' = 'bicycle_parking' UNION ALL
            SELECT 'mobility', 'bicycle', 'motorcycle_parking', 17, '◯', 200 WHERE tags?'amenity' AND tags->'amenity' = 'motorcycle_parking' UNION ALL
            SELECT 'mobility', 'bicycle', 'bicycle_rental', 16, '◯', 200 WHERE tags?'amenity' AND tags->'amenity' = 'bicycle_rental' UNION ALL
            SELECT 'mobility', 'bicycle', 'compressed_air', 18, '•', 200 WHERE tags?'amenity' AND tags->'amenity' = 'compressed_air' UNION ALL
            SELECT 'mobility', 'bicycle', 'cycle_barrier', 18, '•', 200 WHERE tags?'barrier' AND tags->'barrier' = 'cycle_barrier' UNION ALL
            SELECT 'amenity_local', 'playground', NULL, 16, '⬤', 500 WHERE tags?'leisure' AND tags->'leisure' = 'playground' UNION ALL
            SELECT 'amenity_local', 'bench', NULL, 18, '•', 1000 WHERE tags?'amenity' AND tags->'amenity' = 'bench' UNION ALL
            SELECT 'amenity_local', 'stile', NULL, 18, '•', 1000 WHERE tags?'barrier' AND tags->'barrier' = 'stile' UNION ALL
            SELECT 'amenity_local', 'information', 'post_box', 18, '•', 1000 WHERE tags?'amenity' AND tags->'amenity' = 'post_box' UNION ALL
            SELECT 'amenity_local', 'information', 'telephone', 18, '•', 1000 WHERE tags?'amenity' AND tags->'amenity' = 'telephone' UNION ALL
            SELECT 'amenity_local', 'information', 'information', 14, '•', 300 WHERE tags?'tourism' AND tags->'tourism' = 'information' AND tags->'information:board' = 'map' UNION ALL
            SELECT 'amenity_local', 'sanitary', 'shower', 18, '•', 1000 WHERE tags?'amenity' AND tags->'amenity' = 'shower' UNION ALL
            SELECT 'amenity_local', 'sanitary', 'drinking_water', 16, '◯', 300 WHERE tags?'amenity' AND tags->'amenity' = 'drinking_water' UNION ALL
            SELECT 'amenity_local', 'sanitary', 'toilets', 16, '◯', 300 WHERE tags?'amenity' AND tags->'amenity' = 'toilets' AND (tags?'access' AND tags->'access' NOT IN ('no', 'private')) UNION ALL
            SELECT 'amenity_local', 'picnic', 'picnic_site', 16, '⬤', 300 WHERE tags?'tourism' AND tags->'tourism' = 'picnic_site' UNION ALL
            SELECT 'amenity_local', 'picnic', 'picnic_table', 18, '•', 1000 WHERE tags?'leisure' AND tags->'leisure' = 'picnic_table' UNION ALL
            SELECT 'amenity_local', 'picnic', 'firepit', 18, '•', 1000 WHERE tags?'leisure' AND tags->'leisure' = 'firepit' UNION ALL
            SELECT 'amenity_local', 'picnic', 'bbq', 18, '•', 1000 WHERE tags?'amenity' AND tags->'amenity' = 'bbq' UNION ALL
            SELECT 'amenity_local', 'hut', 'alpine_hut', 16, '⬤', 100 WHERE tags?'tourism' AND tags->'tourism' = 'alpine_hut' UNION ALL
            SELECT 'amenity_local', 'hut', 'wilderness_hut', 16, '⬤', 100 WHERE tags?'tourism' AND tags->'tourism' = 'wilderness_hut' UNION ALL
            SELECT 'amenity_local', 'hut', 'shelter', 17, '•', 100 WHERE tags?'amenity' AND tags->'amenity' = 'shelter' UNION ALL
            SELECT 'amenity_local', 'waste', 'recycling', 10, '⬤', 300 WHERE tags?'amentiy' AND tags->'amentiy' = 'recycling' AND tags->'recycling_type' = 'centre' UNION ALL
            SELECT 'amenity_local', 'waste', 'recycling', 17, '•', 800 WHERE tags?'amentiy' AND tags->'amentiy' = 'recycling' AND tags->'recycling_type' = 'container' UNION ALL
            SELECT 'amenity_local', 'waste', 'waste_disposal', 18, '•', 1000 WHERE tags?'amenity' AND tags->'amenity' = 'waste_disposal' UNION ALL
            SELECT 'amenity_local', 'waste', 'waste_basket', 18, '•', 1000 WHERE tags?'amenity' AND tags->'amenity' = 'waste_basket' UNION ALL
            SELECT 'amenity_local', 'waste', 'vending_machine', 18, '•', 1000 WHERE tags?'amenity' AND tags->'amenity' = 'vending_machine' AND tags->'vending:excrement_bags' = '' UNION ALL
            SELECT 'amenity_local', 'waste', 'waste_basket', 18, '•', 1000 WHERE tags?'amenity' AND tags->'amenity' = 'waste_basket' AND tags->'waste' = 'dog_excrement' UNION ALL
            SELECT 'remarkable', 'attraction_activity', 'attraction', 13, '⬤', 0 WHERE tags?'tourism' AND tags->'tourism' = 'attraction' UNION ALL
            SELECT 'remarkable', 'attraction_activity', 'aquarium', 13, '⬤', 0 WHERE tags?'tourism' AND tags->'tourism' = 'aquarium' UNION ALL
            SELECT 'remarkable', 'attraction_activity', 'theme_park', 13, '⬤', 0 WHERE tags?'tourism' AND tags->'tourism' = 'theme_park' UNION ALL
            SELECT 'remarkable', 'attraction_activity', 'water_park', 13, '⬤', 0 WHERE tags?'tourism' AND tags->'tourism' = 'water_park' UNION ALL
            SELECT 'remarkable', 'attraction_activity', 'zoo', 13, '⬤', 0 WHERE tags?'tourism' AND tags->'tourism' = 'zoo' UNION ALL
            SELECT 'remarkable', 'attraction_activity', 'viewpoint', 14, '⬤', 100 WHERE tags?'tourism' AND tags->'tourism' = 'viewpoint' UNION ALL
            SELECT 'remarkable', 'attraction_activity', 'lighthouse', 13, '⬤', 30 WHERE tags?'man_made' AND tags->'man_made' = 'lighthouse' UNION ALL
            SELECT 'remarkable', 'natural_activity', 'beach_resort', 18, '⬤', 0 WHERE tags?'leisure' AND tags->'leisure' = 'beach_resort' UNION ALL
            SELECT 'remarkable', 'natural_activity', 'beach', 16, '⬤', 0 WHERE tags?'natural' AND tags->'natural' = 'beach' AND tags?'name' UNION ALL
            SELECT 'remarkable', 'natural_activity', 'peak', 12, '•', 0 WHERE tags?'natural' AND tags->'natural' = 'peak' UNION ALL
            SELECT 'remarkable', 'outdoor_activity', 'swimming_area', 14, '⬤', 0 WHERE tags?'leisure' AND tags->'leisure' = 'swimming_area' UNION ALL
            SELECT 'remarkable', 'outdoor_activity', 'winter_sports', 14, '⬤', 0 WHERE tags?'landuse' AND tags->'landuse' = 'winter_sports' UNION ALL
            SELECT 'remarkable', 'outdoor_activity', 'marina', 14, '⬤', 0 WHERE tags?'leisure' AND tags->'leisure' = 'marina' UNION ALL
            SELECT 'remarkable', 'outdoor_activity', 'fishing', 14, '⬤', 0 WHERE tags?'leisure' AND tags->'leisure' = 'fishing' UNION ALL
            SELECT 'remarkable', 'outdoor_activity', 'stadium', 14, '⬤', 0 WHERE tags?'leisure' AND tags->'leisure' = 'stadium' UNION ALL
            SELECT 'culture', 'artwork', NULL, 18, '•', 800 WHERE tags?'tourism' AND tags->'tourism' = 'artwork' UNION ALL
            SELECT 'culture', 'visit', 'place_of_worship', 18, '•', 40 WHERE tags?'amenity' AND tags->'amenity' = 'place_of_worship' UNION ALL
            SELECT 'culture', 'visit', 'cathedral', 14, '⬤', 30 WHERE tags?'building' AND tags->'building' = 'cathedral' UNION ALL
            SELECT 'culture', 'visit', 'church', 15, '⬤', 30 WHERE tags?'building' AND tags->'building' = 'church' UNION ALL
            SELECT 'culture', 'visit', 'chapel', 16, '•', 30 WHERE tags?'building' AND tags->'building' = 'chapel' UNION ALL
            SELECT 'culture', 'visit', 'arts_centre', 17, '⬤', 30 WHERE tags?'amenity' AND tags->'amenity' = 'arts_centre' UNION ALL
            SELECT 'culture', 'visit', 'museum', 14, '⬤', 0 WHERE tags?'tourism' AND tags->'tourism' = 'museum' UNION ALL
            SELECT 'culture', 'historic', 'castle', 14, '⬤', 30 WHERE tags?'historic' AND tags->'historic' = 'castle' UNION ALL
            SELECT 'culture', 'historic', 'monument', 14, '⬤', 30 WHERE tags?'historic' AND tags->'historic' = 'monument' UNION ALL
            SELECT 'culture', 'historic', 'memorial', 18, '•', 800 WHERE tags?'historic' AND tags->'historic' = 'memorial' UNION ALL
            SELECT 'culture', 'historic', 'archaeological_site', 14, '⬤', 30 WHERE tags?'historic' AND tags->'historic' = 'archaeological_site' UNION ALL
            SELECT 'culture', 'historic', 'castle_wall', 14, '•', 800 WHERE tags?'historic' AND tags->'historic' = 'castle_wall' UNION ALL
            SELECT 'culture', 'historic', 'city_wall', 14, '•', 800 WHERE tags?'barrier' AND tags->'barrier' = 'city_wall' UNION ALL
            SELECT 'culture', 'historic', 'church', 14, '•', 800 WHERE tags?'historic' AND tags->'historic' = 'church' UNION ALL
            SELECT 'culture', 'historic', 'city_gate', 14, '•', 800 WHERE tags?'historic' AND tags->'historic' = 'city_gate' UNION ALL
            SELECT 'culture', 'historic', 'wayside_cross', 18, '•', 800 WHERE tags?'historic' AND tags->'historic' = 'wayside_cross' UNION ALL
            SELECT 'culture', 'historic', 'wayside_shrine', 18, '•', 800 WHERE tags?'historic' AND tags->'historic' = 'wayside_shrine' UNION ALL
            SELECT 'culture', 'show', 'theatre', 15, '⬤', 100 WHERE tags?'amenity' AND tags->'amenity' = 'theatre' UNION ALL
            SELECT 'culture', 'show', 'cinema', 15, '⬤', 100 WHERE tags?'amenity' AND tags->'amenity' = 'cinema' UNION ALL
            SELECT 'culture', 'show', 'gallery', 18, '⬤', 100 WHERE tags?'tourism' AND tags->'tourism' = 'gallery' UNION ALL
            SELECT 'hosting', 'hotel', 'hotel', 15, '⬤', 30 WHERE tags?'tourism' AND tags->'tourism' = 'hotel' UNION ALL
            SELECT 'hosting', 'hotel', 'motel', 15, '⬤', 30 WHERE tags?'tourism' AND tags->'tourism' = 'motel' UNION ALL
            SELECT 'hosting', 'hotel', 'hostel', 15, '⬤', 30 WHERE tags?'tourism' AND tags->'tourism' = 'hostel' UNION ALL
            SELECT 'hosting', 'hotel', 'guest_house', 17, '⬤', 30 WHERE tags?'tourism' AND tags->'tourism' = 'guest_house' UNION ALL
            SELECT 'hosting', 'resort', 'apartment', 15, '⬤', 30 WHERE tags?'tourism' AND tags->'tourism' = 'apartment' UNION ALL
            SELECT 'hosting', 'resort', 'camp_site', 15, '⬤', 30 WHERE tags?'tourism' AND tags->'tourism' = 'camp_site' UNION ALL
            SELECT 'hosting', 'resort', 'caravan_site', 15, '⬤', 30 WHERE tags?'tourism' AND tags->'tourism' = 'caravan_site' UNION ALL
            SELECT 'hosting', 'resort', 'resort', 15, '⬤', 30 WHERE tags?'leisure' AND tags->'leisure' = 'resort' UNION ALL
            SELECT 'hosting', 'rental', 'chalet', 17, '⬤', 30 WHERE tags?'tourism' AND tags->'tourism' = 'chalet' UNION ALL
            SELECT 'hosting', 'rental', 'apartment', 18, '•', 30 WHERE tags?'tourism' AND tags->'tourism' = 'apartment' UNION ALL
            SELECT 'catering', 'food', 'restaurant', 16, '⬤', 40 WHERE tags?'amenity' AND tags->'amenity' = 'restaurant' UNION ALL
            SELECT 'catering', 'food', 'fast_food', 18, '⬤', 40 WHERE tags?'amenity' AND tags->'amenity' = 'fast_food' UNION ALL
            SELECT 'catering', 'food', 'food_court', 18, '⬤', 40 WHERE tags?'amenity' AND tags->'amenity' = 'food_court' UNION ALL
            SELECT 'catering', 'food', 'pastry', 17, '⬤', 40 WHERE tags?'shop' AND tags->'shop' = 'pastry' UNION ALL
            SELECT 'catering', 'food', 'ice_cream', 18, '⬤', 40 WHERE tags?'amenity' AND tags->'amenity' = 'ice_cream' UNION ALL
            SELECT 'catering', 'drink', 'pub', 18, '⬤', 50 WHERE tags?'amenity' AND tags->'amenity' = 'pub' UNION ALL
            SELECT 'catering', 'drink', 'bar', 18, '⬤', 50 WHERE tags?'amenity' AND tags->'amenity' = 'bar' UNION ALL
            SELECT 'catering', 'drink', 'cafe', 17, '⬤', 50 WHERE tags?'amenity' AND tags->'amenity' = 'cafe' UNION ALL
            SELECT 'leisure', 'community_centre', NULL, 17, '•', 200 WHERE tags?'amenity' AND tags->'amenity' = 'community_centre' UNION ALL
            SELECT 'leisure', 'nightclub', NULL, 17, '⬤', 200 WHERE tags?'amenity' AND tags->'amenity' = 'nightclub' UNION ALL
            SELECT 'leisure', 'swimming_pool', NULL, 14, '⬤', 200 WHERE tags?'leisure' AND tags->'leisure' = 'swimming_pool' AND (tags?'access' AND tags->'access' NOT IN ('no', 'private')) UNION ALL
            SELECT 'leisure', 'golf_course', NULL, 14, '⬤', 200 WHERE tags?'leisure' AND tags->'leisure' = 'golf_course' UNION ALL
            SELECT 'leisure', 'ice_ring', NULL, 15, '⬤', 200 WHERE tags?'leisure' AND tags->'leisure' = 'ice_ring' UNION ALL
            SELECT 'leisure', 'horse_riding', NULL, 14, '⬤', 200 WHERE tags?'leisure' AND tags->'leisure' = 'horse_riding' UNION ALL
            SELECT 'leisure', 'miniature_golf', NULL, 16, '⬤', 200 WHERE tags?'leisure' AND tags->'leisure' = 'miniature_golf' UNION ALL
            SELECT 'leisure', 'pitch', NULL, 14, '•', 501 WHERE tags?'leisure' AND tags->'leisure' = 'pitch' UNION ALL
            SELECT 'leisure', 'park', 'garden', 18, '•', 500 WHERE tags?'leisure' AND tags->'leisure' = 'garden' UNION ALL
            SELECT 'leisure', 'park', 'park', 16, '⬤', 100 WHERE tags?'leisure' AND tags->'leisure' = 'park' AND tags?'name' UNION ALL
            SELECT 'leisure', 'hide', 'wildlife_hide', 17, '•', 100 WHERE tags?'leisure' AND tags->'leisure' = 'wildlife_hide' UNION ALL
            SELECT 'leisure', 'hide', 'bird_hide', 17, '•', 100 WHERE tags?'leisure' AND tags->'leisure' = 'bird_hide' UNION ALL
            SELECT 'leisure', 'hide', 'tower', 17, '•', 100 WHERE tags?'man_made' AND tags->'man_made' = 'tower' AND tags->'tower:type' = 'observation' UNION ALL
            SELECT 'leisure', 'sport', 'athletics', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'athletics' UNION ALL
            SELECT 'leisure', 'sport', 'badminton', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'badminton' UNION ALL
            SELECT 'leisure', 'sport', 'basketball', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'basketball' UNION ALL
            SELECT 'leisure', 'sport', 'beachvolleyball', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'beachvolleyball' UNION ALL
            SELECT 'leisure', 'sport', 'bmx', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'bmx' UNION ALL
            SELECT 'leisure', 'sport', 'canoe', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'canoe' UNION ALL
            SELECT 'leisure', 'sport', 'climbing', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'climbing' UNION ALL
            SELECT 'leisure', 'sport', 'climbing_adventure', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'climbing_adventure' UNION ALL
            SELECT 'leisure', 'sport', 'bullfighting', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'bullfighting' UNION ALL
            SELECT 'leisure', 'sport', 'billiards', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'billiards' UNION ALL
            SELECT 'leisure', 'sport', 'boules', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'boules' UNION ALL
            SELECT 'leisure', 'sport', 'cycling', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'cycling' UNION ALL
            SELECT 'leisure', 'sport', 'equestrian', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'equestrian' UNION ALL
            SELECT 'leisure', 'sport', 'futsal', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'futsal' UNION ALL
            SELECT 'leisure', 'sport', 'diving', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'diving' UNION ALL
            SELECT 'leisure', 'sport', 'free_flying', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'free_flying' UNION ALL
            SELECT 'leisure', 'sport', 'golf', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'golf' UNION ALL
            SELECT 'leisure', 'sport', 'gymnastics', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'gymnastics' UNION ALL
            SELECT 'leisure', 'sport', 'handball', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'handball' UNION ALL
            SELECT 'leisure', 'sport', 'ice_hockey', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'ice_hockey' UNION ALL
            SELECT 'leisure', 'sport', 'horse_racing', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'horse_racing' UNION ALL
            SELECT 'leisure', 'sport', 'karting', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'karting' UNION ALL
            SELECT 'leisure', 'sport', 'kitesurfing', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'kitesurfing' UNION ALL
            SELECT 'leisure', 'sport', 'motocross', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'motocross' UNION ALL
            SELECT 'leisure', 'sport', 'motor', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'motor' UNION ALL
            SELECT 'leisure', 'sport', 'multi', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'multi' UNION ALL
            SELECT 'leisure', 'sport', 'orienteering', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'orienteering' UNION ALL
            SELECT 'leisure', 'sport', 'paddle_tennis', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'paddle_tennis' UNION ALL
            SELECT 'leisure', 'sport', 'paintball', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'paintball' UNION ALL
            SELECT 'leisure', 'sport', 'pelota', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'pelota' UNION ALL
            SELECT 'leisure', 'sport', 'racquet', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'racquet' UNION ALL
            SELECT 'leisure', 'sport', 'rowing', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'rowing' UNION ALL
            SELECT 'leisure', 'sport', 'rugby', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'rugby' UNION ALL
            SELECT 'leisure', 'sport', 'rugby_league', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'rugby_league' UNION ALL
            SELECT 'leisure', 'sport', 'rugby_union', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'rugby_union' UNION ALL
            SELECT 'leisure', 'sport', 'running', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'running' UNION ALL
            SELECT 'leisure', 'sport', 'sailing', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'sailing' UNION ALL
            SELECT 'leisure', 'sport', 'scuba_diving', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'scuba_diving' UNION ALL
            SELECT 'leisure', 'sport', 'shooting', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'shooting' UNION ALL
            SELECT 'leisure', 'sport', 'skateboard', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'skateboard' UNION ALL
            SELECT 'leisure', 'sport', 'soccer', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'soccer' UNION ALL
            SELECT 'leisure', 'sport', 'surfing', 14, '⬤', 500 WHERE tags?'sport' AND tags->'sport' = 'surfing' UNION ALL
            SELECT 'leisure', 'sport', 'swimming', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'swimming' UNION ALL
            SELECT 'leisure', 'sport', 'table_soccer', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'table_soccer' UNION ALL
            SELECT 'leisure', 'sport', 'table_tennis', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'table_tennis' UNION ALL
            SELECT 'leisure', 'sport', 'tennis', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'tennis' UNION ALL
            SELECT 'leisure', 'sport', 'volleyball', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'volleyball' UNION ALL
            SELECT 'leisure', 'sport', 'water_ski', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'water_ski' UNION ALL
            SELECT 'leisure', 'sport', 'yoga', 14, '•', 500 WHERE tags?'sport' AND tags->'sport' = 'yoga' UNION ALL
            SELECT 'public_landmark', 'courthouse', NULL, 16, '•', 100 WHERE tags?'amenity' AND tags->'amenity' = 'courthouse' UNION ALL
            SELECT 'public_landmark', 'embassy', NULL, 16, '•', 100 WHERE tags?'amenity' AND tags->'amenity' = 'embassy' UNION ALL
            SELECT 'public_landmark', 'grave_yard', NULL, 14, '•', 100 WHERE tags?'amenity' AND tags->'amenity' = 'grave_yard' UNION ALL
            SELECT 'public_landmark', 'cemetery', NULL, 14, '•', 100 WHERE tags?'landuse' AND tags->'landuse' = 'cemetery' UNION ALL
            SELECT 'public_landmark', 'reservoir', NULL, 16, '•', 100 WHERE tags?'landuse' AND tags->'landuse' = 'reservoir' UNION ALL
            SELECT 'public_landmark', 'library', NULL, 16, '•', 100 WHERE tags?'amenity' AND tags->'amenity' = 'library' UNION ALL
            SELECT 'public_landmark', 'kindergarten', NULL, 16, '•', 100 WHERE tags?'amenity' AND tags->'amenity' = 'kindergarten' AND tags->'school:FR' = 'maternelle' UNION ALL
            SELECT 'public_landmark', 'school', NULL, 16, '•', 100 WHERE tags?'amenity' AND tags->'amenity' = 'school' UNION ALL
            SELECT 'public_landmark', 'college', NULL, 16, '•', 100 WHERE tags?'amenity' AND tags->'amenity' = 'college' UNION ALL
            SELECT 'public_landmark', 'university', NULL, 14, '•', 100 WHERE tags?'amenity' AND tags->'amenity' = 'university' UNION ALL
            SELECT 'public_landmark', 'prison', NULL, 16, '•', 100 WHERE tags?'amenity' AND tags->'amenity' = 'prison' UNION ALL
            SELECT 'public_landmark', 'mall', NULL, 14, '•', 100 WHERE tags?'shop' AND tags->'shop' = 'mall' UNION ALL
            SELECT 'public_landmark', 'border_control', NULL, 16, '•', 100 WHERE tags?'barrier' AND tags->'barrier' = 'border_control' UNION ALL
            SELECT 'public_landmark', 'basin', NULL, 14, '•', 100 WHERE tags?'landuse' AND tags->'landuse' = 'basin' UNION ALL
            SELECT 'public_landmark', 'brownfield', NULL, 14, '•', 100 WHERE tags?'landuse' AND tags->'landuse' = 'brownfield' UNION ALL
            SELECT 'shopping', 'sport_supply', 'bicycle', 16, '⬤', 500 WHERE tags?'shop' AND tags->'shop' = 'bicycle' UNION ALL
            SELECT 'shopping', 'sport_supply', 'outdoor', 16, '⬤', 500 WHERE tags?'shop' AND tags->'shop' = 'outdoor' UNION ALL
            SELECT 'shopping', 'feed', 'coffee', 18, '⬤', 400 WHERE tags?'shop' AND tags->'shop' = 'coffee' UNION ALL
            SELECT 'shopping', 'feed', 'beverages', 18, '⬤', 400 WHERE tags?'shop' AND tags->'shop' = 'beverages' UNION ALL
            SELECT 'shopping', 'feed', 'confectionery', 18, '⬤', 400 WHERE tags?'shop' AND tags->'shop' = 'confectionery' UNION ALL
            SELECT 'shopping', 'feed', 'frozen_food', 18, '⬤', 400 WHERE tags?'shop' AND tags->'shop' = 'frozen_food' UNION ALL
            SELECT 'shopping', 'feed', 'ice_cream', 18, '⬤', 400 WHERE tags?'shop' AND tags->'shop' = 'ice_cream' UNION ALL
            SELECT 'shopping', 'supply', 'furniture', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'furniture' UNION ALL
            SELECT 'shopping', 'supply', 'computer', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'computer' UNION ALL
            SELECT 'shopping', 'supply', 'camera', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'camera' UNION ALL
            SELECT 'shopping', 'supply', 'mobile_phone', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'mobile_phone' UNION ALL
            SELECT 'shopping', 'supply', 'electronics', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'electronics' UNION ALL
            SELECT 'shopping', 'supply', 'hifi', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'hifi' UNION ALL
            SELECT 'shopping', 'supply', 'doityourself', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'doityourself' UNION ALL
            SELECT 'shopping', 'supply', 'musical_instrument', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'musical_instrument' UNION ALL
            SELECT 'shopping', 'supply', 'toys', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'toys' UNION ALL
            SELECT 'shopping', 'supply', 'stationery', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'stationery' UNION ALL
            SELECT 'shopping', 'supply', 'video', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'video' UNION ALL
            SELECT 'shopping', 'supply', 'video_games', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'video_games' UNION ALL
            SELECT 'shopping', 'supply', 'erotic', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'erotic' UNION ALL
            SELECT 'shopping', 'supply', 'optician', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'optician' UNION ALL
            SELECT 'shopping', 'supply', 'hearing_aids', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'hearing_aids' UNION ALL
            SELECT 'shopping', 'supply', 'hardware', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'hardware' UNION ALL
            SELECT 'shopping', 'supply', 'bed', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'bed' UNION ALL
            SELECT 'shopping', 'supply', 'general', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'general' UNION ALL
            SELECT 'shopping', 'supply', 'lamps', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'lamps' UNION ALL
            SELECT 'shopping', 'supply', 'motorcycle', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'motorcycle' UNION ALL
            SELECT 'shopping', 'supply', 'weapons', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'weapons' UNION ALL
            SELECT 'shopping', 'supply', 'charity', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'charity' UNION ALL
            SELECT 'shopping', 'supply', 'wholesale', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'wholesale' UNION ALL
            SELECT 'shopping', 'fashion', 'boutique', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'boutique' UNION ALL
            SELECT 'shopping', 'fashion', 'clothes', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'clothes' UNION ALL
            SELECT 'shopping', 'fashion', 'second_hand', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'second_hand' UNION ALL
            SELECT 'shopping', 'fashion', 'bag', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'bag' UNION ALL
            SELECT 'shopping', 'fashion', 'watches', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'watches' UNION ALL
            SELECT 'shopping', 'fashion', 'interior_decoration', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'interior_decoration' UNION ALL
            SELECT 'shopping', 'fashion', 'jewelry', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'jewelry' UNION ALL
            SELECT 'shopping', 'fashion', 'perfumery', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'perfumery' UNION ALL
            SELECT 'shopping', 'fashion', 'cosmetics', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'cosmetics' UNION ALL
            SELECT 'shopping', 'fashion', 'fabric', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'fabric' UNION ALL
            SELECT 'shopping', 'fashion', 'perfume', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'perfume' UNION ALL
            SELECT 'shopping', 'fashion', 'accessories', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'accessories' UNION ALL
            SELECT 'shopping', 'fashion', 'shoes', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'shoes' UNION ALL
            SELECT 'shopping', 'fashion', 'gift', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'gift' UNION ALL
            SELECT 'shopping', 'fashion', 'tattoo', 18, '⬤', 700 WHERE tags?'shop' AND tags->'shop' = 'tattoo' UNION ALL
            SELECT 'shopping', 'culture', 'art', 18, '⬤', 600 WHERE tags?'shop' AND tags->'shop' = 'art' UNION ALL
            SELECT 'shopping', 'culture', 'antiques', 18, '⬤', 600 WHERE tags?'shop' AND tags->'shop' = 'antiques' UNION ALL
            SELECT 'shopping', 'culture', 'music', 18, '⬤', 600 WHERE tags?'shop' AND tags->'shop' = 'music' UNION ALL
            SELECT 'shopping', 'culture', 'books', 18, '⬤', 600 WHERE tags?'shop' AND tags->'shop' = 'books' UNION ALL
            SELECT 'shopping', 'animals', 'pet', 18, '⬤', 1000 WHERE tags?'shop' AND tags->'shop' = 'pet' UNION ALL
            SELECT 'shopping', 'animals', 'pet_grooming', 18, '⬤', 1000 WHERE tags?'shop' AND tags->'shop' = 'pet_grooming'
    ) AS t(superclass, class, subclass, zoom, style, priority)
    ORDER BY
        zoom,
        priority
    LIMIT 1
$$
LANGUAGE SQL
IMMUTABLE PARALLEL SAFE;
