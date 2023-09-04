BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "portfolio_testimonial" (
	"id"	integer NOT NULL,
	"image"	varchar(100),
	"quote"	varchar(200),
	"name"	varchar(50),
	"is_active"	bool NOT NULL,
	"class_name"	varchar(50),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "portfolio_blog" (
	"id"	integer NOT NULL,
	"image"	varchar(100),
	"heading"	varchar(50),
	"description"	varchar(200),
	"admin_name"	varchar(50),
	"is_active"	bool NOT NULL,
	"admin_image"	varchar(100),
	"date"	datetime,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "portfolio_contact" (
	"id"	integer NOT NULL,
	"address"	varchar(50),
	"call"	varchar(50),
	"email"	varchar(50),
	"support"	varchar(50),
	"is_active"	bool NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "portfolio_usercontact" (
	"id"	integer NOT NULL,
	"timestamp"	datetime NOT NULL,
	"name"	varchar(100) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"phone"	varchar(100) NOT NULL,
	"subject"	varchar(100) NOT NULL,
	"message"	text NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "portfolio_schedule" (
	"id"	integer NOT NULL,
	"s_time"	time NOT NULL,
	"e_time"	time NOT NULL,
	"date"	date NOT NULL,
	"day"	varchar(100) NOT NULL,
	"is_active"	bool NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "portfolio_statistic" (
	"id"	integer NOT NULL,
	"is_active"	bool NOT NULL,
	"field_four"	varchar(50),
	"field_one"	varchar(50),
	"field_three"	varchar(50),
	"number_four"	integer NOT NULL,
	"number_one"	integer NOT NULL,
	"number_three"	integer NOT NULL,
	"number_two"	integer NOT NULL,
	"field_two"	varchar(50),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "portfolio_userprofile" (
	"id"	integer NOT NULL,
	"tag_line"	varchar(200),
	"btn_txt"	varchar(30),
	"image"	varchar(100),
	"image_caption"	varchar(50),
	"is_active"	bool NOT NULL,
	"name"	varchar(40),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "portfolio_quienes_somo" (
	"id"	integer NOT NULL,
	"image"	varchar(100),
	"titulo"	varchar(50),
	"is_active"	bool NOT NULL,
	"parrafo1"	varchar(1000),
	"parrafo2"	varchar(1000),
	"parrafo3"	varchar(1000),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "portfolio_mision" (
	"id"	integer NOT NULL,
	"image"	varchar(100),
	"titulo"	varchar(50),
	"parrafo1"	varchar(1000),
	"is_active"	bool NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "portfolio_vision" (
	"id"	integer NOT NULL,
	"image"	varchar(100),
	"titulo"	varchar(50),
	"parrafo1"	varchar(1000),
	"is_active"	bool NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "portfolio_principios" (
	"id"	integer NOT NULL,
	"image"	varchar(100),
	"titulo"	varchar(50),
	"parrafo1"	varchar(100),
	"parrafo2"	varchar(100),
	"parrafo3"	varchar(100),
	"parrafo4"	varchar(100),
	"parrafo5"	varchar(100),
	"is_active"	bool NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "portfolio_valores" (
	"id"	integer NOT NULL,
	"image"	varchar(100),
	"titulo"	varchar(50),
	"parrafo1"	varchar(100),
	"parrafo2"	varchar(100),
	"parrafo3"	varchar(100),
	"parrafo4"	varchar(100),
	"parrafo5"	varchar(100),
	"parrafo6"	varchar(100),
	"parrafo7"	varchar(100),
	"is_active"	bool NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "portfolio_equipo" (
	"id"	integer NOT NULL,
	"image"	varchar(100),
	"persona"	varchar(50),
	"descripcion"	varchar(200),
	"is_active"	bool NOT NULL,
	"descripcion2"	varchar(200),
	"descripcion3"	varchar(200),
	"descripcion4"	varchar(200),
	"descripcion5"	varchar(200),
	"descripcion6"	varchar(200),
	"descripcion7"	varchar(200),
	"descripcion8"	varchar(200),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "portfolio_areas" (
	"id"	integer NOT NULL,
	"area"	varchar(100),
	"definicion"	varchar(300),
	"class_name"	varchar(50),
	"is_active"	bool NOT NULL,
	"image"	varchar(100),
	"descripcion"	varchar(150),
	"image_principal"	varchar(100),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "portfolio_politica" (
	"id"	integer NOT NULL,
	"name"	varchar(100) NOT NULL,
	"subject"	varchar(100) NOT NULL,
	"message"	text NOT NULL,
	"is_active"	bool NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "portfolio_mensaje" (
	"id"	integer NOT NULL,
	"image"	varchar(100),
	"heading_one"	varchar(50),
	"description_one"	varchar(200),
	"heading_two"	varchar(50),
	"description_two"	varchar(200),
	"number"	integer NOT NULL,
	"check_point_one"	varchar(50),
	"check_point_two"	varchar(50),
	"check_point_three"	varchar(50),
	"btn_text"	varchar(15),
	"is_active"	bool NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "portfolio_razones" (
	"id"	integer NOT NULL,
	"heading"	varchar(50),
	"description"	varchar(300),
	"class_name"	varchar(50),
	"class_name_icon"	varchar(50),
	"is_active"	bool NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "portfolio_usercita" (
	"id"	integer NOT NULL,
	"timestamp"	datetime NOT NULL,
	"name"	varchar(100) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"phone"	varchar(100) NOT NULL,
	"fecha_cita"	datetime NOT NULL,
	"time"	varchar(50) NOT NULL,
	"message"	text NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (1,'contenttypes','0001_initial','2022-02-23 07:42:40.084559'),
 (2,'auth','0001_initial','2022-02-23 07:42:40.295761'),
 (3,'admin','0001_initial','2022-02-23 07:42:40.544807'),
 (4,'admin','0002_logentry_remove_auto_add','2022-02-23 07:42:40.669870'),
 (5,'admin','0003_logentry_add_action_flag_choices','2022-02-23 07:42:40.793054'),
 (6,'contenttypes','0002_remove_content_type_name','2022-02-23 07:42:40.922618'),
 (7,'auth','0002_alter_permission_name_max_length','2022-02-23 07:42:41.024575'),
 (8,'auth','0003_alter_user_email_max_length','2022-02-23 07:42:41.155012'),
 (9,'auth','0004_alter_user_username_opts','2022-02-23 07:42:41.277601'),
 (10,'auth','0005_alter_user_last_login_null','2022-02-23 07:42:41.396728'),
 (11,'auth','0006_require_contenttypes_0002','2022-02-23 07:42:41.514416'),
 (12,'auth','0007_alter_validators_add_error_messages','2022-02-23 07:42:41.633072'),
 (13,'auth','0008_alter_user_username_max_length','2022-02-23 07:42:41.747321'),
 (14,'auth','0009_alter_user_last_name_max_length','2022-02-23 07:42:41.873965'),
 (15,'auth','0010_alter_group_name_max_length','2022-02-23 07:42:42.003324'),
 (16,'auth','0011_update_proxy_permissions','2022-02-23 07:42:42.121817'),
 (17,'auth','0012_alter_user_first_name_max_length','2022-02-23 07:42:42.249445'),
 (18,'portfolio','0001_initial','2022-02-23 07:42:42.370904'),
 (19,'portfolio','0002_statistic_userprofile_is_active','2022-02-23 07:42:42.495168'),
 (20,'portfolio','0003_statistic_active_case_text_statistic_awards_text_and_more','2022-02-23 07:42:42.620249'),
 (21,'portfolio','0004_remove_statistic_active_case_and_more','2022-02-23 07:42:42.758425'),
 (22,'portfolio','0005_choose','2022-02-23 07:42:42.857030'),
 (23,'portfolio','0006_alter_choose_class_name','2022-02-23 07:42:42.981579'),
 (24,'portfolio','0007_choose_is_active','2022-02-23 07:42:43.121484'),
 (25,'portfolio','0008_choose_class_name_icon_alter_choose_class_name','2022-02-23 07:42:43.254375'),
 (26,'portfolio','0009_appointment','2022-02-23 07:42:43.388447'),
 (27,'portfolio','0010_alter_appointment_heading_one_and_more','2022-02-23 07:42:43.513717'),
 (28,'portfolio','0011_appointment_btn_text','2022-02-23 07:42:43.649592'),
 (29,'portfolio','0012_testimonial','2022-02-23 07:42:43.781167'),
 (30,'portfolio','0013_testimonial_class_name','2022-02-23 07:42:43.912270'),
 (31,'portfolio','0014_blog','2022-02-23 07:42:44.051879'),
 (32,'portfolio','0015_blog_image_two','2022-02-23 07:42:44.187026'),
 (33,'portfolio','0016_rename_date_blog_today_date','2022-02-23 07:42:44.323494'),
 (34,'portfolio','0017_alter_blog_options_remove_blog_today_date_and_more','2022-02-23 07:42:44.453375'),
 (35,'portfolio','0018_alter_blog_options_remove_blog_timestamp_blog_date','2022-02-23 07:42:44.587663'),
 (36,'portfolio','0019_rename_image_two_blog_admin_image','2022-02-23 07:42:44.709058'),
 (37,'portfolio','0020_contact','2022-02-23 07:42:44.822873'),
 (38,'portfolio','0021_usercontact_alter_contact_options','2022-02-23 07:42:44.952556'),
 (39,'portfolio','0022_availableschedule','2022-02-23 07:42:45.078788'),
 (40,'portfolio','0023_schedule_delete_availableschedule','2022-02-23 07:42:45.196436'),
 (41,'sessions','0001_initial','2022-02-23 07:42:45.452497'),
 (42,'portfolio','0024_alter_statistic_field_four_alter_statistic_field_one_and_more','2023-07-28 21:37:04.331479'),
 (43,'portfolio','0025_alter_choose_description','2023-07-29 02:30:36.472091'),
 (44,'portfolio','0026_alter_choose_description_alter_choose_heading','2023-08-03 01:59:31.069573'),
 (45,'portfolio','0027_areas','2023-08-03 02:12:48.054257'),
 (46,'portfolio','0028_areas_image_alter_areas_definicion_and_more','2023-08-04 19:15:59.832001'),
 (47,'portfolio','0029_quienes_somo_alter_areas_area_alter_areas_image','2023-08-06 13:22:12.493866'),
 (48,'portfolio','0030_remove_quienes_somo_descriccion_and_more','2023-08-07 16:46:22.117440'),
 (49,'portfolio','0031_mision_vision','2023-08-07 19:19:49.658846'),
 (50,'portfolio','0032_principios_valores','2023-08-08 19:13:16.157228'),
 (51,'portfolio','0033_equipo','2023-08-09 17:07:37.738382'),
 (52,'portfolio','0034_equipo_descripcion2_equipo_descripcion3_and_more','2023-08-09 18:15:45.708881'),
 (53,'portfolio','0035_equipo_descripcion8','2023-08-09 19:10:14.967275'),
 (54,'portfolio','0036_alter_areas_options_and_more','2023-08-09 21:58:30.555658'),
 (55,'portfolio','0037_politica','2023-08-10 20:54:45.441444'),
 (56,'portfolio','0038_remove_areas_class_name_imagen_areas_image_principal_and_more','2023-08-11 22:28:09.175259'),
 (57,'portfolio','0039_mensaje_delete_appointment','2023-08-18 22:44:03.829081'),
 (58,'portfolio','0040_razones_delete_choose_alter_contact_options_and_more','2023-08-18 23:10:48.005942'),
 (59,'portfolio','0041_usercitas_alter_schedule_options_and_more','2023-08-30 18:33:19.199738'),
 (60,'portfolio','0042_usercita_delete_usercitas','2023-08-30 22:43:07.091293'),
 (61,'portfolio','0043_usercitas_delete_usercita','2023-08-31 15:57:32.568330'),
 (62,'portfolio','0044_usercita_delete_usercitas','2023-08-31 16:11:25.689628');
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (1,'2022-02-23 07:45:40.612935','1','Ruhul Amin Parvez Active, Expert and Experienced','[{"added": {}}]',7,1,1),
 (2,'2022-02-23 07:48:56.904094','1','2000 500 450 10','[{"added": {}}]',8,1,1),
 (3,'2022-02-23 07:53:08.606677','1','Heading 1 Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt sapiente dolore.','[{"added": {}}]',9,1,1),
 (4,'2022-02-23 07:54:23.165436','2','Heading 2 Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt sapiente dolore.','[{"added": {}}]',9,1,1),
 (5,'2022-02-23 07:54:56.702409','3','Heading 3 Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt sapiente dolore.','[{"added": {}}]',9,1,1),
 (6,'2022-02-23 07:55:10.684873','4','Heading 4 Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt sapiente dolore.','[{"added": {}}]',9,1,1),
 (7,'2022-02-23 07:57:00.400126','1','Get a Appointment Today! Lorem ipsum viverra feugiat. Pellen tesque libero ut justo, ultrices in ligula. Semper at tempufddfel. Lorem ipsum dolor sit amet consectetur adipisicing elit. Special Educati','[{"added": {}}]',10,1,1),
 (8,'2022-02-23 07:57:14.188702','1','Get a Appointment Today! Lorem ipsum viverra feugiat. Pellen tesque libero ut justo, ultrices in ligula. Semper at tempufddfel. Lorem ipsum dolor sit amet consectetur adipisicing elit. Special Educati','[{"changed": {"fields": ["Upload an Image for Appointment Section"]}}]',10,1,2),
 (9,'2022-02-23 07:57:28.207696','1','Get a Appointment Today! Lorem ipsum viverra feugiat. Pellen tesque libero ut justo, ultrices in ligula.','[{"changed": {"fields": ["Write a Description For First Card"]}}]',10,1,2),
 (10,'2022-02-23 07:57:41.632287','1','Get a Appointment Today! Lorem ipsum viverra feugiat.','[{"changed": {"fields": ["Write a Description For First Card"]}}]',10,1,2),
 (11,'2022-02-23 07:58:28.695766','1','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation. Owali Shawon','[{"added": {}}]',11,1,1),
 (12,'2022-02-23 07:58:48.024198','2','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation. Misbah Muib','[{"added": {}}]',11,1,1),
 (13,'2022-02-23 07:59:07.185218','3','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation. Tanvir Ahmed','[{"added": {}}]',11,1,1),
 (14,'2022-02-23 07:59:22.651280','4','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation. Zahid Hossain','[{"added": {}}]',11,1,1),
 (15,'2022-02-23 07:59:50.482180','5','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation. Ruhul Amin','[{"added": {}}]',11,1,1),
 (16,'2022-02-23 07:59:55.959189','4','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation. Zahid Hossain','[{"changed": {"fields": ["Write a Class Name for Change Card Color"]}}]',11,1,2),
 (17,'2022-02-23 08:00:00.358284','3','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation. Tanvir Ahmed','[{"changed": {"fields": ["Write a Class Name for Change Card Color"]}}]',11,1,2),
 (18,'2022-02-23 08:00:03.605906','2','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation. Misbah Muib','[]',11,1,2),
 (19,'2022-02-23 08:00:29.209029','3','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation. Tanvir Ahmed','[{"changed": {"fields": ["Upload an Image of Client"]}}]',11,1,2),
 (20,'2022-02-23 08:00:34.673171','5','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation. Ruhul Amin','[{"changed": {"fields": ["Upload an Image of Client"]}}]',11,1,2),
 (21,'2022-02-23 08:01:55.646168','1','Blog Headline 1 Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt sapiente dolore.','[{"added": {}}]',12,1,1),
 (22,'2022-02-23 08:02:23.117078','2','Blog Headline 1 Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt sapiente dolore.','[{"added": {}}]',12,1,1),
 (23,'2022-02-23 08:02:59.540177','3','Blog Headline 3 Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt sapiente dolore.','[{"added": {}}]',12,1,1),
 (24,'2022-02-23 08:03:42.941856','1','Dhanmondi-32 01700000000 Intigsol@gmail.com Intigsol@gmail.com','[{"added": {}}]',13,1,1),
 (25,'2022-02-23 08:04:44.542492','1','09:00:00 10:00:00 2022-02-23 Wednesday','[{"added": {}}]',15,1,1),
 (26,'2022-02-23 08:06:33.430742','2','12:00:00 13:00:00 2022-02-24 Thursday','[{"added": {}}]',15,1,1),
 (27,'2022-02-23 08:07:17.782829','2','12:01:00 13:00:00 2022-02-24 Thursday','[{"changed": {"fields": ["Start Time"]}}]',15,1,2),
 (28,'2022-02-27 08:02:54.206619','3','16:00:00 17:00:00 2022-02-27 Wednesday','[{"added": {}}]',15,1,1),
 (29,'2022-02-27 08:05:53.886401','5','Heading 5 Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt sapiente dolore.','[{"added": {}}]',9,1,1),
 (30,'2022-02-27 08:07:16.319554','5','Heading 5 Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt sapiente dolore.','[{"changed": {"fields": ["Write a Class Name for Change Icon"]}}]',9,1,2),
 (31,'2022-02-27 08:07:35.830109','5','Heading 5 Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt sapiente dolore.','[{"changed": {"fields": ["Write a Class Name for Change Icon"]}}]',9,1,2),
 (32,'2022-02-27 08:21:12.416634','4','Blog Headline 4 Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt sapiente dolore.','[{"added": {}}]',12,1,1),
 (33,'2022-05-19 19:10:53.905784','5','Heading 5 Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt sapiente dolore.','',9,1,3),
 (34,'2023-07-28 21:43:39.371976','1','QUINTERO TORRES CORREA ABOGADOS S.A.S “Ninguno de nosotros es tan bueno como todos nosotros juntos” Ray Kroc','[{"changed": {"fields": ["Name", "Tag line", "Btn txt", "Image caption"]}}]',7,2,2),
 (35,'2023-07-29 01:30:49.692507','1','500 100 300 10','[{"changed": {"fields": ["Enter Number For Field One", "Name of Field One", "Enter Number For Field Two", "Name of Field Two", "Enter Number For Field Three", "Name of Field Three", "Name of Field Four"]}}]',8,2,2),
 (36,'2023-07-29 02:33:52.119719','1','Formación humana Porque no somos solo una firma de consultoría, somos altamente profesional, partiendo de calidad humana y con ganas de servirle a usted y a los suyos, sabiendo que nuestra gestión se ','[{"changed": {"fields": ["Write a Heading", "Write a Description"]}}]',9,2,2),
 (37,'2023-07-29 02:51:23.051853','1','Formación humana Porque no somos solo una firma de consultoría, somos altamente profesional, partiendo de calidad humana y con ganas de servirle a usted y a los suyos, sabiendo que nuestra gestión se ','[{"changed": {"fields": ["Write a Class Name for Change Icon"]}}]',9,2,2),
 (38,'2023-07-29 02:55:22.057865','1','Formación humana Porque no somos solo una firma de consultoría, somos altamente profesional, partiendo de calidad humana y con ganas de servirle a usted y a los suyos, sabiendo que nuestra gestión se ','[{"changed": {"fields": ["Write a Class Name for Change Icon"]}}]',9,2,2),
 (39,'2023-07-29 02:57:13.111455','1','Formación humana Porque no somos solo una firma de consultoría, somos altamente profesional, partiendo de calidad humana y con ganas de servirle a usted y a los suyos, sabiendo que nuestra gestión se ','[{"changed": {"fields": ["Write a Class Name for Change Icon"]}}]',9,2,2),
 (40,'2023-07-29 03:05:29.856353','1','Formación humana Porque no somos solo una firma de consultoría, somos altamente profesional, partiendo de calidad humana y con ganas de servirle a usted y a los suyos, sabiendo que nuestra gestión se ','[{"changed": {"fields": ["Write a Class Name for Change Icon"]}}]',9,2,2),
 (41,'2023-07-29 03:17:47.305704','1','Formación humana Porque no somos solo una firma de consultoría, somos altamente profesional, partiendo de calidad humana y con ganas de servirle a usted y a los suyos, sabiendo que nuestra gestión se ','[{"changed": {"fields": ["Write a Class Name for Change Icon"]}}]',9,2,2),
 (42,'2023-07-29 03:21:44.704874','1','Formación humana Porque no somos solo una firma de consultoría, somos altamente profesional, partiendo de calidad humana y con ganas de servirle a usted y a los suyos, sabiendo que nuestra gestión se ','[{"changed": {"fields": ["Write a Class Name for Change Icon"]}}]',9,2,2),
 (43,'2023-07-29 03:40:23.050161','1','Formación humana Porque no somos solo una firma de consultoría, somos altamente profesional, partiendo de calidad humana y con ganas de servirle a usted y a los suyos, sabiendo que nuestra gestión se ','[{"changed": {"fields": ["Write a Class Name for Change Icon"]}}]',9,2,2),
 (44,'2023-07-29 03:43:33.397819','1','Formación humana Porque no somos solo una firma de consultoría, somos altamente profesional, partiendo de calidad humana y con ganas de servirle a usted y a los suyos, sabiendo que nuestra gestión se ','[{"changed": {"fields": ["Write a Class Name for Change Icon"]}}]',9,2,2),
 (45,'2023-07-29 03:43:59.695484','1','Formación humana Porque no somos solo una firma de consultoría, somos altamente profesional, partiendo de calidad humana y con ganas de servirle a usted y a los suyos, sabiendo que nuestra gestión se ','[{"changed": {"fields": ["Write a Class Name for Change Icon"]}}]',9,2,2),
 (46,'2023-07-29 13:14:56.602105','2','GENERAMOS CONFIANZA Porque generamos confianza en nuestros clientes en cada caso que aceptamos, es porque consideraremos que su problema puede ser resuelto por nuestro equipo de expertos, fundamentado','[{"changed": {"fields": ["Escribe una Razon", "Escribe una Descripci\u00f3n"]}}]',9,2,2),
 (47,'2023-07-29 13:15:42.202219','2','Generamos Confianza Porque generamos confianza en nuestros clientes en cada caso que aceptamos, es porque consideraremos que su problema puede ser resuelto por nuestro equipo de expertos, fundamentado','[{"changed": {"fields": ["Escribe una Razon"]}}]',9,2,2),
 (48,'2023-07-29 13:20:24.002607','1','Formación humana Porque no somos solo una firma de consultoría, somos altamente profesional, partiendo de calidad humana y con ganas de servirle a usted y a los suyos, sabiendo que nuestra gestión se ','[]',9,2,2),
 (49,'2023-07-29 13:20:37.650144','2','Generamos Confianza Porque generamos confianza en nuestros clientes en cada caso que aceptamos, es porque consideraremos que su problema puede ser resuelto por nuestro equipo de expertos, fundamentado','[{"changed": {"fields": ["Write a Class Name for Change Icon"]}}]',9,2,2),
 (50,'2023-07-29 13:24:34.115050','3','Legalidad Porque nos basamos en el respeto y ética, siempre dentro del marco de la ley, nuestras acciones están encaminadas a respetar los derechos y obligaciones de todos.','[{"changed": {"fields": ["Escribe una Razon", "Escribe una Descripci\u00f3n", "Write a Class Name for Change Icon"]}}]',9,2,2),
 (51,'2023-07-29 14:58:49.775379','4','Buena Comunicación La comunicación efectiva no solo significa conocer mucho vocabulario legal y hablar en público con fluidez, es saber entregarle un mensaje claro, preciso, objetivo, oportuno, que le','[{"changed": {"fields": ["Escribe una Razon", "Escribe una Descripci\u00f3n", "Write a Class Name for Change Icon"]}}]',9,2,2),
 (52,'2023-07-29 22:15:47.422086','1','Obtenga una cita hoy! Es un gusto atenderle.','[{"changed": {"fields": ["Write a Heading For First Card", "Write a Description For First Card", "Write a Heading For Second Card", "Write a Description For Second Card", "Enter Number For Appointment"]}}]',10,2,2),
 (53,'2023-07-29 22:43:11.877003','1','Obtenga una cita hoy! Es un gusto atenderle.','[{"changed": {"fields": ["Write a First Check Point", "Write a Second Check Point", "Write a Third Check Point", "Write a Button Text"]}}]',10,2,2),
 (54,'2023-07-29 22:47:40.080367','5','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation. Ruhul Amin','[{"changed": {"fields": ["Is active"]}}]',11,2,2),
 (55,'2023-07-29 22:47:53.541426','4','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation. Zahid Hossain','[{"changed": {"fields": ["Is active"]}}]',11,2,2),
 (56,'2023-07-29 22:48:07.601569','3','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation. Tanvir Ahmed','[{"changed": {"fields": ["Is active"]}}]',11,2,2),
 (57,'2023-07-29 22:48:29.025038','2','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation. Misbah Muib','[{"changed": {"fields": ["Is active"]}}]',11,2,2),
 (58,'2023-07-29 23:03:45.439295','1','Ibagué, Tolima (+57) 3165249761 abogadosqtc@gmail.com abogadosqtc@gmail.com','[{"changed": {"fields": ["Set An Address", "Set Phone Number", "Set Email", "Set Support Email"]}}]',13,2,2),
 (59,'2023-07-29 23:31:01.219983','3','16:00:00 17:00:00 2023-08-02 Miercoles','[{"changed": {"fields": ["Date", "Day"]}}]',15,2,2),
 (60,'2023-07-29 23:31:45.279929','2','10:00:00 11:00:00 2023-08-03 Jueves','[{"changed": {"fields": ["Start Time", "End Time", "Date", "Day"]}}]',15,2,2),
 (61,'2023-07-29 23:32:11.430840','1','09:00:00 10:00:00 2023-08-04 Viernes','[{"changed": {"fields": ["Date", "Day"]}}]',15,2,2),
 (62,'2023-08-01 23:00:01.826934','1','BIENVENIDOS Somos una de las mejores firmas de Abogados a nivel nacional, donde lo primordial es la solución de las necesidades de los clientes.','[{"changed": {"fields": ["Name", "Tag line"]}}]',7,2,2),
 (63,'2023-08-03 02:47:31.463321','1','DERECHO ADMNISTRATIVO Y DE LO CONTENCIOSO Constituye el conjunto de normas que rigen la solución por vía jurisdiccional de los litigios admini','[{"added": {}}]',16,2,1),
 (64,'2023-08-03 02:50:45.025936','2','DERECHO PENAL Se encarga de normar y concebir las capacidades punitivas, es decir, de castigo.','[{"added": {}}]',16,2,1),
 (65,'2023-08-03 02:54:59.302638','3','DERECHO CIVIL Nos ocupa de las cuestiones que afectan a la persona, desde su nacimiento y relaciones familiar hast','[{"added": {}}]',16,2,1),
 (66,'2023-08-04 19:06:40.579385','4','DERECHO LABORAL Es asdasdasdasdasdasdas','[{"added": {}}]',16,2,1),
 (67,'2023-08-04 19:17:44.216616','1','DERECHO ADMNISTRATIVO Y DE LO CONTENCIOSO Constituye el conjunto de normas que rigen la solución por vía jurisdiccional de los litigios admini','[{"changed": {"fields": ["Subir Imagen del Area"]}}]',16,2,2),
 (68,'2023-08-04 19:18:23.589534','2','DERECHO PENAL Se encarga de normar y concebir las capacidades punitivas, es decir, de castigo.','[{"changed": {"fields": ["Subir Imagen del Area"]}}]',16,2,2),
 (69,'2023-08-04 19:18:37.902681','3','DERECHO CIVIL Nos ocupa de las cuestiones que afectan a la persona, desde su nacimiento y relaciones familiar hast','[{"changed": {"fields": ["Subir Imagen del Area"]}}]',16,2,2),
 (70,'2023-08-04 19:18:54.090646','4','DERECHO LABORAL Es asdasdasdasdasdasdas','[{"changed": {"fields": ["Subir Imagen del Area"]}}]',16,2,2),
 (71,'2023-08-04 19:30:17.683490','1','DERECHO ADMNISTRATIVO Y DE LO CONTENCIOSO Constituye el conjunto de normas que rigen la solución por vía jurisdiccional de los litigios admini','[{"changed": {"fields": ["Subir Imagen del Area"]}}]',16,2,2),
 (72,'2023-08-04 19:31:02.732978','2','DERECHO PENAL Se encarga de normar y concebir las capacidades punitivas, es decir, de castigo.','[{"changed": {"fields": ["Subir Imagen del Area"]}}]',16,2,2),
 (73,'2023-08-04 19:31:25.741934','3','DERECHO CIVIL Nos ocupa de las cuestiones que afectan a la persona, desde su nacimiento y relaciones familiar hast','[{"changed": {"fields": ["Subir Imagen del Area"]}}]',16,2,2),
 (74,'2023-08-04 21:32:16.232807','4','DERECHO COMERCIAL Es asdasdasdasdasdasdas','[{"changed": {"fields": ["Escribe una Area", "Subir Imagen del Area"]}}]',16,2,2),
 (75,'2023-08-04 21:32:53.439337','5','DERECHO CONTRACTUAL PUBLICO Y PRIVADO es....','[{"added": {}}]',16,2,1),
 (76,'2023-08-04 23:01:23.230084','6','DERECHO DISCIPLINARIO Es tratado','[{"added": {}}]',16,2,1),
 (77,'2023-08-04 23:03:13.710121','7','DERECHO TRIBUTARIO Es una rea donde se trata','[{"added": {}}]',16,2,1),
 (78,'2023-08-04 23:04:36.359595','8','PROPIEDAD INTELECTUAL Y DERECHO DEL ENTRETENIMIENTO Es una Área de asesoría','[{"added": {}}]',16,2,1),
 (79,'2023-08-05 00:33:38.433529','1','DERECHO ADMNISTRATIVO Y DE LO CONTENCIOSO Constituye el conjunto de normas que rigen la solución por vía jurisdiccional de los litigios admini','[{"changed": {"fields": ["Subir Imagen del Area"]}}]',16,2,2),
 (80,'2023-08-05 00:33:55.418171','2','DERECHO PENAL Se encarga de normar y concebir las capacidades punitivas, es decir, de castigo.','[{"changed": {"fields": ["Subir Imagen del Area"]}}]',16,2,2),
 (81,'2023-08-05 00:34:08.562796','3','DERECHO CIVIL Nos ocupa de las cuestiones que afectan a la persona, desde su nacimiento y relaciones familiar hast','[{"changed": {"fields": ["Subir Imagen del Area"]}}]',16,2,2),
 (82,'2023-08-05 00:34:21.063782','4','DERECHO COMERCIAL Es asdasdasdasdasdasdas','[{"changed": {"fields": ["Subir Imagen del Area"]}}]',16,2,2),
 (83,'2023-08-05 00:34:31.748103','5','DERECHO CONTRACTUAL PUBLICO Y PRIVADO es....','[{"changed": {"fields": ["Subir Imagen del Area"]}}]',16,2,2),
 (84,'2023-08-05 00:34:41.988133','6','DERECHO DISCIPLINARIO Es tratado','[{"changed": {"fields": ["Subir Imagen del Area"]}}]',16,2,2),
 (85,'2023-08-07 16:25:39.772806','1','Quienes Somos Somos una de las mejores firmas de Abogados a nivel nacional, donde lo primordial es la solución de las necesidades de los clientes.   Nuestro prestigio es el resultado de años de experi','[{"added": {}}]',17,2,1),
 (86,'2023-08-07 16:43:35.906133','1','Quienes Somos Somos una de las mejores firmas de Abogados a nivel nacional, donde lo primordial es la solución de las necesidades de los clientes. <br>  Nuestro prestigio es el resultado de años de ex','[{"changed": {"fields": ["Escribe una descripcion"]}}]',17,2,2),
 (87,'2023-08-07 16:49:56.251506','1','Quienes Somos Somos una de las mejores firmas de Abogados a nivel nacional, donde lo primordial es la solución de las necesidades de los clientes.','[{"changed": {"fields": ["Escribe primer parrafo", "Escribe segundo parrafo", "Escribe tercer parrafo"]}}]',17,2,2),
 (88,'2023-08-07 19:27:56.227241','1','MISIÓN QUINTERO  TORRES  CORREA ABOGADOS SAS, es una Firma de Abogados que, con un enfoque multidisciplinario, representa y brinda soluciones jurídicas reales, así como a entidades públicas y privad','[{"added": {}}]',18,2,1),
 (89,'2023-08-07 19:28:30.292082','1','VISIÓN En el 2030 la firma QUINTERO  TORRES  CORREA  ABOGADOS  SAS, liderar el ligio a nivel nacional, en las diferentes ramas del derecho colombiano. Siendo una de las mejores firmas de abogados en','[{"added": {}}]',19,2,1),
 (90,'2023-08-08 15:04:46.811935','1','MISIÓN QUINTERO TORRES CORREA ABOGADOS SAS, es una Firma de Abogados que, con un enfoque multidisciplinario, representa y brinda soluciones jurídicas reales, así como a entidades públicas y privadas, ','[{"changed": {"fields": ["Escribe la misi\u00f3n"]}}]',18,2,2),
 (91,'2023-08-08 19:41:46.466158','1','PRINCIPIOS Compromiso','[{"added": {}}]',20,2,1),
 (92,'2023-08-08 19:43:52.079736','1','VALORES CORPORATIVOS Honestidad','[{"added": {}}]',21,2,1),
 (93,'2023-08-08 20:36:59.460672','1','VISIÓN En el 2030 la firma QUINTERO TORRES CORREA  ABOGADOS  SAS, liderar el ligio a nivel nacional, en las diferentes ramas del derecho colombiano. Siendo una de las mejores firmas de abogados en res','[{"changed": {"fields": ["Escribe la Visi\u00f3n"]}}]',19,2,2),
 (94,'2023-08-08 20:45:02.390952','1','PRINCIPIOS Compromiso','[{"changed": {"fields": ["Suba imagen para Principios"]}}]',20,2,2),
 (95,'2023-08-09 17:13:27.991705','1','Dr. CESAR AUGUSTO CORREA RAYO Representante legal','[{"added": {}}]',22,2,1),
 (96,'2023-08-09 17:15:13.881159','2','Dr. JHON ALEXANDER TORRES ALVAREZ Abogado','[{"added": {}}]',22,2,1),
 (97,'2023-08-09 17:15:44.207553','3','Dr. NUMAEL QUINTERO OROZCO Abogado','[{"added": {}}]',22,2,1),
 (98,'2023-08-09 17:18:36.662957','3','Dr. NUMAEL QUINTERO OROZCO Abogado','[{"changed": {"fields": ["Subir imagen del equipo"]}}]',22,2,2),
 (99,'2023-08-09 17:18:45.060050','1','Dr. CESAR AUGUSTO CORREA RAYO Representante legal','[{"changed": {"fields": ["Subir imagen del equipo"]}}]',22,2,2),
 (100,'2023-08-09 19:06:28.449568','1','Dr. CESAR AUGUSTO CORREA RAYO Representante legal','[{"changed": {"fields": ["Escribe otra descripcion", "Escribe otra descripcion", "Escribe otra descripcion", "Escribe otra descripcion"]}}]',22,2,2),
 (101,'2023-08-09 19:07:46.946439','2','Dr. JHON ALEXANDER TORRES ALVAREZ Abogado','[{"changed": {"fields": ["Escribe otra descripcion", "Escribe otra descripcion", "Escribe otra descripcion", "Escribe otra descripcion", "Escribe otra descripcion"]}}]',22,2,2),
 (102,'2023-08-09 19:09:05.745823','3','Dr. NUMAEL QUINTERO OROZCO Abogado','[{"changed": {"fields": ["Escribe otra descripcion", "Escribe otra descripcion", "Escribe otra descripcion", "Escribe otra descripcion", "Escribe otra descripcion", "Escribe otra descripcion"]}}]',22,2,2),
 (103,'2023-08-09 19:10:45.757231','3','Dr. NUMAEL QUINTERO OROZCO Abogado','[{"changed": {"fields": ["Escribe otra descripcion"]}}]',22,2,2),
 (104,'2023-08-09 22:16:11.164188','1','DERECHO ADMINISTRATIVO Y DE LO CONTENCIOSO Constituye el conjunto de normas que rigen la solución por vía jurisdiccional de los litigios admini','[{"changed": {"fields": ["Escribe una Area"]}}]',16,2,2),
 (105,'2023-08-10 15:51:07.435669','1','DERECHO ADMINISTRATIVO Y DE LO CONTENCIOSO consiste en informar, gestionar y reclamar cualquier problemática que pueda surgir entre los ciudadanos y la Administración Pública.','[{"changed": {"fields": ["Escribe una Descripci\u00f3n corta"]}}]',16,2,2),
 (106,'2023-08-10 21:18:28.793217','1','Articulo 1','[{"added": {}}]',23,2,1),
 (107,'2023-08-11 21:53:49.415832','1','DERECHO ADMINISTRATIVO Y DE LO CONTENCIOSO Consiste en informar, gestionar y reclamar cualquier problemática que pueda surgir entre los ciudadanos y la Administración Pública.','[{"changed": {"fields": ["Escribe una Descripci\u00f3n corta", "Escribe una Definici\u00f3n"]}}]',16,2,2),
 (108,'2023-08-12 00:02:59.432578','1','DERECHO ADMINISTRATIVO Y DE LO CONTENCIOSO Consiste en informar, gestionar y reclamar cualquier problemática que pueda surgir entre los ciudadanos y la Administración Pública.','[{"changed": {"fields": ["Subir Imagen Principal"]}}]',16,2,2),
 (109,'2023-08-12 00:14:59.484356','2','DERECHO PENAL el cual es experto en tratar casos complejos y defender la justicia ante los Juzgados de Primera Instancia e Instrucción.','[{"changed": {"fields": ["Escribe una Descripci\u00f3n corta"]}}]',16,2,2),
 (110,'2023-08-12 00:19:13.508004','2','DERECHO PENAL el cual es experto en tratar casos complejos y defender la justicia ante los Juzgados de Primera Instancia e Instrucción.','[{"changed": {"fields": ["Subir Imagen Principal"]}}]',16,2,2),
 (111,'2023-08-16 14:29:53.229223','3','DERECHO CIVIL Un abogado civilista es el encargado del derecho de las personas, obligaciones y contratos, derechos reales y derecho de familias y sucesiones.','[{"changed": {"fields": ["Escribe una Descripci\u00f3n corta", "Escribe una Definici\u00f3n", "Subir Imagen inicial"]}}]',16,2,2),
 (112,'2023-08-16 14:43:04.295255','2','DERECHO PENAL Se ocupa de definir qué conductas o comportamientos son constitutivos de delito, cómo se enjuiciarán estas causas ante un juzgado o tribunal.','[{"changed": {"fields": ["Escribe una Descripci\u00f3n corta", "Escribe una Definici\u00f3n"]}}]',16,2,2),
 (113,'2023-08-16 14:43:17.298025','2','DERECHO PENAL Se ocupa de definir qué conductas o comportamientos son constitutivos de delito, cómo se enjuiciarán estas causas ante un juzgado o tribunal.','[]',16,2,2),
 (114,'2023-08-16 14:45:34.562901','3','DERECHO CIVIL Un abogado civilista es el encargado del derecho de las personas, obligaciones y contratos, derechos reales y derecho de familias y sucesiones.','[{"changed": {"fields": ["Subir Imagen Principal"]}}]',16,2,2),
 (115,'2023-08-16 14:56:20.984686','4','DERECHO COMERCIAL somos una firma de abogados en derecho comercial dedicados exclusivamente al área del derecho comercial en Colombia.','[{"changed": {"fields": ["Escribe una Descripci\u00f3n corta", "Escribe una Definici\u00f3n"]}}]',16,2,2),
 (116,'2023-08-16 14:56:31.590643','4','DERECHO COMERCIAL Somos una firma de abogados en derecho comercial dedicados exclusivamente al área del derecho comercial en Colombia.','[{"changed": {"fields": ["Escribe una Descripci\u00f3n corta"]}}]',16,2,2),
 (117,'2023-08-16 16:02:19.008187','4','DERECHO COMERCIAL Somos una firma de abogados en derecho comercial dedicados exclusivamente al área del derecho comercial en Colombia.','[]',16,2,2),
 (118,'2023-08-16 16:08:06.733157','4','DERECHO COMERCIAL Somos una firma de abogados en derecho comercial dedicados exclusivamente al área del derecho comercial en Colombia.','[{"changed": {"fields": ["Subir Imagen Principal"]}}]',16,2,2),
 (119,'2023-08-16 17:03:36.456844','5','DERECHO CONTRACTUAL PUBLICO Y PRIVADO Acto jurídico presentes en un contrato, tenemos una amplia experiencia en los distintos tipos de acuerdos que se firman con mayor frecuencia.','[{"changed": {"fields": ["Escribe una Descripci\u00f3n corta", "Escribe una Definici\u00f3n", "Subir Imagen Principal"]}}]',16,2,2),
 (120,'2023-08-16 17:08:46.572935','5','DERECHO CONTRACTUAL PUBLICO Y PRIVADO Acto jurídico presentes en un contrato, tenemos una amplia experiencia en los distintos tipos de acuerdos que se firman con mayor frecuencia.','[{"changed": {"fields": ["Subir Imagen Principal"]}}]',16,2,2),
 (121,'2023-08-16 17:17:51.712726','6','DERECHO DISCIPLINARIO Compete a los servidores públicos, implica un conjunto de normas y principios, además sanciones si hay faltas en el cumplimiento de sus funciones.','[{"changed": {"fields": ["Escribe una Descripci\u00f3n corta"]}}]',16,2,2),
 (122,'2023-08-16 17:19:48.311092','6','DERECHO DISCIPLINARIO Compete a los servidores públicos, implica un conjunto de normas y principios, además sanciones si hay faltas en el cumplimiento de sus funciones.','[{"changed": {"fields": ["Escribe una Definici\u00f3n"]}}]',16,2,2),
 (123,'2023-08-16 20:24:21.966108','6','DERECHO DISCIPLINARIO Compete a los servidores públicos, implica un conjunto de normas y principios, además sanciones si hay faltas en el cumplimiento de sus funciones.','[{"changed": {"fields": ["Subir Imagen Principal"]}}]',16,2,2),
 (124,'2023-08-17 20:37:13.403585','7','DERECHO TRIBUTARIO Somos abogados especialistas en la asesoría y acompañamiento de asuntos tributarios, fiscales y cambiarios.','[{"changed": {"fields": ["Escribe una Descripci\u00f3n corta", "Escribe una Definici\u00f3n", "Subir Imagen Principal"]}}]',16,2,2),
 (125,'2023-08-18 20:16:26.617811','8','PROPIEDAD INTELECTUAL Y DERECHO DEL ENTRETENIMIENTO Prestamos un servicio integral en temas de registro, protección comercial de marcas, patentes, modelos de utilidad, transferencia de tecnología.','[{"changed": {"fields": ["Escribe una Descripci\u00f3n corta", "Escribe una Definici\u00f3n", "Subir Imagen inicial", "Subir Imagen Principal"]}}]',16,2,2),
 (126,'2023-08-19 14:58:20.784585','1','Get a Appointment Today! None','[{"added": {}}]',24,2,1),
 (127,'2023-08-19 18:59:57.637209','1','Get a Appointment Today! None','[{"changed": {"fields": ["Introduce un numero de telefono"]}}]',24,2,2),
 (128,'2023-08-19 19:08:02.709577','1','Formación humana Cotamos con personal de calidad humana y total disposición para servirle a usted y los suyos, nuestra gestión se desarrolla a partir de un profundo sentido de la ética no solo jurídic','[{"added": {}}]',25,2,1),
 (129,'2023-08-19 20:30:12.354201','1','Formación humana Cotamos con personal de calidad humana y total disposición para servirle a usted y los suyos, nuestra gestión se desarrolla a partir de un profundo sentido de la ética no solo jurídic','[{"changed": {"fields": ["class_name_icon"]}}]',25,2,2),
 (130,'2023-08-19 20:34:02.094814','1','Formación humana Cotamos con personal de calidad humana y total disposición para servirle a usted y los suyos, nuestra gestión se desarrolla a partir de un profundo sentido de la ética no solo jurídic','[{"changed": {"fields": ["class_name_icon"]}}]',25,2,2),
 (131,'2023-08-19 20:35:11.812200','1','Formación humana Cotamos con personal de calidad humana y total disposición para servirle a usted y los suyos, nuestra gestión se desarrolla a partir de un profundo sentido de la ética no solo jurídic','[{"changed": {"fields": ["class_name_icon"]}}]',25,2,2),
 (132,'2023-08-19 20:38:21.275048','1','Formación humana Cotamos con personal de calidad humana y total disposición para servirle a usted y los suyos, nuestra gestión se desarrolla a partir de un profundo sentido de la ética no solo jurídic','[{"changed": {"fields": ["class_name_icon"]}}]',25,2,2),
 (133,'2023-08-19 20:39:26.828742','1','Formación humana Cotamos con personal de calidad humana y total disposición para servirle a usted y los suyos, nuestra gestión se desarrolla a partir de un profundo sentido de la ética no solo jurídic','[{"changed": {"fields": ["class_name_icon"]}}]',25,2,2),
 (134,'2023-08-19 20:39:58.216172','1','Formación humana Cotamos con personal de calidad humana y total disposición para servirle a usted y los suyos, nuestra gestión se desarrolla a partir de un profundo sentido de la ética no solo jurídic','[{"changed": {"fields": ["class_name_icon"]}}]',25,2,2),
 (135,'2023-08-19 21:04:42.233883','1','Formación humana Cotamos con personal de calidad humana y total disposición para servirle a usted y los suyos, nuestra gestión se desarrolla a partir de un profundo sentido de la ética no solo jurídic','[{"changed": {"fields": ["class_name_icon"]}}]',25,2,2),
 (136,'2023-08-19 21:09:54.801192','1','Formación humana Cotamos con personal de calidad humana y total disposición para servirle a usted y los suyos, nuestra gestión se desarrolla a partir de un profundo sentido de la ética no solo jurídic','[]',25,2,2),
 (137,'2023-08-19 21:10:34.895771','2','Trabajo en equipo Consolidada nuestra alianza formamos un equipo, acompañamos grandes y pequeñas empresas, poniendo a su disposición nuestro conocimiento y experiencia, ¡trabajamos en equipo por una m','[{"added": {}}]',25,2,1),
 (138,'2023-08-19 21:25:58.177507','2','Trabajo en equipo Consolidada nuestra alianza formamos un equipo, acompañamos grandes y pequeñas empresas, poniendo a su disposición nuestro conocimiento y experiencia, ¡trabajamos en equipo por una m','[]',25,2,2),
 (139,'2023-08-19 21:26:04.515142','2','Trabajo en equipo Consolidada nuestra alianza formamos un equipo, acompañamos grandes y pequeñas empresas, poniendo a su disposición nuestro conocimiento y experiencia, ¡trabajamos en equipo por una m','[]',25,2,2),
 (140,'2023-08-19 21:26:34.438988','3','Buena Comunicación Somos abogados empáticos capaz de comprender y acompañar a su cliente en la difícil situación que atraviesa. La atención y la presencia son fundamentales para una comunicación asert','[{"added": {}}]',25,2,1),
 (141,'2023-08-19 21:28:57.768816','4','SOMOS RESPONSABLES None','[{"added": {}}]',25,2,1),
 (142,'2023-08-19 21:29:08.596135','3','Buena Comunicación Somos abogados empáticos capaz de comprender y acompañar a su cliente en la difícil situación que atraviesa. La atención y la presencia son fundamentales para una comunicación asert','[]',25,2,2),
 (143,'2023-08-19 21:31:55.317227','4','Somos Responsables Porque actuamos con responsabilidad y nuestro compromiso será tratar tu caso como si fuera único y le daremos la atención e importancia que se merece, siempre te daremos absoluta tr','[{"changed": {"fields": ["Escribe una Razon", "Escribe una Descripci\u00f3n"]}}]',25,2,2),
 (144,'2023-08-19 21:32:02.034611','3','Buena Comunicación Somos abogados empáticos capaz de comprender y acompañar a su cliente en la difícil situación que atraviesa. La atención y la presencia son fundamentales para una comunicación asert','[]',25,2,2),
 (145,'2023-08-19 21:32:16.145722','4','Somos Responsables Porque actuamos con responsabilidad y nuestro compromiso será tratar tu caso como si fuera único y le daremos la atención e importancia que se merece, siempre te daremos absoluta tr','[{"changed": {"fields": ["class_name_icon"]}}]',25,2,2),
 (146,'2023-08-19 21:44:43.749300','1','¡Asesórate y contáctanos! None','[{"changed": {"fields": ["Escribir un titulo para la secci\u00f3n", "Escribir otro titulo para la secci\u00f3n"]}}]',24,2,2),
 (147,'2023-08-19 21:47:25.355409','1','¡Asesórate y contáctanos! Llámanos','[{"changed": {"fields": ["Escribe una descripci\u00f3n para la secci\u00f3n", "Escribe una descripci\u00f3n para la secci\u00f3n"]}}]',24,2,2),
 (148,'2023-08-19 21:49:40.635680','1','¡Asesórate y contáctanos! Llámanos','[{"changed": {"fields": ["Escribe primera caracteristica", "Escribe segunda caracteristica", "Escribe tercera caracteristica"]}}]',24,2,2),
 (149,'2023-08-22 20:31:24.611166','1','DERECHO ADMINISTRATIVO Y DE LO CONTENCIOSO Consiste en informar, gestionar y reclamar cualquier problemática que pueda surgir entre los ciudadanos y la Administración Pública.','[]',16,2,2),
 (150,'2023-08-22 20:33:02.035251','2','DERECHO PENAL Se ocupa de definir qué conductas o comportamientos son constitutivos de delito, cómo se enjuiciarán estas causas ante un juzgado o tribunal.','[]',16,2,2),
 (151,'2023-08-22 20:35:48.403883','3','DERECHO CIVIL Un abogado civilista es el encargado del derecho de las personas, obligaciones y contratos, derechos reales y derecho de familias y sucesiones.','[]',16,2,2),
 (152,'2023-08-22 20:36:48.970125','4','DERECHO COMERCIAL Somos una firma de abogados en derecho comercial dedicados exclusivamente al área del derecho comercial en Colombia.','[]',16,2,2),
 (153,'2023-08-22 20:38:07.453122','5','DERECHO CONTRACTUAL PUBLICO Y PRIVADO Acto jurídico presentes en un contrato, tenemos una amplia experiencia en los distintos tipos de acuerdos que se firman con mayor frecuencia.','[]',16,2,2),
 (154,'2023-08-22 20:38:56.960088','6','DERECHO DISCIPLINARIO Compete a los servidores públicos, implica un conjunto de normas y principios, además sanciones si hay faltas en el cumplimiento de sus funciones.','[]',16,2,2),
 (155,'2023-08-22 20:40:06.568550','7','DERECHO TRIBUTARIO Somos abogados especialistas en la asesoría y acompañamiento de asuntos tributarios, fiscales y cambiarios.','[]',16,2,2),
 (156,'2023-08-29 19:58:22.807138','1','isacc','',14,2,3);
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (1,'admin','logentry'),
 (2,'auth','permission'),
 (3,'auth','group'),
 (4,'auth','user'),
 (5,'contenttypes','contenttype'),
 (6,'sessions','session'),
 (7,'portfolio','userprofile'),
 (8,'portfolio','statistic'),
 (9,'portfolio','choose'),
 (10,'portfolio','appointment'),
 (11,'portfolio','testimonial'),
 (12,'portfolio','blog'),
 (13,'portfolio','contact'),
 (14,'portfolio','usercontact'),
 (15,'portfolio','schedule'),
 (16,'portfolio','areas'),
 (17,'portfolio','quienes_somo'),
 (18,'portfolio','mision'),
 (19,'portfolio','vision'),
 (20,'portfolio','principios'),
 (21,'portfolio','valores'),
 (22,'portfolio','equipo'),
 (23,'portfolio','politica'),
 (24,'portfolio','mensaje'),
 (25,'portfolio','razones'),
 (26,'portfolio','usercitas'),
 (27,'portfolio','usercita');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (1,1,'add_logentry','Can add log entry'),
 (2,1,'change_logentry','Can change log entry'),
 (3,1,'delete_logentry','Can delete log entry'),
 (4,1,'view_logentry','Can view log entry'),
 (5,2,'add_permission','Can add permission'),
 (6,2,'change_permission','Can change permission'),
 (7,2,'delete_permission','Can delete permission'),
 (8,2,'view_permission','Can view permission'),
 (9,3,'add_group','Can add group'),
 (10,3,'change_group','Can change group'),
 (11,3,'delete_group','Can delete group'),
 (12,3,'view_group','Can view group'),
 (13,4,'add_user','Can add user'),
 (14,4,'change_user','Can change user'),
 (15,4,'delete_user','Can delete user'),
 (16,4,'view_user','Can view user'),
 (17,5,'add_contenttype','Can add content type'),
 (18,5,'change_contenttype','Can change content type'),
 (19,5,'delete_contenttype','Can delete content type'),
 (20,5,'view_contenttype','Can view content type'),
 (21,6,'add_session','Can add session'),
 (22,6,'change_session','Can change session'),
 (23,6,'delete_session','Can delete session'),
 (24,6,'view_session','Can view session'),
 (25,7,'add_userprofile','Can add User Profile'),
 (26,7,'change_userprofile','Can change User Profile'),
 (27,7,'delete_userprofile','Can delete User Profile'),
 (28,7,'view_userprofile','Can view User Profile'),
 (29,8,'add_statistic','Can add Statistic'),
 (30,8,'change_statistic','Can change Statistic'),
 (31,8,'delete_statistic','Can delete Statistic'),
 (32,8,'view_statistic','Can view Statistic'),
 (33,9,'add_choose','Can add Choose Us'),
 (34,9,'change_choose','Can change Choose Us'),
 (35,9,'delete_choose','Can delete Choose Us'),
 (36,9,'view_choose','Can view Choose Us'),
 (37,10,'add_appointment','Can add Appointment'),
 (38,10,'change_appointment','Can change Appointment'),
 (39,10,'delete_appointment','Can delete Appointment'),
 (40,10,'view_appointment','Can view Appointment'),
 (41,11,'add_testimonial','Can add Testimonial'),
 (42,11,'change_testimonial','Can change Testimonial'),
 (43,11,'delete_testimonial','Can delete Testimonial'),
 (44,11,'view_testimonial','Can view Testimonial'),
 (45,12,'add_blog','Can add Blog'),
 (46,12,'change_blog','Can change Blog'),
 (47,12,'delete_blog','Can delete Blog'),
 (48,12,'view_blog','Can view Blog'),
 (49,13,'add_contact','Can add Contact Info'),
 (50,13,'change_contact','Can change Contact Info'),
 (51,13,'delete_contact','Can delete Contact Info'),
 (52,13,'view_contact','Can view Contact Info'),
 (53,14,'add_usercontact','Can add User Contact Info'),
 (54,14,'change_usercontact','Can change User Contact Info'),
 (55,14,'delete_usercontact','Can delete User Contact Info'),
 (56,14,'view_usercontact','Can view User Contact Info'),
 (57,15,'add_schedule','Can add Set Available Time For Appointment'),
 (58,15,'change_schedule','Can change Set Available Time For Appointment'),
 (59,15,'delete_schedule','Can delete Set Available Time For Appointment'),
 (60,15,'view_schedule','Can view Set Available Time For Appointment'),
 (61,16,'add_areas','Can add areas'),
 (62,16,'change_areas','Can change areas'),
 (63,16,'delete_areas','Can delete areas'),
 (64,16,'view_areas','Can view areas'),
 (65,17,'add_quienes_somo','Can add Quienes_Somo'),
 (66,17,'change_quienes_somo','Can change Quienes_Somo'),
 (67,17,'delete_quienes_somo','Can delete Quienes_Somo'),
 (68,17,'view_quienes_somo','Can view Quienes_Somo'),
 (69,18,'add_mision','Can add Misiones'),
 (70,18,'change_mision','Can change Misiones'),
 (71,18,'delete_mision','Can delete Misiones'),
 (72,18,'view_mision','Can view Misiones'),
 (73,19,'add_vision','Can add Visiones'),
 (74,19,'change_vision','Can change Visiones'),
 (75,19,'delete_vision','Can delete Visiones'),
 (76,19,'view_vision','Can view Visiones'),
 (77,20,'add_principios','Can add Principios'),
 (78,20,'change_principios','Can change Principios'),
 (79,20,'delete_principios','Can delete Principios'),
 (80,20,'view_principios','Can view Principios'),
 (81,21,'add_valores','Can add Valores'),
 (82,21,'change_valores','Can change Valores'),
 (83,21,'delete_valores','Can delete Valores'),
 (84,21,'view_valores','Can view Valores'),
 (85,22,'add_equipo','Can add Equipo'),
 (86,22,'change_equipo','Can change Equipo'),
 (87,22,'delete_equipo','Can delete Equipo'),
 (88,22,'view_equipo','Can view Equipo'),
 (89,23,'add_politica','Can add Politica'),
 (90,23,'change_politica','Can change Politica'),
 (91,23,'delete_politica','Can delete Politica'),
 (92,23,'view_politica','Can view Politica'),
 (93,24,'add_mensaje','Can add Mensaje'),
 (94,24,'change_mensaje','Can change Mensaje'),
 (95,24,'delete_mensaje','Can delete Mensaje'),
 (96,24,'view_mensaje','Can view Mensaje'),
 (97,25,'add_razones','Can add Razones'),
 (98,25,'change_razones','Can change Razones'),
 (99,25,'delete_razones','Can delete Razones'),
 (100,25,'view_razones','Can view Razones'),
 (101,26,'add_usercitas','Can add Información de Contactos con Solicitud de citas'),
 (102,26,'change_usercitas','Can change Información de Contactos con Solicitud de citas'),
 (103,26,'delete_usercitas','Can delete Información de Contactos con Solicitud de citas'),
 (104,26,'view_usercitas','Can view Información de Contactos con Solicitud de citas'),
 (105,27,'add_usercita','Can add Información de Contactos con Solicitud de citas'),
 (106,27,'change_usercita','Can change Información de Contactos con Solicitud de citas'),
 (107,27,'delete_usercita','Can delete Información de Contactos con Solicitud de citas'),
 (108,27,'view_usercita','Can view Información de Contactos con Solicitud de citas');
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","username","last_name","email","is_staff","is_active","date_joined","first_name") VALUES (1,'pbkdf2_sha256$320000$ePnWvauX573In1MhlInE5x$dBpMkBj5jXrQWamoHNZTNdQ8p0LO566chgJ3zsRcBDw=','2022-05-19 19:10:35.315611',1,'admin','','admin@gmail.com',1,1,'2022-02-23 07:44:08.771800',''),
 (2,'pbkdf2_sha256$320000$X9297CGzY7woKq3DtbXcG7$vpEEqHjGXP5aGUqXBqYZH6wdLcVDyDJZU9fmVA9WGK4=','2023-08-30 19:19:34.257831',1,'Yefren','','efrenq25@gmail.com',1,1,'2023-07-28 21:24:08.919001','');
INSERT INTO "portfolio_testimonial" ("id","image","quote","name","is_active","class_name") VALUES (1,'testimonial_images/avatar-1.png','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.','Owali Shawon',1,'anim1'),
 (2,'testimonial_images/avatar-2.png','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.','Misbah Muib',0,'anim2'),
 (3,'testimonial_images/12_3.png','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.','Tanvir Ahmed',0,'anim3'),
 (4,'testimonial_images/zahid_EyyY4Am.png','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.','Zahid Hossain',0,'anim4'),
 (5,'testimonial_images/avatar-3_fg37265.png','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.','Ruhul Amin',0,'anim5');
INSERT INTO "portfolio_blog" ("id","image","heading","description","admin_name","is_active","admin_image","date") VALUES (1,'blog_images/blog001_o0b7NZo.png','Blog Headline 1','Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt sapiente dolore.','Owali',1,'admin_images/avatar-1.png','2022-02-23 08:01:49'),
 (2,'blog_images/blog002_fVAvgtS.png','Blog Headline 1','Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt sapiente dolore.','Zahid',1,'admin_images/121231.png','2022-02-23 08:02:22'),
 (3,'blog_images/blog003_ozzMmrl.png','Blog Headline 3','Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt sapiente dolore.','Ruhul',1,'admin_images/avatar-3.png','2022-02-23 08:02:58'),
 (4,'blog_images/1.png','Blog Headline 4','Lorem ipsum dolor sit amet consectetur adipisicing elit. Sunt sapiente dolore.','Zahid',1,'admin_images/121231_JN0OuII.png','2022-02-27 08:21:11');
INSERT INTO "portfolio_contact" ("id","address","call","email","support","is_active") VALUES (1,'Ibagué, Tolima','(+57) 3165249761','abogadosqtc@gmail.com','abogadosqtc@gmail.com',1);
INSERT INTO "portfolio_usercontact" ("id","timestamp","name","email","phone","subject","message") VALUES (2,'2023-08-30 22:57:57.649881','prueba','efrenq25@gmail.com','3175146528','miercoles','probando'),
 (3,'2023-08-30 22:59:28.247767','isabella','efrenq25@gmail.com','3175146528','computador','probando computadora');
INSERT INTO "portfolio_schedule" ("id","s_time","e_time","date","day","is_active") VALUES (1,'09:00:00','10:00:00','2023-08-04','Viernes',1),
 (2,'10:00:00','11:00:00','2023-08-03','Jueves',1),
 (3,'16:00:00','17:00:00','2023-08-02','Miercoles',1);
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('dheiy8ztsc676fzf4shj17rgq4vsrqis','.eJxVjEEOwiAQRe_C2pCBtjC4dO8ZCMxMpWpoUtqV8e7apAvd_vfef6mYtrXErckSJ1ZnZdTpd8uJHlJ3wPdUb7Omua7LlPWu6IM2fZ1ZnpfD_TsoqZVv7W1A6yl7Sx57A1nEYcijhewR2Idh7MAaQ8ydM1YYScAx9IADOXTq_QHHljcb:1nMmJu:OvypJMnehC68uFzK3D-XznaQ1_FH3FU554oY5i3_QsQ','2022-03-09 07:44:18.669674'),
 ('utye4sfx1pkwrc5ho3p8o9ixjy5x5bt4','.eJxVjEEOwiAQRe_C2pCBtjC4dO8ZCMxMpWpoUtqV8e7apAvd_vfef6mYtrXErckSJ1ZnZdTpd8uJHlJ3wPdUb7Omua7LlPWu6IM2fZ1ZnpfD_TsoqZVv7W1A6yl7Sx57A1nEYcijhewR2Idh7MAaQ8ydM1YYScAx9IADOXTq_QHHljcb:1nrlXf:dnFt45BCKRv2LrXLDyIDPMt_qhNpSjT4zA_LrSZ1wkY','2022-06-02 19:10:35.402026'),
 ('sbfp0n1eji9uc5fjrwxr2awq2z7pldn2','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qPUwy:4uYlMSEz0Y0cNdfOFnLrbp0nEb0-wN-HjNmZmHQtbsY','2023-08-11 21:24:40.696817'),
 ('yh3xlx4cy5wn0hjcn1rmx6rxwc6rob8c','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qPYiF:kTDiyzPV2-x536xhvjMB0XQl5AdrbNI9MMrbv-d9mJA','2023-08-12 01:25:43.071049'),
 ('6sqby2h0zqtg1g79h0gibmgubek9xgxm','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qPiBo:5lMBl4DmR7HwP2vmVj7niMPuRaiPQdFf6SR5anIDO9c','2023-08-12 11:32:52.903503'),
 ('ajxpff48zesomvyn19s02dgdm04iw2ia','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qPs54:fIQgSXNIzD6T67enKZs1K5F6FWarRZ3pCQLOWRgjK3Q','2023-08-12 22:06:34.953618'),
 ('eqjldhjbvd6talkaylbn4pa6whu0j0o2','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qQdvS:1SeTvfUmPAX154qXurVPAkLvRGFUZQC-xctgbZb2g0U','2023-08-15 01:11:50.142546'),
 ('vf69nsud95mzg0fc4dmly3bd6xbiztcv','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qQwfA:je87OL4Y8gd7V4-UIx7bdSjaB44ias9Fp2GKK64LRwk','2023-08-15 21:12:16.397086'),
 ('4x6o8loz238ordgf0o2r8p783jplzb8g','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qRM2d:YzfqO7hozR3rshEt5BvYTDigpTRNkC6HmBeT-kcP6i8','2023-08-17 00:18:11.260775'),
 ('hlu2sv4cguuwq5wlbvsmjhf6e6v8o3rr','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qRdAU:MM3DypZxACtknJrKYRwGSz2xGGzQqG5hkaRajd8cXzY','2023-08-17 18:35:26.379517'),
 ('68xdcc60sf2esr2covb133f2yhazjga9','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qRylD:M_k4am9SXd3FYP9hiFv9Rwmps_3Bjf4orQpFQVdwONU','2023-08-18 17:38:47.964372'),
 ('qjkemytb7xouj5l3z2fwneo6nc6912bo','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qS5Dh:sdS2p5w89lJ1Ki5HkgM6naiyj57deq0q5jXacahfFuI','2023-08-19 00:32:37.631706'),
 ('mv870hksjnv3t4nmx586kla94our9k06','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qSIxV:aH3MBLcIcaoOQYRRCbbdeUne0TAs5x7Hz00JSSb5pZc','2023-08-19 15:12:49.905329'),
 ('5nx90304o2q00avj0kg4kjg04lpdqh0t','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qSe66:U2UsYYcreiuh8pcS_5kuZ92lbvDtIZaYnz3X99euGQk','2023-08-20 13:47:06.479593'),
 ('b87ovdxbc0u7g3l8d4mxgnzpi7sizcfb','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qT300:jIsxMGGL3jnJvzP0MMSKfKZUVuJ5BK6XnZlZT3tbfvQ','2023-08-21 16:22:28.189759'),
 ('nqtvzf6srt72xfwlyrg9ghk2edjd0l73','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qT5sP:9U6zgIgG3Q24HQ3Okp1V1zllgCK1ySeXjnkSKulg4hk','2023-08-21 19:26:49.625022'),
 ('ntwwhhqenu8mlbrukhev4ls0kukvsz61','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qTNhm:IHrSpIZmWbzIa3_NVFhIjvH228kVWNRE5yy2fd6r5go','2023-08-22 14:29:02.548890'),
 ('eucab04h4dmns5caq9sw7a04m9i62scy','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qTmgY:fEPc-GZWTMAwUMdC-e_hxBXo_ywQAyYD2E_cE9gu358','2023-08-23 17:09:26.242463'),
 ('m7dve6iqh4u83hf0cdfad4bnwt6f2n4z','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qU7pV:IVisJG5IrHPzPpkw0ROLVVqwWysx9DFn6OzR15Ahnts','2023-08-24 15:44:05.302315'),
 ('vqjywvunzs4zk69igconobmuih4y8b2d','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qUCig:7ES8a6xMoH0JiW6RnNNAXVha02hbosiIgrYXKT_zDAA','2023-08-24 20:57:22.070623'),
 ('sl5xbtkf6w4rv0nzwtsmr8iy08oaycr7','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qUZZk:5BTsq7fJDPVsQbUa1SYTcvz3vGUDBKrs7T7rP3oCHqg','2023-08-25 21:21:40.592695'),
 ('pzach5hnedowk0v8eipv0um41bgs5ip5','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qWHJv:xdRJHll4txTbOnNSqa53bZGtzm9MZz_X32VgEm5aLlw','2023-08-30 14:16:23.494153'),
 ('yiq887841gztg58k63yz9kcfcp8qx75n','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qWjZ2:rpSBjT7fyEl2SOmMnHKpOzMdGk35OS5od6bUzOC9mtc','2023-08-31 20:25:52.310429'),
 ('qdh0r1w4qiacs37w02nzdx8edf6q9g4e','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qX5r3:_J_1pZTZWWgQEE10cuwyYMe4pXSIxIJ8p-gDukuoXMY','2023-09-01 20:13:57.180616'),
 ('6cw3t8scxu8z54h4fhgpepkr2tcmi1xf','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qXNOB:pBzEdobuDZf_R9VCQgjDMd5nyULY8adv-Mchr1SuB8E','2023-09-02 14:57:19.904730'),
 ('nlrj3jgo2khj9lw7vgldgxx64zgev4zt','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qXT76:OKS1QGUufEmqP1AD9Sn8aDrcuaefTwIbYtmyo5n7h20','2023-09-02 21:04:04.063553'),
 ('mzxfvi2bh2kjzvb100a3t24fv2l8of9t','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qY7GP:3AR-c0QhqOXIXbPBY5nfryPZr5lS54Ffiww-ND01vhE','2023-09-04 15:56:21.301101'),
 ('akwd3wpsuxcwampqgok4ei6imb2k0bl5','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qYWkS:bCsFGhUjthd6OyWd1jcF4IvQh4xRxAuRR0gy-hYYHz0','2023-09-05 19:09:04.996615'),
 ('ga6tflsk2gifj9749bpsutb3k5vbrb8s','.eJxVjEsOwiAUAO_C2hC-BVy67xnI4z2QqqFJaVfGuxuSLnQ7M5k3i3DsNR49b3EhdmWKXX5ZAnzmNgQ9oN1XjmvbtyXxkfDTdj6vlF-3s_0bVOh1bI0SMgdC7W0IiB4SGYcFQJRsC0xeBykVGmHJCykdZiGLoYmsLk5o9vkC6C83yA:1qbQj0:Mb-7peA3LC53Op_S1VFQ_mZD2ugo_7IZWq1VC36C43Y','2023-09-13 19:19:34.454471');
INSERT INTO "portfolio_statistic" ("id","is_active","field_four","field_one","field_three","number_four","number_one","number_three","number_two","field_two") VALUES (1,1,'Premios','Total Casos','Exitosos',10,500,300,100,'Casos Activos');
INSERT INTO "portfolio_userprofile" ("id","tag_line","btn_txt","image","image_caption","is_active","name") VALUES (1,'Somos una de las mejores firmas de Abogados a nivel nacional, donde lo primordial es la solución de las necesidades de los clientes.','Reserva tu Cita','profile_images/lawyersz.png','Luchemos por la Justicia',1,'BIENVENIDOS');
INSERT INTO "portfolio_quienes_somo" ("id","image","titulo","is_active","parrafo1","parrafo2","parrafo3") VALUES (1,'quienes_images/abogados.jpg','Quienes Somos',1,'Somos una de las mejores firmas de Abogados a nivel nacional, donde lo primordial es la solución de las necesidades de los clientes.','Nuestro prestigio es el resultado de años de experiencia en el sector privado y público de los integrantes de la firma, con más de 20 años al servicio del derecho y como consecuencia de ello, la sociedad tiene ventajas competitivas que nos permiten sobresalir, entre las que cabe resaltar, la calificada experiencia de sus fundadores, la orientación al éxito en cada caso, el compromiso ético y deontológico, la asesoría multidisciplinaria y la red nacional de servicios.','Para resolver a los requerimientos de nuestros clientes contamos con centros de operación en Ibagué, Neiva y Bogotá, e igualmente con alianzas estratégicas a lo largo del territorio nacional, lo que nos hace líderes en nuestras áreas de práctica.');
INSERT INTO "portfolio_mision" ("id","image","titulo","parrafo1","is_active") VALUES (1,'quienes_images/corte-martillo-libros-juicio-concepto-ley.jpg','MISIÓN','QUINTERO TORRES CORREA ABOGADOS SAS, es una Firma de Abogados que, con un enfoque multidisciplinario, representa y brinda soluciones jurídicas reales, así como a entidades públicas y privadas, en un marco de políticas de calidad, excelencia y responsabilidad con sus clientes.  Con una representación personalizada, con las capacidades y experiencia de sus abogados expertos.',1);
INSERT INTO "portfolio_vision" ("id","image","titulo","parrafo1","is_active") VALUES (1,'quienes_images/hombre-negocios-gran-oficina.jpg','VISIÓN','En el 2030 la firma QUINTERO TORRES CORREA  ABOGADOS  SAS, liderar el ligio a nivel nacional, en las diferentes ramas del derecho colombiano. Siendo una de las mejores firmas de abogados en resolver las necesidades de sus clientes.',1);
INSERT INTO "portfolio_principios" ("id","image","titulo","parrafo1","parrafo2","parrafo3","parrafo4","parrafo5","is_active") VALUES (1,'quienes_images/image-04.jpg','PRINCIPIOS','Compromiso','Ética','Respeto','Secreto profesional','Formación continua',1);
INSERT INTO "portfolio_valores" ("id","image","titulo","parrafo1","parrafo2","parrafo3","parrafo4","parrafo5","parrafo6","parrafo7","is_active") VALUES (1,'quienes_images/image-03.jpg','VALORES CORPORATIVOS','Honestidad','Transparencia','Confianza','Responsabilidad','Excelencia','Compromiso hacia los resultados','Justicia',1);
INSERT INTO "portfolio_equipo" ("id","image","persona","descripcion","is_active","descripcion2","descripcion3","descripcion4","descripcion5","descripcion6","descripcion7","descripcion8") VALUES (1,'equipo_images/perfil2_1jor7it.jpeg','Dr. CESAR AUGUSTO CORREA RAYO','Representante legal',1,'Abogado','Conciliador en derecho','Experto en Derecho Penal','Experto en Derecho Disciplinario',NULL,NULL,NULL),
 (2,'equipo_images/perfil2.jpeg','Dr. JHON ALEXANDER TORRES ALVAREZ','Abogado',1,'Especialista en Derecho Constitucional y Administrativo','Candidato a Magister en Derechos Humanos y Derecho Internacional Humanitario de la Universidad Católica de Colombia.','20 años de experiencia en la función pública','Asesor de la Superintendencia de Vigilancia en procesos disciplinarios','Asesor en procesos contractuales y de responsabilidad fiscal',NULL,NULL),
 (3,'equipo_images/perfil2_rV3UJnf.jpeg','Dr. NUMAEL QUINTERO OROZCO','Abogado',1,'Especialista Contratación Estatal U. de la Sabana','Experto en derecho Administrativo y de lo Contencioso','Conciliador en Derecho','Litigante','Consultor en Contratación Publica','Consultor SECOPII (Colombia Compra Eficiente)','Con una experiencia de más de 20 años en el sector publico');
INSERT INTO "portfolio_areas" ("id","area","definicion","class_name","is_active","image","descripcion","image_principal") VALUES (1,'DERECHO ADMINISTRATIVO Y DE LO CONTENCIOSO','La complejidad de los asuntos y la tecnicidad de la materia, hace necesario en la práctica contar con un abogado especialista en contencioso-administrativo que conozca a la perfección la normativa procesal administrativa.','icon-box-clr-1',1,'areas_images/area1.png','Consiste en informar, gestionar y reclamar cualquier problemática que pueda surgir entre los ciudadanos y la Administración Pública.','areas_images/bodegon-balanza-justicia_2.jpg'),
 (2,'DERECHO PENAL','Nosotros como abogados penalistas asesoráramos y defenderemos a aquellos clientes que se vean inmersos en un proceso penal, desarrollando su labor ante los juzgados y tribunales de la jurisdicción penal actuando conforme a las normas y reglas que se contemplan en la Ley de Enjuiciamiento Criminal.','icon-box-clr-1',1,'areas_images/area2.png','Se ocupa de definir qué conductas o comportamientos son constitutivos de delito, cómo se enjuiciarán estas causas ante un juzgado o tribunal.','areas_images/martillo-libros-sobre-escritorio-madera-antiguo.jpg'),
 (3,'DERECHO CIVIL','Lo primero es identificar el área y motivo de la demanda, para poderte ayudar y acompañarte en todo el proceso, buscando siempre la mejor solución para tu caso. Si deseas contratar los servicios de un abogado civil puedes ponerte en contacto con nosotros. Estaremos encantados de llevar tu caso.','icon-box-clr-1',1,'areas_images/hombre-haciendo-su-proximo-movimiento_1.jpg','Un abogado civilista es el encargado del derecho de las personas, obligaciones y contratos, derechos reales y derecho de familias y sucesiones.','areas_images/jueces-mazo-sobre-libro-mesa-madera-antecedentes-concepto-derecho-justicia.jpg'),
 (4,'DERECHO COMERCIAL','Enfocados en prestar la mejor asesoría y representación en los casos jurídicos mercantiles. Nuestros abogados en derecho comercial ofrecen soluciones y previenen eficazmente a nuestros clientes en todo lo relacionado con su empresa o negocio.','icon-box-clr-1',1,'areas_images/area4.png','Somos una firma de abogados en derecho comercial dedicados exclusivamente al área del derecho comercial en Colombia.','areas_images/verificacion-terminos-contrato.jpg'),
 (5,'DERECHO CONTRACTUAL PUBLICO Y PRIVADO','Nuestros abogados prestan atención al consentimiento o voluntad del contrato, es decir, a la libre disposición de ambas partes para aceptar las condiciones del acuerdo. Y además nuestros profesionales están especializados en los factores externos que modifican la intención de alguna de las partes.','icon-box-clr-1',1,'areas_images/area5.png','Acto jurídico presentes en un contrato, tenemos una amplia experiencia en los distintos tipos de acuerdos que se firman con mayor frecuencia.','areas_images/manos-alto-angulo-firmando-documentos.jpg'),
 (6,'DERECHO DISCIPLINARIO','Los servidores tienen derecho a la defensa, por lo que requieren el respaldo de nuestro servicio, una firma especializada en profesionales en todas las ramas del derecho que busca aportar las diferentes capacidades técnicas y jurídicas como firma, en la atención de nuestros clientes.','icon-box-clr-1',1,'areas_images/area6.png','Compete a los servidores públicos, implica un conjunto de normas y principios, además sanciones si hay faltas en el cumplimiento de sus funciones.','areas_images/captura-pantalla-persona-que-escribe-libro-mazo-sobre-mesa_1.jpg'),
 (7,'DERECHO TRIBUTARIO','Contamos con experiencia en Derecho Tributario, ofrecemos asesoría personalizada a la necesidad de cada cliente, estructurando un modelo de planeación tributaria, que permita impactar los ingresos y utilidades de nuestros clientes, buscando maximizar sus recursos y minimizar el pago de impuestos.','icon-box-clr-1',1,'areas_images/img1.png','Somos abogados especialistas en la asesoría y acompañamiento de asuntos tributarios, fiscales y cambiarios.','areas_images/primer-plano-agente-bienes-raices-que-usa-calculadora-mientras-su-cliente-f_M6HAs4n.jpg'),
 (8,'PROPIEDAD INTELECTUAL Y DERECHO DEL ENTRETENIMIENTO','También se incluye el asesoramiento en temas de licencias de propiedad intelectual, derechos de autor, espectáculos y entretenimientos, protección de software, dominios de Internet y otros servicios de multimedia y de nuevas tecnologías.','icon-box-clr-1',1,'areas_images/licencia-identidad-marca-patentada-concepto-derechos-autor-producto.jpg','Prestamos un servicio integral en temas de registro, protección comercial de marcas, patentes, modelos de utilidad, transferencia de tecnología.','areas_images/licencia-identidad-marca-patentada-concepto-derechos-autor-producto_KUFXFhk.jpg');
INSERT INTO "portfolio_politica" ("id","name","subject","message","is_active") VALUES (1,'Articulo 1','probar','probando',1);
INSERT INTO "portfolio_mensaje" ("id","image","heading_one","description_one","heading_two","description_two","number","check_point_one","check_point_two","check_point_three","btn_text","is_active") VALUES (1,'appointment_images/justice_RiveqKS_ytE1V9o.png','¡Asesórate y contáctanos!','Llámanos','SOMOS LA MEJOR OPCIÓN PARA SU CASO','A la hora de enfrentar un proceso judicial, siempre pensando en su bienestar jurídico, para nosotros sera el principal objetivo.',573165249761,'Conocimiento de la Ley.','Pasión y entusiasmo.','Capacidad de investigación, análisis y juicio.','Obtener Cita',1);
INSERT INTO "portfolio_razones" ("id","heading","description","class_name","class_name_icon","is_active") VALUES (1,'Formación humana','Cotamos con personal de calidad humana y total disposición para servirle a usted y los suyos, nuestra gestión se desarrolla a partir de un profundo sentido de la ética no solo jurídica, sino humana y social.','icon-box-clr-1','static/images/icon-1.png',1),
 (2,'Trabajo en equipo','Consolidada nuestra alianza formamos un equipo, acompañamos grandes y pequeñas empresas, poniendo a su disposición nuestro conocimiento y experiencia, ¡trabajamos en equipo por una misma causa!.','icon-box-clr-1','static/images/icon-2.png',1),
 (3,'Buena Comunicación','Somos abogados empáticos capaz de comprender y acompañar a su cliente en la difícil situación que atraviesa. La atención y la presencia son fundamentales para una comunicación asertiva.','icon-box-clr-1','static/images/icon-3.png',1),
 (4,'Somos Responsables','Porque actuamos con responsabilidad y nuestro compromiso será tratar tu caso como si fuera único y le daremos la atención e importancia que se merece, siempre te daremos absoluta tranquilidad y confianza.','icon-box-clr-1','static/images/icon-4.png',1);
INSERT INTO "portfolio_usercita" ("id","timestamp","name","email","phone","fecha_cita","time","message") VALUES (1,'2023-08-31 16:12:19.602106','Oscar','efrenq25@gmail.com','98765431','2023-09-02 00:00:00','2-3','okokosakdokas');
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
COMMIT;
