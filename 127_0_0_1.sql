-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- 생성 시간: 17-06-05 09:09
-- 서버 버전: 10.1.21-MariaDB
-- PHP 버전: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `kwbook`
--
CREATE DATABASE IF NOT EXISTS `kwbook` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `kwbook`;

-- --------------------------------------------------------

--
-- 테이블 구조 `book`
--

CREATE TABLE `book` (
  `book_id` int(5) NOT NULL,
  `title` varchar(90) NOT NULL,
  `author` varchar(90) NOT NULL,
  `publisher` varchar(90) NOT NULL,
  `cost` int(10) NOT NULL,
  `image` varchar(10) DEFAULT NULL,
  `stock` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `book`
--

INSERT INTO `book` (`book_id`, `title`, `author`, `publisher`, `cost`, `image`, `stock`) VALUES
(1, 'Design Pattern', 'Erich Gamma, Richard Helm', 'developer', 35, 'design', 0),
(2, 'Introduction to 3d Game Programming With Directx 11 ', 'Rogers, Thomas K', ' Createspace Independent Pub', 30, 'dragon', 0),
(4, 'Effective C++', 'Scott, Mayers', 'ProtecMedia', 35, 'effective', 4),
(6, 'cd', 'cd', 'cd', 111, 'dragon', 12);

-- --------------------------------------------------------

--
-- 테이블 구조 `cartlist`
--

CREATE TABLE `cartlist` (
  `cart_id` int(10) NOT NULL,
  `userID` varchar(30) NOT NULL,
  `bookID` int(10) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `cartlist`
--

INSERT INTO `cartlist` (`cart_id`, `userID`, `bookID`, `date`) VALUES
(6, 'null', 1, '2017-06-04 13:22:41'),
(7, 'null', 1, '2017-06-04 13:23:02'),
(10, 'nmkl11', 2, '2017-06-04 15:56:50'),
(12, 'nmkl11', 1, '2017-06-04 15:56:57'),
(15, 'qnpfrehdtks', 1, '2017-06-05 16:01:17');

-- --------------------------------------------------------

--
-- 테이블 구조 `orderlist`
--

CREATE TABLE `orderlist` (
  `orderID` int(10) NOT NULL,
  `userID` varchar(30) NOT NULL,
  `bookID` int(10) NOT NULL,
  `buy_Date` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `orderlist`
--

INSERT INTO `orderlist` (`orderID`, `userID`, `bookID`, `buy_Date`) VALUES
(18, 'nmkl11', 1, '2017-06-04 15:44:57.094309'),
(19, 'nmkl11', 4, '2017-06-05 15:57:06.650139'),
(20, 'qnpfrehdtks', 2, '2017-06-05 13:18:16.224771'),
(21, 'qnpfrehdtks', 6, '2017-06-05 16:01:07.955139');

-- --------------------------------------------------------

--
-- 테이블 구조 `user`
--

CREATE TABLE `user` (
  `ID` varchar(30) NOT NULL,
  `Password` varchar(12) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Address` varchar(90) NOT NULL,
  `PNumber` int(80) NOT NULL,
  `Money` int(10) DEFAULT '0',
  `Grade` varchar(30) NOT NULL DEFAULT 'normal',
  `Mileage` int(10) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `user`
--

INSERT INTO `user` (`ID`, `Password`, `Name`, `Address`, `PNumber`, `Money`, `Grade`, `Mileage`) VALUES
('fdsfds', '4324324', 'dsads', 'dsadsa', 54353, NULL, 'normal', 0),
('min', '0909qq', 'park', 'Daejeon', 1037372727, NULL, 'normal', 0),
('nmkl11', '1234', 'Park', 'korea', 1036359611, -375, 'manager', 24),
('qnpfrehdtks', '0909qq', 'PArk', 'ee', 10, 111000, 'normal', 122);

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`);

--
-- 테이블의 인덱스 `cartlist`
--
ALTER TABLE `cartlist`
  ADD PRIMARY KEY (`cart_id`);

--
-- 테이블의 인덱스 `orderlist`
--
ALTER TABLE `orderlist`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `bookID` (`bookID`);

--
-- 테이블의 인덱스 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 테이블의 AUTO_INCREMENT `cartlist`
--
ALTER TABLE `cartlist`
  MODIFY `cart_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- 테이블의 AUTO_INCREMENT `orderlist`
--
ALTER TABLE `orderlist`
  MODIFY `orderID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `orderlist`
--
ALTER TABLE `orderlist`
  ADD CONSTRAINT `bookID` FOREIGN KEY (`bookID`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- 데이터베이스: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- 테이블의 덤프 데이터 `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- 테이블의 덤프 데이터 `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'table', 'haha', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"allrows\":\"1\",\"output_format\":\"sendit\",\"filename_template\":\"@TABLE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"json_structure_or_data\":\"data\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"@TABLE@ 테이블 구조\",\"latex_structure_continued_caption\":\"@TABLE@ 테이블 구조 (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"excel_columns\":null,\"htmlword_columns\":null,\"json_pretty_print\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_use_transaction\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(2, 'root', 'database', 'unityrpg1', '{\"quick_or_custom\":\"quick\",\"what\":\"csv\",\"structure_or_data_forced\":\"1\",\"table_select[]\":[\"accounts\",\"charinfo\",\"itemdata\",\"owneditemdata\"],\"output_format\":\"sendit\",\"filename_template\":\"@DATABASE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"json_structure_or_data\":\"data\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"@TABLE@ 테이블 구조\",\"latex_structure_continued_caption\":\"@TABLE@ 테이블 구조 (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"structure_and_data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"structure_and_data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_procedure_function\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"excel_columns\":null,\"htmlword_columns\":null,\"json_pretty_print\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_use_transaction\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_create_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- 테이블의 덤프 데이터 `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"kwbook\",\"table\":\"user\"},{\"db\":\"kwbook\",\"table\":\"orderlist\"},{\"db\":\"kwbook\",\"table\":\"book\"},{\"db\":\"kwbook\",\"table\":\"cartlist\"},{\"db\":\"kwbook\",\"table\":\"cartList\"},{\"db\":\"kwbook\",\"table\":\"orderList\"},{\"db\":\"KWBook\",\"table\":\"Book\"},{\"db\":\"university\",\"table\":\"student\"},{\"db\":\"university\",\"table\":\"grade_report\"},{\"db\":\"university\",\"table\":\"course\"}]');

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- 테이블의 덤프 데이터 `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'kwbook', 'user', '{\"sorted_col\":\"`Mileage`  ASC\"}', '2017-06-05 07:00:59'),
('root', 'university', 'section', '{\"sorted_col\":\"`Course_number` ASC\"}', '2017-05-07 20:58:59');

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- 테이블의 덤프 데이터 `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2017-02-02 10:09:21', '{\"lang\":\"ko\",\"collation_connection\":\"utf8mb4_unicode_ci\"}');

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- 테이블 구조 `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- 테이블의 인덱스 `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- 테이블의 인덱스 `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- 테이블의 인덱스 `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- 테이블의 인덱스 `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- 테이블의 인덱스 `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- 테이블의 인덱스 `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- 테이블의 인덱스 `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- 테이블의 인덱스 `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- 테이블의 인덱스 `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- 테이블의 인덱스 `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- 테이블의 인덱스 `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- 테이블의 인덱스 `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- 테이블의 인덱스 `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- 테이블의 인덱스 `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- 테이블의 인덱스 `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- 테이블의 인덱스 `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- 테이블의 인덱스 `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 테이블의 AUTO_INCREMENT `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 테이블의 AUTO_INCREMENT `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 테이블의 AUTO_INCREMENT `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 테이블의 AUTO_INCREMENT `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 테이블의 AUTO_INCREMENT `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;--
-- 데이터베이스: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- 데이터베이스: `unityrpg1`
--
CREATE DATABASE IF NOT EXISTS `unityrpg1` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `unityrpg1`;

-- --------------------------------------------------------

--
-- 테이블 구조 `accounts`
--

CREATE TABLE `accounts` (
  `userid` int(10) NOT NULL,
  `id` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `accounts`
--

INSERT INTO `accounts` (`userid`, `id`, `password`) VALUES
(22, 'nmkl11', '0909qq'),
(33, 'Test111', '0909qq');

-- --------------------------------------------------------

--
-- 테이블 구조 `charinfo`
--

CREATE TABLE `charinfo` (
  `charID` int(10) NOT NULL,
  `job` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `StartX` int(10) NOT NULL,
  `StartY` int(10) NOT NULL,
  `userid` int(10) NOT NULL,
  `level` int(10) DEFAULT NULL,
  `exp` int(10) DEFAULT NULL,
  `clearDungeon` int(3) DEFAULT '5',
  `gold` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `charinfo`
--

INSERT INTO `charinfo` (`charID`, `job`, `name`, `StartX`, `StartY`, `userid`, `level`, `exp`, `clearDungeon`, `gold`) VALUES
(1012, 2, 'nmkl11', 0, 0, 22, 39, 5608, 6, 100128),
(1023, 2, 'Test111', 0, 0, 33, 1, 0, 0, 81800);

-- --------------------------------------------------------

--
-- 테이블 구조 `itemdata`
--

CREATE TABLE `itemdata` (
  `id` int(10) NOT NULL,
  `name` varchar(25) NOT NULL,
  `type` int(8) NOT NULL,
  `grade` int(8) NOT NULL,
  `level` int(8) DEFAULT NULL,
  `passiveSkill` varchar(20) DEFAULT NULL,
  `price` int(8) DEFAULT '0',
  `minAttack` int(5) DEFAULT NULL,
  `criPro` int(5) DEFAULT NULL,
  `criRate` int(5) DEFAULT NULL,
  `armorPt` int(5) DEFAULT NULL,
  `mana` int(5) DEFAULT NULL,
  `health` int(5) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `iconName` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `itemdata`
--

INSERT INTO `itemdata` (`id`, `name`, `type`, `grade`, `level`, `passiveSkill`, `price`, `minAttack`, `criPro`, `criRate`, `armorPt`, `mana`, `health`, `info`, `iconName`) VALUES
(2000, 'Broken Wooden Sword', 0, 1, 1, '0', 500, 10, 0, 0, 0, 0, 0, NULL, 'Sword00'),
(2001, 'Wooden Sword', 0, 1, 4, '0', 800, 17, 0, 0, 0, 0, 0, NULL, 'Sword00'),
(2002, 'Iron Sword', 0, 1, 5, '0', 1200, 25, 5, 5, 0, 0, 0, 'Critical Chance + 5%\r\nCritical DMG + 5%', 'Sword02'),
(2003, 'Huge Orge Dagger', 0, 2, 15, '0', 2000, 34, 10, 10, 0, 0, 300, 'HP + 300\r\nCritical Chance + 10%\r\nCritical DMG+ 10%', 'Sword01'),
(2004, 'Divine Kingdom', 0, 3, 15, '1', 5000, 55, 20, 0, 0, 0, 0, 'DMG + 10%\r\nCritical Chance +20%', 'Sword03'),
(2005, 'Burning Blade', 0, 3, 17, '2', 5000, 55, 0, 20, 0, 0, 700, 'Fire DMG+ 100\r\nCritical DMG + 20%', 'Sword04'),
(2006, 'Wooden Armor', 1, 1, 1, '0', 300, 0, 0, 0, 20, 0, 0, NULL, 'Armor00'),
(2007, 'Chain Armor', 1, 1, 5, '0', 600, 0, 0, 0, 30, 0, 0, NULL, 'Armor01'),
(2008, 'Iron Armor', 1, 1, 5, '0', 800, 0, 0, 0, 38, 0, 300, 'HP + 300', 'Armor02'),
(2009, 'Huge Orge Plate', 1, 2, 11, '0', 2000, 0, 0, 0, 55, 300, 1000, 'HP + 1000\r\nMP + 300', 'Armor03'),
(2010, 'Divine Glory', 1, 3, 22, '0', 0, 0, 10, 0, 70, 0, 1500, 'HP + 1500\r\nCritical Chance + 10%', 'Armor04'),
(2011, 'Wooden helmet', 2, 1, 1, '0', 200, 0, 0, 0, 6, 0, 0, NULL, 'helmet00'),
(2012, 'Chain Helmet', 2, 1, 5, '0', 450, 0, 0, 0, 15, 50, 0, 'MP + 50', 'helmet01'),
(2013, 'Iron helmet', 2, 1, 7, '0', 600, 0, 0, 0, 22, 100, 0, 'MP + 100', 'helmet02'),
(2014, 'Unholy helemt', 2, 2, 8, '0', 2000, 0, 0, 10, 30, -50, 300, 'HP + 300\r\nMP - 50\r\nCritical DMG + 10%', 'helmet03'),
(2015, 'Divine Wisdom', 2, 3, 22, '0', 4000, 0, 10, 10, 60, 500, 0, 'MP + 500\r\nCritical DMG + 10%\r\nCritical Chance + 10%', 'helmet04'),
(2016, 'Wooden shoes', 3, 1, 1, '0', 200, 0, 0, 0, 5, 0, 30, 'HP + 30', 'Shoes00'),
(2017, 'Old Iron Boots', 3, 1, 5, '0', 500, 0, 0, 0, 10, NULL, 50, 'HP + 50', 'Shoes01'),
(2018, 'Iron Boots', 3, 1, 6, '0', 500, 0, 0, 0, 15, 0, 70, 'HP + 70', 'Shoes01'),
(2019, 'Berserker\'s Greaves', 3, 2, 11, '0', 0, 15, 0, 0, 25, 0, 200, 'HP + 200 \r\nAttack + 15', 'Shoes02'),
(2020, 'Divine Pride', 3, 3, 22, '0', 2000, 35, 0, 0, 25, 100, 400, 'HP + 400\r\nMP + 100\r\nAttack + 35', 'Shoes03');

-- --------------------------------------------------------

--
-- 테이블 구조 `jobinfo`
--

CREATE TABLE `jobinfo` (
  `jobid` int(5) NOT NULL,
  `name` varchar(15) DEFAULT NULL,
  `Hp` int(8) DEFAULT '0',
  `Mp` int(8) DEFAULT '0',
  `addHp` int(5) DEFAULT NULL,
  `addMp` int(5) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `skill1` int(5) DEFAULT NULL,
  `skill2` int(5) DEFAULT NULL,
  `skill3` int(5) DEFAULT NULL,
  `skill4` int(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `jobinfo`
--

INSERT INTO `jobinfo` (`jobid`, `name`, `Hp`, `Mp`, `addHp`, `addMp`, `info`, `skill1`, `skill2`, `skill3`, `skill4`) VALUES
(1, 'Warrior', 200, 100, 50, 22, '\'Warrior\' is class that overwhelms enemies with strong stamina. The weapon uses a sword.', 1501, 1502, 1503, 1504),
(2, 'Mage', 150, 200, 36, 40, '\'Mage\' is a job to suppress enemies with elemental spells. The weapon uses a cane.', 2001, 2002, 2003, 2004);

-- --------------------------------------------------------

--
-- 테이블 구조 `monster`
--

CREATE TABLE `monster` (
  `id` int(11) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `hp` int(8) NOT NULL,
  `attack` int(5) NOT NULL,
  `defend` int(5) DEFAULT NULL,
  `type` int(2) NOT NULL,
  `Grade` int(2) NOT NULL DEFAULT '0',
  `movePt` int(5) DEFAULT NULL,
  `detectRange` float DEFAULT NULL,
  `attackRange` float DEFAULT NULL,
  `exp` int(8) DEFAULT NULL,
  `level` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `monster`
--

INSERT INTO `monster` (`id`, `name`, `hp`, `attack`, `defend`, `type`, `Grade`, `movePt`, `detectRange`, `attackRange`, `exp`, `level`) VALUES
(1, 'skeleton', 60, 10, 20, 0, 0, 6, 13, 2, 10, 1),
(2, 'blood skeleton', 90, 25, 10, 0, 0, 6, 13, 2, 19, 2),
(3, 'skeleton Axeman', 150, 30, 10, 1, 1, 6, 13, 2, 30, 3),
(4, 'skeleton Gardian', 240, 35, 20, 0, 1, 6, 13, 2, 52, 4),
(5, 'skeleton Lich', 4000, 48, 30, 3, 2, 6, 18, 3, 200, 6),
(6, 'blood skeleton Warlord', 900, 50, 40, 0, 2, 5, 15, 4, 250, 7),
(7, 'blood skeleton Commander', 1800, 55, 50, 0, 3, 6, 13, 2, 280, 8),
(8, 'skeleton King \'Leoric\'', 4000, 150, 80, 2, 3, 6, 18, 4, 400, 10);

-- --------------------------------------------------------

--
-- 테이블 구조 `owneditemdata`
--

CREATE TABLE `owneditemdata` (
  `guid` int(10) NOT NULL,
  `isEquiped` int(2) DEFAULT NULL,
  `id` int(10) NOT NULL,
  `userid` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `owneditemdata`
--

INSERT INTO `owneditemdata` (`guid`, `isEquiped`, `id`, `userid`) VALUES
(5042, 1, 2020, 22),
(5043, 0, 2018, 22),
(5044, 0, 2014, 22),
(5045, 0, 2015, 22),
(5046, 0, 2000, 22),
(5047, 0, 2001, 22),
(5048, 1, 2015, 22),
(5049, 1, 2004, 22),
(5050, 1, 2010, 22),
(5062, 0, 2005, 33),
(5063, 0, 2010, 33),
(5064, 0, 2020, 33),
(5065, 0, 2015, 33),
(5066, 1, 2000, 33),
(5067, 1, 2006, 33),
(5068, 1, 2016, 33),
(5069, 1, 2011, 33),
(5070, 0, 2014, 33),
(5071, 0, 2009, 33),
(5072, 0, 2003, 33),
(5073, 0, 2019, 33),
(5074, 0, 2019, 33),
(5075, 0, 2001, 22);

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`userid`);

--
-- 테이블의 인덱스 `charinfo`
--
ALTER TABLE `charinfo`
  ADD PRIMARY KEY (`charID`),
  ADD UNIQUE KEY `name` (`name`);

--
-- 테이블의 인덱스 `itemdata`
--
ALTER TABLE `itemdata`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `jobinfo`
--
ALTER TABLE `jobinfo`
  ADD PRIMARY KEY (`jobid`);

--
-- 테이블의 인덱스 `monster`
--
ALTER TABLE `monster`
  ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `owneditemdata`
--
ALTER TABLE `owneditemdata`
  ADD PRIMARY KEY (`guid`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `accounts`
--
ALTER TABLE `accounts`
  MODIFY `userid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- 테이블의 AUTO_INCREMENT `charinfo`
--
ALTER TABLE `charinfo`
  MODIFY `charID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1024;
--
-- 테이블의 AUTO_INCREMENT `itemdata`
--
ALTER TABLE `itemdata`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2021;
--
-- 테이블의 AUTO_INCREMENT `jobinfo`
--
ALTER TABLE `jobinfo`
  MODIFY `jobid` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 테이블의 AUTO_INCREMENT `monster`
--
ALTER TABLE `monster`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 테이블의 AUTO_INCREMENT `owneditemdata`
--
ALTER TABLE `owneditemdata`
  MODIFY `guid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5076;--
-- 데이터베이스: `university`
--
CREATE DATABASE IF NOT EXISTS `university` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `university`;

-- --------------------------------------------------------

--
-- 테이블 구조 `course`
--

CREATE TABLE `course` (
  `Course_name` varchar(30) NOT NULL,
  `Course_number` varchar(10) NOT NULL,
  `Credit_hours` int(11) NOT NULL,
  `Department` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `course`
--

INSERT INTO `course` (`Course_name`, `Course_number`, `Credit_hours`, `Department`) VALUES
('Intro to Computer Science', 'CS1310', 4, 'CS'),
('Data Structures', 'CS3320', 4, 'CS'),
('Database', 'CS3380', 3, 'CS'),
('Discrete Mathematics', 'MATH2410', 3, 'MATH');

-- --------------------------------------------------------

--
-- 테이블 구조 `grade_report`
--

CREATE TABLE `grade_report` (
  `Student_number` int(10) NOT NULL,
  `Section_identifier` int(10) DEFAULT NULL,
  `Grade` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `grade_report`
--

INSERT INTO `grade_report` (`Student_number`, `Section_identifier`, `Grade`) VALUES
(8, 85, 'A'),
(8, 92, 'A'),
(8, 102, 'B'),
(8, 135, 'B'),
(17, 112, 'B'),
(17, 119, 'B'),
(17, 85, 'B'),
(17, 92, 'B');

-- --------------------------------------------------------

--
-- 테이블 구조 `prerequite`
--

CREATE TABLE `prerequite` (
  `Course_number` varchar(10) NOT NULL,
  `Prerequisite_number` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `prerequite`
--

INSERT INTO `prerequite` (`Course_number`, `Prerequisite_number`) VALUES
('CS3380', 'CS3320'),
('CS3380', 'MATH2410'),
('CS3320', 'CS1310');

-- --------------------------------------------------------

--
-- 테이블 구조 `section`
--

CREATE TABLE `section` (
  `Section_identifier` int(10) NOT NULL,
  `Course_number` varchar(10) NOT NULL,
  `Semester` varchar(20) NOT NULL,
  `Year` int(11) NOT NULL,
  `Instructor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `section`
--

INSERT INTO `section` (`Section_identifier`, `Course_number`, `Semester`, `Year`, `Instructor`) VALUES
(85, 'MATH2410', 'Fall', 7, 'King'),
(92, 'CS1310', 'Fall', 7, 'Anderson'),
(102, 'CS3320', 'Spring', 8, 'Knuth'),
(112, 'MATH2410', 'Fall', 8, 'Chang'),
(119, 'CS1310', 'Fall', 8, 'Anderson'),
(135, 'CS3380', 'Fall', 8, 'Stone');

-- --------------------------------------------------------

--
-- 테이블 구조 `student`
--

CREATE TABLE `student` (
  `Name` varchar(20) NOT NULL,
  `Student_number` int(11) NOT NULL,
  `Class` int(11) NOT NULL,
  `Major` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `student`
--

INSERT INTO `student` (`Name`, `Student_number`, `Class`, `Major`) VALUES
('Brown', 8, 2, 'CS'),
('Smith', 17, 1, 'CS'),
('Smith', 23, 13, 'cs');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Course_number`);

--
-- 테이블의 인덱스 `grade_report`
--
ALTER TABLE `grade_report`
  ADD KEY `Student_Grade` (`Student_number`),
  ADD KEY `Section_Grade` (`Section_identifier`);

--
-- 테이블의 인덱스 `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`Section_identifier`),
  ADD KEY `Section_Course` (`Course_number`);

--
-- 테이블의 인덱스 `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Student_number`),
  ADD KEY `Stu_Grade` (`Student_number`) USING BTREE;

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `grade_report`
--
ALTER TABLE `grade_report`
  ADD CONSTRAINT `Section_Grade` FOREIGN KEY (`Section_identifier`) REFERENCES `section` (`Section_identifier`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Student_Grade` FOREIGN KEY (`Student_number`) REFERENCES `student` (`Student_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 테이블의 제약사항 `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `Section_Course` FOREIGN KEY (`Course_number`) REFERENCES `course` (`Course_number`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- 데이터베이스: `usvote`
--
CREATE DATABASE IF NOT EXISTS `usvote` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `usvote`;

-- --------------------------------------------------------

--
-- 테이블 구조 `bill`
--

CREATE TABLE `bill` (
  `Bill_name` varchar(10) NOT NULL,
  `Date_of_vote` date NOT NULL,
  `Passed_or_failed` varchar(5) NOT NULL,
  `Sponsor` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `bill`
--

INSERT INTO `bill` (`Bill_name`, `Date_of_vote`, `Passed_or_failed`, `Sponsor`) VALUES
('Bad', '2017-05-01', 'YES', 'Obama'),
('Candy', '2017-05-09', 'NO', 'Bush'),
('Good', '2017-03-14', 'YES', 'Trump'),
('KW', '2016-08-17', 'YES', 'Kennedy'),
('NAM', '2017-05-08', 'NO', 'Obama');

-- --------------------------------------------------------

--
-- 테이블 구조 `congressperson`
--

CREATE TABLE `congressperson` (
  `Name` varchar(20) NOT NULL,
  `District` varchar(30) NOT NULL,
  `Start_Data` date NOT NULL,
  `Party` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `congressperson`
--

INSERT INTO `congressperson` (`Name`, `District`, `Start_Data`, `Party`) VALUES
('Bush', 'California', '2016-06-15', 'Other'),
('Kennedy', 'New York', '2015-08-12', 'Democrat'),
('Obama', 'Texas', '2017-04-11', 'Independent'),
('Trump', 'Florida', '2017-01-13', 'Republican');

-- --------------------------------------------------------

--
-- 테이블 구조 `state`
--

CREATE TABLE `state` (
  `State_Name` varchar(30) NOT NULL,
  `Region` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `state`
--

INSERT INTO `state` (`State_Name`, `Region`) VALUES
('California', 'West'),
('Florida', 'Southeast'),
('New York', 'Northeast'),
('Texas', 'South');

-- --------------------------------------------------------

--
-- 테이블 구조 `vote`
--

CREATE TABLE `vote` (
  `Name` varchar(20) NOT NULL,
  `Bill_name` varchar(10) NOT NULL,
  `Vote` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 테이블의 덤프 데이터 `vote`
--

INSERT INTO `vote` (`Name`, `Bill_name`, `Vote`) VALUES
('Obama', 'Bad', 'Yes'),
('Obama', 'NAM', 'Yes'),
('Obama', 'Candy', 'No'),
('Bush', 'Candy', 'Yes'),
('Bush', 'Bad', 'Absent'),
('Bush', 'KW', 'Abstain'),
('Kennedy', 'NAM', 'No'),
('Kennedy', 'Candy', 'Yes'),
('Trump', 'Bad', 'Absent'),
('Trump', 'KW', 'Yes'),
('Kennedy', 'KW', 'Yes'),
('Trump', 'Good', 'Yes'),
('Obama', 'KW', 'Absent');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`Bill_name`),
  ADD KEY `ToName` (`Sponsor`);

--
-- 테이블의 인덱스 `congressperson`
--
ALTER TABLE `congressperson`
  ADD PRIMARY KEY (`Name`),
  ADD KEY `ToDistrict` (`District`);

--
-- 테이블의 인덱스 `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`State_Name`);

--
-- 테이블의 인덱스 `vote`
--
ALTER TABLE `vote`
  ADD KEY `ToName` (`Name`),
  ADD KEY `ToBillName` (`Bill_name`);

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `ToSname` FOREIGN KEY (`Sponsor`) REFERENCES `congressperson` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 테이블의 제약사항 `congressperson`
--
ALTER TABLE `congressperson`
  ADD CONSTRAINT `ToDistrict` FOREIGN KEY (`District`) REFERENCES `state` (`State_Name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 테이블의 제약사항 `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `ToBillName` FOREIGN KEY (`Bill_name`) REFERENCES `bill` (`Bill_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ToName` FOREIGN KEY (`Name`) REFERENCES `congressperson` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
