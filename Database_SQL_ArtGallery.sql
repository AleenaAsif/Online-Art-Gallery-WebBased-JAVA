/*
SQLyog Ultimate - MySQL GUI v8.21 
MySQL - 5.1.29-rc-community : Database - galleryinfo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`galleryinfo` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `galleryinfo`;

/*Table structure for table `artworks` */

DROP TABLE IF EXISTS `artworks`;

CREATE TABLE `artworks` (
  `artist` varchar(1000) DEFAULT NULL,
  `title` varchar(1000) DEFAULT NULL,
  `path` varchar(1000) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `artworks` */

insert  into `artworks`(`artist`,`title`,`path`,`description`) values ('Salvador Dali','THE PERSISTENCE OF MEMORY','images//persistence.jpg',' Salvador Dalí\'s The Persistence of Memory plunges the viewer into a dreamlike and definitely strange universe where hard and soft surfaces coexist. The artwork opposes Surrealism to reality and questions the ineluctability of time.'),('Claude Monet','IMPRESSION','images//monet.jpg','For while it is a poem of light and atmosphere, the painting can also be seen as an ode to the power and beauty of a revitalized France.\" The representation of Le Havre, hometown of Monet and a center of industry and commerce, celebrates the \"renewed strength and beauty of the country.'),('Banksy','GIRL WITH A BALLOON','images//ballon.jpg','Girl With Balloon is Banksy\'s most iconic image, depicting a young girl reaching for a heart-shaped balloon, just out of her grasp. Fraught with emotive interpretations—some see the girl as losing the balloon, while others see her as on the verge of catching it—it is an allegory of hope, love, and freedom.'),('LARAIB RASHID','DIGITAL ART','images//laraibart.jpg','Digital art of a cup and plate typically depicts a stylized or abstract representation of a cup and plate using digital tools and techniques.'),('DUA WASEEM','ART BY DUA','images//sketch.jpg','Sketch of a girl'),('Edvard Munch','SCREAM','images//scream.jpeg','Munch painted it after experiencing a panic attack as a result of his severe anxiety, and he certainly captured the feeling of disassociation and fear that comes with panic attacks.'),('Vincent van Gogh','THE CAFE AT NIGHT','images//cafe.jpeg','The Night Cafe represents many of van Gogh best qualities including his striving for technical complexity and excellence. It also represents some of the personal struggles that drove his art-making and defined his stylistic aims.'),('Artist','FOREST','images//forest.jpeg','A dark forest with trees and an amazing representation of beauty of nature'),('artist','EYE','images//eye2.jpeg','an amazing description of a beautiful eye with vibrant and attractive colours');

/*Table structure for table `info` */

DROP TABLE IF EXISTS `info`;

CREATE TABLE `info` (
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `info` */

insert  into `info`(`username`,`password`,`email`,`phone`,`type`) values ('aleena','123','a@gmail.com','12345678901','admin'),('viewer','123','v@gmail.com','12345678901','user');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
