DROP TABLE IF EXISTS `park_features`;
DROP TABLE IF EXISTS `park_activities`;
DROP TABLE IF EXISTS `parks`;
DROP TABLE IF EXISTS `features`;
DROP TABLE IF EXISTS `activities`;


--
-- Parks Table Structure
--
CREATE TABLE `parks` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name`  varchar(50) NOT NULL,
	`main_state` varchar(50) DEFAULT NULL,
	`region` varchar(50) DEFAULT NULL,
	`link` varchar(50) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for Parks table*/
LOCK TABLES `parks` WRITE;
INSERT INTO `parks` (`name`, `main_state`, `region`, `link`)
VALUES ('Denali', 'Alaska', 'Noncontiguous','https://www.nps.gov/dena/index.htm'), 
('Gates of the Artic', 'Alaska', 'Noncontiguous','https://www.nps.gov/gaar/index.htm'),
('Glacier Bay', 'Alaska', 'Noncontiguous','https://www.nps.gov/glba/index.htm'),
('Katmai', 'Alaska', 'Noncontiguous','https://www.nps.gov/katm/index.htm'), 
('Kenai Fjords', 'Alaska', 'Noncontiguous','https://www.nps.gov/kefj/index.htm'), 
('Kobuk Valley', 'Alaska', 'Noncontiguous','https://www.nps.gov/kova/index.htm'), 
('Lake Clark', 'Alaska', 'Noncontiguous','https://www.nps.gov/lacl/index.htm'), 
('Wrangell - St. Elias', 'Alaska', 'Noncontiguous','https://www.nps.gov/wrst/index.htm'),  
('Haleakala', 'Hawaii', 'Noncontiguous','https://www.nps.gov/hale/index.htm'),
('Hawaii Valcanoes', 'Hawaii', 'Noncontiguous','https://www.nps.gov/havo/index.htm'), 
('Mount Rainer', 'Washington', 'Pacific','https://www.nps.gov/mora/index.htm'), 
('North Cascades', 'Washington', 'Pacific','https://www.nps.gov/noca/index.htm'),
('Olympic', 'Washington', 'Pacific','https://www.nps.gov/olym/index.htm'), 
('Crater Lake', 'Oregon', 'Pacific','https://www.nps.gov/crla/index.htm'), 
('Channel Islands', 'California', 'Pacific','https://www.nps.gov/chis/index.htm'),
('Death Valley', 'California', 'Pacific','https://www.nps.gov/deva/index.htm'),
('Joshua Tree', 'California', 'Pacific','https://www.nps.gov/jotr/index.htm'),
('Kings Canyon', 'California', 'Pacific','https://www.nps.gov/seki/index.htm'),
('Lassen Volcanic', 'California', 'Pacific','https://www.nps.gov/lavo/index.htm'),
('Redwood', 'California', 'Pacific','https://www.nps.gov/redw/index.htm'),
('Sequoia', 'California', 'Pacific','https://www.nps.gov/seki/index.htm'),
('Yosemite', 'California', 'Pacific','https://www.nps.gov/yose/index.htm'), 
('Glacier', 'Montana', 'Rocky Mountains','https://www.nps.gov/glac/index.htm'), 
('Yellowstone', 'Wyoming', 'Rocky Mountains','https://www.nps.gov/yell/index.htm'),
('Great Basin', 'Nevada', 'Rocky Mountains','https://www.nps.gov/grba/index.htm'), 
('Black Canyon of the Gunnison', 'Colorado', 'Rocky Mountains','https://www.nps.gov/blca/index.htm'),
('Great Sand Dunes', 'Colorado', 'Rocky Mountains','https://www.nps.gov/grsa/index.htm'), 
('Mesa Verde', 'Colorado', 'Rocky Mountains','https://www.nps.gov/meve/index.htm'), 
('Rocky Mountain', 'Colorado', 'Rocky Mountains','https://www.nps.gov/romo/index.htm'),
('Arches', 'Utah', 'Rocky Mountains','https://www.nps.gov/arch/index.htm'), 
('Bryce Canyon', 'Utah', 'Rocky Mountains','https://www.nps.gov/brca/index.htm'), 
('Capitol Reef', 'Utah', 'Rocky Mountains','https://www.nps.gov/care/index.htm'),
('Canyonlands', 'Utah', 'Rocky Mountains','https://www.nps.gov/cany/index.htm'), 
('Zion', 'Utah', 'Rocky Mountains','https://www.nps.gov/zion/index.htm'), 
('Grand Canyon', 'Arizona', 'Southwest','https://www.nps.gov/grca/index.htm'),
('Petrified Forest', 'Arizona', 'Southwest','https://www.nps.gov/pefo/index.htm'), 
('Saguaro', 'Arizona', 'Southwest','https://www.nps.gov/sagu/index.htm'), 
('Carlsbad Caverns', 'New Mexico', 'Southwest','https://www.nps.gov/cave/index.htm'),
('Big Bend', 'Texas', 'Southwest','https://www.nps.gov/bibe/index.htm'),
('Guadelupe Mountains', 'Texas', 'Southwest','https://www.nps.gov/gumo/index.htm'), 
('Hot Springs', 'Arkansas', 'Southeast','https://www.nps.gov/hosp'),
('Great Smoky Mountains', 'Tennessee', 'Southeast','https://www.nps.gov/grsm/index.htm'), 
('Mammoth Cave', 'Kentucky', 'Southeast','https://www.nps.gov/maca/index.htm'), 
('Biscayne', 'Florida', 'Southeast','https://www.nps.gov/bisc/index.htm'),
('Dry Tortugas', 'Florida', 'Southeast','https://www.nps.gov/drto/index.htm'), 
('Everglades', 'Florida', 'Southeast','https://www.nps.gov/ever/index.htm'),  
('Congaree', 'South Carolina', 'Southeast','https://www.nps.gov/cong/index.htm'),
('Shenendoah', 'Virginia', 'Southeast','https://www.nps.gov/shen/index.htm'), 
('Theodore Roosevelt', 'North Dakota', 'Midwest','https://www.nps.gov/thro/index.htm'), 
('Badlands', 'South Dakota', 'Midwest','https://www.nps.gov/badl/index.htm'),
('Wind Cave', 'South Dakota', 'Midwest','https://www.nps.gov/wica/index.htm'), 
('Voyageurs', 'Minnesota', 'Midwest','https://www.nps.gov/voya/index.htm'), 
('Isle Royale', 'Michigan', 'Midwest','https://www.nps.gov/isro/index.htm'),
('Cuyahoga Valley', 'Ohio', 'Midwest','https://www.nps.gov/cuva/index.htm'), 
('Acadia', 'Maine', 'Northeast','https://www.nps.gov/acad/index.htm'), 
('Grand Tetons', 'Wyoming', 'Rocky Mountains','https://www.nps.gov/grte/index.htm'),
('Pinnacles', 'California', 'Pacific','https://www.nps.gov/pinn/index.htm');
UNLOCK TABLES;



CREATE TABLE `activities`	(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`description` varchar(150) DEFAULT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/* Data for Mission table*/
LOCK TABLES `activities` WRITE;
INSERT INTO `activities` (`name`, `description`)
VALUES ('Hiking/Backpacking', ''), ('Cycling', ''),('Rafting/Kayaking/Canoeing', ''), 
('Scenic Drive', '') ,('Scuba Diving/Snorkeling', ''), ('Mountaineering/Climbing', ''), 
('Horseback Riding', ''),('Fishing', ''),('Hunting',''),('Spelunking', ''),('Surfing', '');
UNLOCK TABLES;



--
-- Park_Activites table
--
CREATE TABLE `park_activities`	(
	`pid` int(11) NOT NULL DEFAULT '0',
	`aid` int(11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`pid`, `aid`),
	KEY `pid` (`pid`),
	CONSTRAINT `park_activity_ibfk_1` FOREIGN KEY (`pid`) REFERENCES
	`parks` (`id`),
	CONSTRAINT `park_activity_ibfk_2` FOREIGN KEY (`aid`) REFERENCES
	`activities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=latin1;


LOCK TABLES `park_activities` WRITE;
INSERT INTO `park_activities` VALUES (1,1),(1,2),(1,8),(2,3),(2,1),(2,9),(3,3),
(3,1),(4,1),(4,8),(4,9),(5,3),(5,1),(5,8),(5,6),(6,1),(6,3),(6,8),(7,2),(7,1),(7,8),
(7,9),(7,3),(8,3),(8,1),(8,2),(8,6),(8,8),(8,9),(9,1),(10,4),(10,1),(11,1),(11,2),
(11,6),(11,3),(11,8),(12,3),(12,2),(12,8),(12,6),(12,1),(13,3),(13,6),(13,8),(13,1),
(14,1),(14,2),(15,3),(15,1),(15,5),(15,8),(15,11),(16,1),(16,4),(16,2),(16,7),(17,1),
(17,6),(17,7),(17,4),(18,1),(18,7),(18,6),(18,8),(19,4),(19,1),(19,3),(19,2),(20,4),
(20,1),(20,3),(20,2),(20,7),(21,1),(21,7),(21,6),(21,8),(22,4),(22,1),(22,2),(22,8),
(22,7),(22,6),(22,3),(23,3),(23,1),(23,2),(23,8),(23,7),(24,3),(24,1),(24,7),(24,8),
(25,10),(25,4),(25,2),(25,6),(25,8),(25,1),(25,7),(26,1),(26,4),(26,8),(26,3),(26,6),
(26,7),(27,1),(27,7),(27,2),(28,1),(28,2),(29,2),(29,8),(29,6),(29,1),(29,7),(30,4),
(30,1),(30,7),(30,6),(30,2),(31,1),(32,1),(32,4),(32,6),(32,2),(32,7),(33,3),(33,4),
(33,1),(33,2),(33,6),(33,7),(34,2),(34,6),(34,1),(34,3),(35,1),(35,7),(35,3),(36,1),
(36,7),(37,1),(38,10),(39,3),(39,1),(39,4),(40,1),(40,7),(41,1),(42,3),(42,2),(42,4),
(42,8),(42,1),(42,7),(43,10),(43,2),(43,7),(43,3),(43,8),(43,1),(44,3),(44,8),(45,8),
(45,4),(46,3),(46,2),(46,8),(46,1),(47,3),(47,1),(47,8),(48,4),(48,1),(48,2),(48,8),
(48,7),(48,6),(49,2),(49,3),(49,8),(49,1),(49,7),(50,1),(50,2),(51,1),(51,10),(51,7),
(52,1),(53,3),(53,1),(53,8),(53,5),(54,1),(54,2),(54,8),(54,3),(54,7),(55,7),(55,3),
(55,2),(55,1),(55,8),(55,6),(56,3),(56,4),(56,1),(56,7),(56,6),(56,8),(57,1),(57,6),
(57,10);
UNLOCK TABLES;



--
-- Features Table Structure
--
CREATE TABLE `features`(
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for collectible table*/
LOCK TABLES `features` WRITE;
INSERT INTO `features`(`name`)
 VALUES ('Desert'), ('Canyons'), ('Mountains'), 
('Sand Dunes'), ('Beach'), ('Lakes'), ('Rivers'),('Rainforest'), 
('Plains'), ('Geothermals'), ('Unique Plants'), 
('Caves/Caverns'), ('Volcano'), ('Glaciers'), ('Forest'), ('Ruins'),
('Badlands'), ('Fjords'), ('Islands'), ('Unique Rock Formations'), ('Swamp');
UNLOCK TABLES;



--
-- Park_Features Table Structure
--
CREATE TABLE `park_features`	(
	`pid` int (11) NOT NULL DEFAULT '0',
	`fid` int (11) NOT NULL DEFAULT '0',
	PRIMARY KEY (`pid`, `fid`),
	KEY `pid` (`pid`),
	CONSTRAINT `park_features_ibfk_1` FOREIGN KEY (`pid`) REFERENCES
	`parks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE, 
	CONSTRAINT `park_features_ibfk_2` FOREIGN KEY (`fid`) REFERENCES
	`features` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- Data for Park - Feature table
LOCK TABLES `park_features` WRITE;
INSERT INTO `park_features` VALUES (1,3),(1,14),(2,3),(4,3),(4,7),(4,13),(3,14),(3,3),
(3,18),(3,8),(5,14),(5,18),(6,7),(6,4),(7,6),(7,13),(7,14),(7,3),(8,3),(8,13),(8,14),(9,3),
(9,13),(10,13),(10,19),(10,5),(11,3),(11,13),(11,14),(12,6),(12,3),(13,3),(13,8),(14,13),(14,6),
(15,5),(15,19),(16,1),(16,4),(16,2),(17,1),(17,11),(17,4),(18,2),(18,11),(19,13),(19,10),(20,11),
(20,7),(20,15),(21,15),(21,12),(21,3),(22,3),(22,20),(22,15),(23,3),(23,14),(24,10),(24,9),
(24,2),(24,3),(25,3),(25,12),(25,1),(26,2),(26,7),(27,1),(27,4),(28,3),(28,16),(29,3),(30,1),
(30,20),(31,1),(31,2),(32,1),(32,2),(32,20),(33,1),(33,2),(33,20),(34,1),(34,20),(34,2),(34,15),
(35,7),(35,2),(35,1),(36,1),(36,20),(37,3),(37,1),(37,11),(38,12),(39,1),(39,3),(39,2),(40,1),
(40,3),(41,15),(41,10),(41,3),(42,3),(42,15),(43,12),(44,5),(44,19),(45,5),(45,19),(46,21),(46,15),
(47,21),(47,15),(48,15),(48,7),(49,17),(50,17),(51,12),(52,6),(52,5),(52,19),(53,6),(53,5),(53,19),
(54,7),(54,15),(55,5),(55,3),(55,19),(56,3),(56,9),(57,1),(57,20);
UNLOCK TABLES;






	