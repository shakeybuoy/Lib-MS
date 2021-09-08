SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
-----------------------------------------------------------------------------

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `FullName` varchar(100) DEFAULT NULL,
  `AdminEmail` varchar(120) DEFAULT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-----------------------------------------------------------------------------

INSERT INTO `admin` (`id`, `FullName`, `AdminEmail`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'Abhishek Piyush', 'abcd@gmail.com', 'admin', 'f925916e2754e5e03f75dd58a5733251', '2021-09-06 18:11:42');

-----------------------------------------------------------------------------

CREATE TABLE `tblauthors` (
  `id` int(11) NOT NULL,
  `AuthorName` varchar(159) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-----------------------------------------------------------------------------


INSERT INTO `tblauthors` (`id`, `AuthorName`, `creationDate`, `UpdationDate`) VALUES
(1, 'Anuj kumar', '2021-09-05 12:49:09', '2021-09-06 15:16:59'),
(2, 'Chetan Bhagatt', '2021-09-05 14:30:23', '2021-09-06 15:15:09'),
(3, 'Anita Desai', '2021-09-05 14:35:08', NULL),
(4, 'HC Verma', '2021-09-05 14:35:21', NULL),
(5, 'R.D. Sharma ', '2021-09-05 14:35:36', NULL),
(9, 'fwdfrwer', '2021-09-05 15:22:03', NULL);


-----------------------------------------------------------------------------

CREATE TABLE `tblbooks` (
  `id` int(11) NOT NULL,
  `BookName` varchar(255) DEFAULT NULL,
  `CatId` int(11) DEFAULT NULL,
  `AuthorId` int(11) DEFAULT NULL,
  `ISBNNumber` int(11) DEFAULT NULL,
  `BookPrice` int(11) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-----------------------------------------------------------------------------


INSERT INTO `tblbooks` (`id`, `BookName`, `CatId`, `AuthorId`, `ISBNNumber`, `BookPrice`, `RegDate`, `UpdationDate`) VALUES
(1, 'PHP And MySql programming', 5, 1, 222333, 700, '2021-09-05 20:04:55', '2021-09-05 05:54:41'),
(3, 'physics', 6, 4, 1111, 1000, '2021-09-05 20:17:31', '2021-09-05 06:13:17');

-----------------------------------------------------------------------------


CREATE TABLE `tblcategory` (
  `id` int(11) NOT NULL,
  `CategoryName` varchar(150) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-----------------------------------------------------------------------------


INSERT INTO `tblcategory` (`id`, `CategoryName`, `Status`, `CreationDate`, `UpdationDate`) VALUES
(4, 'Romantic', 1, '2021-09-05 18:35:25', '2021-09-06 16:00:42'),
(5, 'Technology', 1, '2021-09-05 18:35:39', '2021-09-06 17:13:03'),
(6, 'Science', 1, '2021-09-05 18:35:55', '2021-09-06 17:13:03'),
(7, 'Management', 0, '2021-09-05 18:36:16', '2021-09-06 17:13:03');

CREATE TABLE `tblissuedbookdetails` (
  `id` int(11) NOT NULL,
  `BookId` int(11) DEFAULT NULL,
  `StudentID` varchar(150) DEFAULT NULL,
  `IssuesDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ReturnDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `RetrunStatus` int(1) DEFAULT NULL,
  `fine` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
-----------------------------------------------------------------------------


INSERT INTO `tblissuedbookdetails` (`id`, `BookId`, `StudentID`, `IssuesDate`, `ReturnDate`, `RetrunStatus`, `fine`) VALUES
(1, 1, 'SID002', '2021-09-05 06:09:47', '2021-09-06 11:15:20', 1, 0),
(2, 1, 'SID002', '2021-09-05 06:12:27', '2021-09-06 11:15:23', 1, 5),
(3, 3, 'SID002', '2021-09-05 06:13:40', NULL, 0, NULL),
(4, 3, 'SID002', '2021-09-05 06:23:23', '2021-09-06 11:22:29', 1, 2),
(5, 1, 'SID009', '2021-09-05 10:59:26', NULL, 0, NULL),
(6, 3, 'SID011', '2021-09-05 18:02:55', NULL, 0, NULL);

-----------------------------------------------------------------------------


CREATE TABLE `tblstudents` (
  `id` int(11) NOT NULL,
  `StudentId` varchar(100) DEFAULT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `MobileNumber` char(11) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `Status` int(1) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-----------------------------------------------------------------------------


INSERT INTO `tblstudents` (`id`, `StudentId`, `FullName`, `EmailId`, `MobileNumber`, `Password`, `Status`, `RegDate`, `UpdationDate`) VALUES
(1, 'SID002', 'asdhasd', 'asjhd@gmail.com', '8123884499', 'f925916e2754e5e03f75dd58a5733251', 1, '2021-09-05 15:37:05', '2021-09-06 18:26:21'),
(4, 'SID005', 'sdfsd', 'csfsd@dfsfks.com', '8569710025', '92228410fc8b872914e023160cf4ae8f', 0, '2021-09-05 15:41:27', '2021-09-06 17:43:03'),
(8, 'SID009', 'test', 'test@gmail.com', '2359874527', 'f925916e2754e5e03f75dd58a5733251', 1, '2021-09-05 15:58:28', '2021-09-06 13:42:44'),
(9, 'SID010', 'Aman', 'aman@gmail.com', '8585856224', 'f925916e2754e5e03f75dd58a5733251', 1, '2021-09-05 13:40:30', NULL),
(10, 'SID011', 'Samir Pandey', 'sam@gmail.com', '4672423754', 'f925916e2754e5e03f75dd58a5733251', 1, '2021-09-05 18:00:59', NULL);

-----------------------------------------------------------------------------

ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);
-----------------------------------------------------------------------------

ALTER TABLE `tblauthors`
  ADD PRIMARY KEY (`id`);
-----------------------------------------------------------------------------

ALTER TABLE `tblbooks`
  ADD PRIMARY KEY (`id`);
-----------------------------------------------------------------------------

ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`id`);
-----------------------------------------------------------------------------

ALTER TABLE `tblissuedbookdetails`
  ADD PRIMARY KEY (`id`);
-----------------------------------------------------------------------------

ALTER TABLE `tblstudents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `StudentId` (`StudentId`);

-----------------------------------------------------------------------------

ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

-----------------------------------------------------------------------------

ALTER TABLE `tblauthors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
-----------------------------------------------------------------------------

ALTER TABLE `tblbooks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-----------------------------------------------------------------------------
ALTER TABLE `tblcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

-----------------------------------------------------------------------------
ALTER TABLE `tblissuedbookdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

-----------------------------------------------------------------------------
ALTER TABLE `tblstudents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

