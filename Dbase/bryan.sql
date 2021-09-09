-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2021 at 09:55 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bryan`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assetindexdata`
--

CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assettransformindex`
--

CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `assettransforms`
--

CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups`
--

CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorygroups_sites`
--

CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `changedattributes`
--

CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `changedfields`
--

CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, '2021-09-09 03:37:05', '2021-09-09 03:37:05', 'dc1c0739-e05f-47ba-9e9c-168d7b31690d');

-- --------------------------------------------------------

--
-- Table structure for table `craftidtokens`
--

CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deprecationerrors`
--

CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `traces` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `drafts`
--

CREATE TABLE `drafts` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `elementindexsettings`
--

CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `id` int(11) NOT NULL,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `canonicalId`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateLastMerged`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2021-09-09 03:37:05', '2021-09-09 03:37:05', NULL, NULL, 'f0f4510b-3c66-4283-b3cf-f25857eb1d52');

-- --------------------------------------------------------

--
-- Table structure for table `elements_sites`
--

CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `elements_sites`
--

INSERT INTO `elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2021-09-09 03:37:05', '2021-09-09 03:37:05', 'b7df79eb-4211-415e-9a49-48781f973604');

-- --------------------------------------------------------

--
-- Table structure for table `entries`
--

CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `entrytypes`
--

CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fieldgroups`
--

CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fieldgroups`
--

INSERT INTO `fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Common', '2021-09-09 03:37:05', '2021-09-09 03:37:05', NULL, '28cb9747-6d2b-4b07-86da-ad26eff09695');

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayoutfields`
--

CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouts`
--

CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fieldlayouttabs`
--

CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fields`
--

CREATE TABLE `fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `globalsets`
--

CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gqlschemas`
--

CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gqltokens`
--

CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `version`, `schemaVersion`, `maintenance`, `configVersion`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.7.12', '3.7.8', 0, 'sceozdoorwkm', 'drqrebrbjpxf', '2021-09-09 03:37:05', '2021-09-09 03:37:07', '9ba42aef-8c0a-4edf-bdbb-6cbe666953ef');

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocks`
--

CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `matrixblocktypes`
--

CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `track`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'craft', 'Install', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'b5b16f67-a988-4d51-9b88-81784d962ae9'),
(2, 'craft', 'm150403_183908_migrations_table_changes', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '5358cfd7-71d2-46c5-ac41-ab3165b9c5f0'),
(3, 'craft', 'm150403_184247_plugins_table_changes', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '0c4d708a-4550-4b53-b0a3-1f48f43014a5'),
(4, 'craft', 'm150403_184533_field_version', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '5b73e974-150c-4a3c-bbec-d76a3e76b73d'),
(5, 'craft', 'm150403_184729_type_columns', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'ee7c5fb6-96a8-4479-9f78-9a0d45969647'),
(6, 'craft', 'm150403_185142_volumes', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '56773ece-aaa6-4f74-9c00-ab5058c528d8'),
(7, 'craft', 'm150428_231346_userpreferences', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'fecad6ca-3a7f-4626-a687-d921e74e77e0'),
(8, 'craft', 'm150519_150900_fieldversion_conversion', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '7232fea7-607a-4cea-8780-9fce986e7a9f'),
(9, 'craft', 'm150617_213829_update_email_settings', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'bc91a990-ac64-4154-84e1-27db9269b580'),
(10, 'craft', 'm150721_124739_templatecachequeries', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'd27bb23a-3abb-49ee-b539-158ffdbca3b3'),
(11, 'craft', 'm150724_140822_adjust_quality_settings', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '4b67b6c6-3552-415d-a187-55f5ac608abe'),
(12, 'craft', 'm150815_133521_last_login_attempt_ip', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'bd2112c8-c672-4a16-b0b7-4cddc563a396'),
(13, 'craft', 'm151002_095935_volume_cache_settings', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'a8d0e52f-bd67-4378-96a1-04e63913b0fb'),
(14, 'craft', 'm151005_142750_volume_s3_storage_settings', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '23d5f674-a880-4397-ace1-1c3041acc5ba'),
(15, 'craft', 'm151016_133600_delete_asset_thumbnails', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'cefa84cb-9cfb-4759-af87-8046d1cc4340'),
(16, 'craft', 'm151209_000000_move_logo', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '6471da1f-1574-41a1-97a5-01ac23802545'),
(17, 'craft', 'm151211_000000_rename_fileId_to_assetId', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '3d8175dd-0e9b-4fa0-a32b-7f381ebf1d4c'),
(18, 'craft', 'm151215_000000_rename_asset_permissions', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '792a5427-a14c-42f8-b77e-59a743ca7416'),
(19, 'craft', 'm160707_000001_rename_richtext_assetsource_setting', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '11ecec59-9e8c-43a8-bea6-f12989c04b5d'),
(20, 'craft', 'm160708_185142_volume_hasUrls_setting', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '4e252a5b-d4c9-429e-b1a9-bb86fdaad7d8'),
(21, 'craft', 'm160714_000000_increase_max_asset_filesize', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '79aa50a0-3e01-4079-952b-ff2012550841'),
(22, 'craft', 'm160727_194637_column_cleanup', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2edc29ca-3bd4-46df-9714-d3822886905c'),
(23, 'craft', 'm160804_110002_userphotos_to_assets', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '73c3be07-694b-40db-a29f-f89d9bf07a14'),
(24, 'craft', 'm160807_144858_sites', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'f232686e-2c6b-4933-8803-7319101ab139'),
(25, 'craft', 'm160829_000000_pending_user_content_cleanup', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '9b609204-aa64-43ad-a6df-f52280d54a3d'),
(26, 'craft', 'm160830_000000_asset_index_uri_increase', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'e88a7d96-f967-411a-a373-51796ca6b882'),
(27, 'craft', 'm160912_230520_require_entry_type_id', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '453a3909-40b1-4b2b-9f8e-f3719e05139b'),
(28, 'craft', 'm160913_134730_require_matrix_block_type_id', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '35069e57-2ed1-4232-9640-9da2c0e5496c'),
(29, 'craft', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'b7bed9b9-4451-444b-8b98-9a4e6851653b'),
(30, 'craft', 'm160920_231045_usergroup_handle_title_unique', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '0ff986ba-9636-4d26-9a7d-47fe868651c2'),
(31, 'craft', 'm160925_113941_route_uri_parts', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '1fc872c2-f5d6-40f5-b4ba-4ddc445d99ee'),
(32, 'craft', 'm161006_205918_schemaVersion_not_null', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'b9e1eda4-5f55-465e-9b04-e9856e3ad3e1'),
(33, 'craft', 'm161007_130653_update_email_settings', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'feb16d93-8961-485e-9a6e-c652a9ba3d02'),
(34, 'craft', 'm161013_175052_newParentId', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '6af28d0e-27e9-45e6-b987-4def2f97784d'),
(35, 'craft', 'm161021_102916_fix_recent_entries_widgets', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'c3d4a99e-9f85-48ec-96a0-8c7b5aca71ad'),
(36, 'craft', 'm161021_182140_rename_get_help_widget', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'bde5c690-efee-4723-b42a-15b685428df7'),
(37, 'craft', 'm161025_000000_fix_char_columns', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '0dbad30b-2c54-4c91-b676-8019e3b3dedf'),
(38, 'craft', 'm161029_124145_email_message_languages', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '4a9f13c8-3c2b-4f2e-8b35-799ad295205d'),
(39, 'craft', 'm161108_000000_new_version_format', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'e72043ec-aa98-4913-95f5-8cd1efbe5f6a'),
(40, 'craft', 'm161109_000000_index_shuffle', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'dc5f43ec-ef76-497b-96a8-c72d75103f09'),
(41, 'craft', 'm161122_185500_no_craft_app', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '5b196b83-dff9-45fd-b6c9-6aaca2c428de'),
(42, 'craft', 'm161125_150752_clear_urlmanager_cache', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'd24cb914-d1a4-4e0f-b79d-f320a7533001'),
(43, 'craft', 'm161220_000000_volumes_hasurl_notnull', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'a19ba5aa-087f-40f6-8146-017877c7da25'),
(44, 'craft', 'm170114_161144_udates_permission', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '22ce414a-aa1e-4259-8c5a-7c7e37d8d5be'),
(45, 'craft', 'm170120_000000_schema_cleanup', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '0d14a165-0f5a-41a6-87df-401b6fc145d5'),
(46, 'craft', 'm170126_000000_assets_focal_point', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '0eca21d8-b818-4e5b-8348-f43f87105acf'),
(47, 'craft', 'm170206_142126_system_name', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '349aaf8d-5f08-49d3-bd97-63db24857f1e'),
(48, 'craft', 'm170217_044740_category_branch_limits', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'dd8d6d05-fbfe-4d1c-970e-94c4ae66e743'),
(49, 'craft', 'm170217_120224_asset_indexing_columns', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '57d5bf18-be64-47e7-8e90-5c26cc85c1b4'),
(50, 'craft', 'm170223_224012_plain_text_settings', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '393d8bb9-f2a7-4103-8be0-5ff671c2bcb6'),
(51, 'craft', 'm170227_120814_focal_point_percentage', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '5d1ba7a2-4212-482f-9d70-9d4b68dd6a29'),
(52, 'craft', 'm170228_171113_system_messages', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2c29027b-6a49-46ff-8310-6bd36accbcb7'),
(53, 'craft', 'm170303_140500_asset_field_source_settings', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '5a268f81-a41c-4926-a199-0119d918a3d7'),
(54, 'craft', 'm170306_150500_asset_temporary_uploads', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '86599251-519d-4958-b71c-c7c3527321c4'),
(55, 'craft', 'm170523_190652_element_field_layout_ids', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2fbb07aa-7847-4832-8736-a800855c7b7e'),
(56, 'craft', 'm170621_195237_format_plugin_handles', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '8ce9cc93-d6e4-49a6-a4a3-b5661c534e18'),
(57, 'craft', 'm170630_161027_deprecation_line_nullable', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '36ec6757-9a74-41c7-bce5-8340e06a86b1'),
(58, 'craft', 'm170630_161028_deprecation_changes', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '8e7da243-6005-4744-8384-197324df74d6'),
(59, 'craft', 'm170703_181539_plugins_table_tweaks', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '28168e70-677e-4b7f-a036-b22601074a43'),
(60, 'craft', 'm170704_134916_sites_tables', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'c2e5308f-31a9-4658-a304-2cf928892786'),
(61, 'craft', 'm170706_183216_rename_sequences', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'b7baae0f-36e2-4c3a-9807-a813ec28336a'),
(62, 'craft', 'm170707_094758_delete_compiled_traits', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'c752ee75-897f-4049-bd42-cd3f255eb387'),
(63, 'craft', 'm170731_190138_drop_asset_packagist', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '52dd54a2-4326-48a0-88b5-e5a98056f086'),
(64, 'craft', 'm170810_201318_create_queue_table', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '7e358737-0b67-45e1-b5fd-218323396aec'),
(65, 'craft', 'm170903_192801_longblob_for_queue_jobs', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '47d92966-beb5-4469-b95b-56b655c9801b'),
(66, 'craft', 'm170914_204621_asset_cache_shuffle', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '1020f0c9-3f64-4182-b2e0-4e621ef707d8'),
(67, 'craft', 'm171011_214115_site_groups', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'ae5a697b-2792-4998-8b36-a332379c823e'),
(68, 'craft', 'm171012_151440_primary_site', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '7204a74b-cf52-46af-8c44-5c223247c306'),
(69, 'craft', 'm171013_142500_transform_interlace', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '862e292b-3df4-43e3-a38e-1de49cbd03be'),
(70, 'craft', 'm171016_092553_drop_position_select', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '885c24ae-99c8-43d2-92ab-21ac149f3bd1'),
(71, 'craft', 'm171016_221244_less_strict_translation_method', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '000bdb67-7ec3-46fa-8201-f3e2fb783a8e'),
(72, 'craft', 'm171107_000000_assign_group_permissions', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '337959b7-bb70-490c-922d-638f7fc2e558'),
(73, 'craft', 'm171117_000001_templatecache_index_tune', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '04c2c44b-8bab-41f0-a56c-6be5ab76863c'),
(74, 'craft', 'm171126_105927_disabled_plugins', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'e62c3784-32a4-4a91-b54d-267228860e68'),
(75, 'craft', 'm171130_214407_craftidtokens_table', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '02765a85-fcc5-4933-b988-7d419be66a17'),
(76, 'craft', 'm171202_004225_update_email_settings', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '4ce848c1-b9f3-4b7d-827e-a247a59c9820'),
(77, 'craft', 'm171204_000001_templatecache_index_tune_deux', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'a5eec359-adfe-411e-ac26-98ac66c9b2e4'),
(78, 'craft', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'c8aebfa9-c631-4895-88e1-23b63c988fdb'),
(79, 'craft', 'm171218_143135_longtext_query_column', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '8e0f17dd-18a0-447e-9a78-e178c5be8f3e'),
(80, 'craft', 'm171231_055546_environment_variables_to_aliases', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '21dec743-0d63-4946-a9e5-385d11c9427c'),
(81, 'craft', 'm180113_153740_drop_users_archived_column', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'f7618dbd-c444-4fc1-84d0-6914b75398e2'),
(82, 'craft', 'm180122_213433_propagate_entries_setting', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '4b919420-44a3-4f42-8418-f352cb84ef44'),
(83, 'craft', 'm180124_230459_fix_propagate_entries_values', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'ca6a8818-0355-4fef-bbf7-2b9596abc335'),
(84, 'craft', 'm180128_235202_set_tag_slugs', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'f26c7263-0870-455a-bdac-de2837ce2dde'),
(85, 'craft', 'm180202_185551_fix_focal_points', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '0cb98060-d6ba-4d58-9cfa-6712fffd3dcd'),
(86, 'craft', 'm180217_172123_tiny_ints', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'def9eb88-670e-4070-8bf1-2a58ad61f3a1'),
(87, 'craft', 'm180321_233505_small_ints', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'e31344a3-fbf8-48bd-bd43-e9e3d30feaa8'),
(88, 'craft', 'm180404_182320_edition_changes', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '82812fcf-47ec-4616-b586-7390ce3093e8'),
(89, 'craft', 'm180411_102218_fix_db_routes', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '102ec139-ae00-4f77-b395-787665535194'),
(90, 'craft', 'm180416_205628_resourcepaths_table', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '21639a4e-930f-4ee9-9767-c375d23201e3'),
(91, 'craft', 'm180418_205713_widget_cleanup', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '1c3f82fb-29bf-4a2d-9537-27ff87d73f88'),
(92, 'craft', 'm180425_203349_searchable_fields', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '6f4558fb-c321-4003-a0aa-0e49175787ed'),
(93, 'craft', 'm180516_153000_uids_in_field_settings', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'afe589a3-f543-4b96-bb8b-bcf22e813ca6'),
(94, 'craft', 'm180517_173000_user_photo_volume_to_uid', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '689b82a5-765d-4c3a-9c30-13a874b31da8'),
(95, 'craft', 'm180518_173000_permissions_to_uid', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'c783a19e-5a35-4288-ab97-eb8bad5ad56f'),
(96, 'craft', 'm180520_173000_matrix_context_to_uids', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'ae74e1a5-095a-42e8-8665-787b65ea166b'),
(97, 'craft', 'm180521_172900_project_config_table', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '350be5c9-bd13-47a4-b076-c2cc91e469de'),
(98, 'craft', 'm180521_173000_initial_yml_and_snapshot', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '581516f7-410e-4c4b-8697-4cbb6d98beed'),
(99, 'craft', 'm180731_162030_soft_delete_sites', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'eeb2daad-f43e-4ca3-b184-b2cb45e4626e'),
(100, 'craft', 'm180810_214427_soft_delete_field_layouts', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2e21fffc-07a5-447c-a7f1-a81be395d54e'),
(101, 'craft', 'm180810_214439_soft_delete_elements', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'e960df99-441c-4168-bfbc-c9cb276eefd1'),
(102, 'craft', 'm180824_193422_case_sensitivity_fixes', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'ddb09ea3-e9f6-4c69-9822-448e8eb924c5'),
(103, 'craft', 'm180901_151639_fix_matrixcontent_tables', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'fb787781-a3e0-4364-833f-a914d6bec2e1'),
(104, 'craft', 'm180904_112109_permission_changes', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '6cbee819-ef08-4e72-a3cd-f2449d81c1c4'),
(105, 'craft', 'm180910_142030_soft_delete_sitegroups', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '32f29efd-9143-4eab-9c46-c4ea9c8cc0e5'),
(106, 'craft', 'm181011_160000_soft_delete_asset_support', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '5a320d78-999d-4716-afde-e21ed4dea686'),
(107, 'craft', 'm181016_183648_set_default_user_settings', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'c15944fa-0130-414c-870d-50a0fb20e61a'),
(108, 'craft', 'm181017_225222_system_config_settings', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '59a85eb8-ed0f-42eb-b5b9-e77362150ed1'),
(109, 'craft', 'm181018_222343_drop_userpermissions_from_config', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '36cbd46f-26ec-4bdd-ae81-57413b93b26c'),
(110, 'craft', 'm181029_130000_add_transforms_routes_to_config', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'a2ac2f98-b314-41c8-b8ac-06e1d8d48cee'),
(111, 'craft', 'm181112_203955_sequences_table', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'aca9b142-6686-4a54-8fc5-ad1cde040f47'),
(112, 'craft', 'm181121_001712_cleanup_field_configs', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '55a870d9-9b29-4654-9a3b-5329bbb15392'),
(113, 'craft', 'm181128_193942_fix_project_config', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '892a1fd3-1696-4c9d-ae95-94e8efcb657a'),
(114, 'craft', 'm181130_143040_fix_schema_version', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '0f66d350-e045-4369-ae25-b65fc738a5c7'),
(115, 'craft', 'm181211_143040_fix_entry_type_uids', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'b016f324-bdad-492d-ace9-1a8c4776441e'),
(116, 'craft', 'm181217_153000_fix_structure_uids', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'b14fb277-93af-4338-902b-0fc3a704314c'),
(117, 'craft', 'm190104_152725_store_licensed_plugin_editions', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '7064cf05-cdf4-4fe9-b46d-cc0470d32ae1'),
(118, 'craft', 'm190108_110000_cleanup_project_config', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '743cb574-f0c2-48d1-9dcd-9063424be1a7'),
(119, 'craft', 'm190108_113000_asset_field_setting_change', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'cb2a3ac5-a668-4f30-8550-bff97e8cc194'),
(120, 'craft', 'm190109_172845_fix_colspan', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'b7fa28fc-5835-42b3-93e5-98988b9adf15'),
(121, 'craft', 'm190110_150000_prune_nonexisting_sites', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'd670ed1b-7058-4281-8e65-6f49394839a5'),
(122, 'craft', 'm190110_214819_soft_delete_volumes', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '79425c86-44c5-451c-a372-7a133c1c138d'),
(123, 'craft', 'm190112_124737_fix_user_settings', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '6b8771ab-5553-4f8f-a203-310e3bbef88a'),
(124, 'craft', 'm190112_131225_fix_field_layouts', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'be6bb83f-06e8-4d70-a4bd-6b5d4d03a99d'),
(125, 'craft', 'm190112_201010_more_soft_deletes', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'a926cd5e-ef84-4e35-ac5d-7da9eaa9ffa7'),
(126, 'craft', 'm190114_143000_more_asset_field_setting_changes', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '4ad9f03a-cf36-4673-b44b-31e75fe01749'),
(127, 'craft', 'm190121_120000_rich_text_config_setting', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '29ca5d90-4dfe-4720-9e97-fe2b74cc8df3'),
(128, 'craft', 'm190125_191628_fix_email_transport_password', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '83e16747-fa39-4c9c-a13b-c7337735e89e'),
(129, 'craft', 'm190128_181422_cleanup_volume_folders', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '5ec9ed83-a85c-4308-9f0a-c3156620f41c'),
(130, 'craft', 'm190205_140000_fix_asset_soft_delete_index', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'b562cea4-82cb-4f19-902d-c33da74e819a'),
(131, 'craft', 'm190218_143000_element_index_settings_uid', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '15e40496-6016-4f26-9f0c-413001c3c56e'),
(132, 'craft', 'm190312_152740_element_revisions', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '9e6c0f32-602b-4708-949d-d28e72e93479'),
(133, 'craft', 'm190327_235137_propagation_method', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'f24512b8-0104-4f1e-be2c-95cf6f311a53'),
(134, 'craft', 'm190401_223843_drop_old_indexes', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2b55819f-a895-4064-af70-5c62f0afde69'),
(135, 'craft', 'm190416_014525_drop_unique_global_indexes', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '018d1d0c-afcc-42f1-965e-a162b2f17f67'),
(136, 'craft', 'm190417_085010_add_image_editor_permissions', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '35cd48bb-5bbe-4cc4-b0eb-f2f78231122c'),
(137, 'craft', 'm190502_122019_store_default_user_group_uid', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '5b80b1dc-8b1f-42c6-966d-2271b0b96964'),
(138, 'craft', 'm190504_150349_preview_targets', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'ac51e4fe-537a-48a1-aa9b-ca5dc0241c62'),
(139, 'craft', 'm190516_184711_job_progress_label', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'b4a861b7-1e2f-45ec-984f-d339b4cdaa06'),
(140, 'craft', 'm190523_190303_optional_revision_creators', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '455314f5-884f-4a7a-a0b3-0cb9152bdad4'),
(141, 'craft', 'm190529_204501_fix_duplicate_uids', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '6069d961-5011-497a-b25a-1f7ffb9c0eb4'),
(142, 'craft', 'm190605_223807_unsaved_drafts', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '327ba4e1-a8b0-46ca-82cd-96e9dc9b0a40'),
(143, 'craft', 'm190607_230042_entry_revision_error_tables', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2d1ff937-266a-431a-85f3-733e9109626a'),
(144, 'craft', 'm190608_033429_drop_elements_uid_idx', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'c4324f71-d034-4124-a86f-00ed574b6f70'),
(145, 'craft', 'm190617_164400_add_gqlschemas_table', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '7c7a6aa7-30eb-4bcc-bfcf-1c208183054f'),
(146, 'craft', 'm190624_234204_matrix_propagation_method', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'c3a74785-bce2-4a6c-a7fa-c566b84ce62f'),
(147, 'craft', 'm190711_153020_drop_snapshots', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'e8a42b3f-c3da-4897-9281-68eaddd6bb6b'),
(148, 'craft', 'm190712_195914_no_draft_revisions', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '6b530009-8b6d-4bc8-8cd1-3de17ce7a32f'),
(149, 'craft', 'm190723_140314_fix_preview_targets_column', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', 'aab3ccdd-cc70-4687-8c51-ad09d52c636a'),
(150, 'craft', 'm190820_003519_flush_compiled_templates', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '7785fe3a-3801-4def-9e75-c56392895072'),
(151, 'craft', 'm190823_020339_optional_draft_creators', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:37:06', '4abd7ba9-c0b2-46c4-be22-3f8baff61930'),
(152, 'craft', 'm190913_152146_update_preview_targets', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', 'd08b6ef7-616c-4f9c-b3e8-f8f74ae5100f'),
(153, 'craft', 'm191107_122000_add_gql_project_config_support', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', 'a71022e0-6d62-4577-9214-c6b2c343378e'),
(154, 'craft', 'm191204_085100_pack_savable_component_settings', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', 'af93b5f6-d381-429e-9fd9-2b7c58bb6641'),
(155, 'craft', 'm191206_001148_change_tracking', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '74945d56-ded5-4ce3-8726-f4dc05104745'),
(156, 'craft', 'm191216_191635_asset_upload_tracking', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '367ef7a8-7d0b-47d3-901e-4625c752e9aa'),
(157, 'craft', 'm191222_002848_peer_asset_permissions', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '33b4000e-76e0-48ee-ab30-3067a4963c59'),
(158, 'craft', 'm200127_172522_queue_channels', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '17e11e86-290b-4e50-b909-0436776be13a'),
(159, 'craft', 'm200211_175048_truncate_element_query_cache', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', 'feb7277b-f61f-42a2-bcfa-4038c0dc1998'),
(160, 'craft', 'm200213_172522_new_elements_index', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '25acfa45-ceae-4625-bc94-9c051a32b242'),
(161, 'craft', 'm200228_195211_long_deprecation_messages', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', 'e01a0c46-df42-41a2-9f73-7f1d75e3346a'),
(162, 'craft', 'm200306_054652_disabled_sites', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '4ad7f65a-55bf-44e3-b006-dcff85aef119'),
(163, 'craft', 'm200522_191453_clear_template_caches', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '9c748995-515d-4e8e-8b19-e2dea11d0e37'),
(164, 'craft', 'm200606_231117_migration_tracks', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '91f5e775-d220-4ca9-87b0-e6f0e04cbd11'),
(165, 'craft', 'm200619_215137_title_translation_method', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '7cdf2592-28c8-42f7-9ec5-ca8b39212bc2'),
(166, 'craft', 'm200620_005028_user_group_descriptions', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '5f8995a2-3c67-48b3-87dd-6a7c1140dfc6'),
(167, 'craft', 'm200620_230205_field_layout_changes', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '1d44361f-ac9f-4557-8c78-bca91462f50f'),
(168, 'craft', 'm200625_131100_move_entrytypes_to_top_project_config', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '7dcbe39d-0824-4774-aa97-760bb13cfe95'),
(169, 'craft', 'm200629_112700_remove_project_config_legacy_files', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '9fefa4db-31d6-4c03-8122-dc37eb6a73aa'),
(170, 'craft', 'm200630_183000_drop_configmap', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', 'e5a1d1c1-10a4-4e6b-92d0-fc1f830f0c5c'),
(171, 'craft', 'm200715_113400_transform_index_error_flag', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', 'ecb1306c-3c8e-49c2-b655-90f5248afa34'),
(172, 'craft', 'm200716_110900_replace_file_asset_permissions', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '8ce23032-d409-4050-9712-5633bb396399'),
(173, 'craft', 'm200716_153800_public_token_settings_in_project_config', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '7a4098fe-a907-4e83-a2fb-9ecf3be1c6fc'),
(174, 'craft', 'm200720_175543_drop_unique_constraints', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', 'e06f3aaa-5216-4f02-8287-f98e27a42770'),
(175, 'craft', 'm200825_051217_project_config_version', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', 'c14a089e-3a13-4602-a2ac-b77aaf7bc7f2'),
(176, 'craft', 'm201116_190500_asset_title_translation_method', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '28bb7a09-4191-4b92-811e-e49e588c7612'),
(177, 'craft', 'm201124_003555_plugin_trials', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '1d9dd752-3504-4e47-aced-195b2fb25361'),
(178, 'craft', 'm210209_135503_soft_delete_field_groups', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', 'f6a15e5a-bd65-4515-bc4a-d7608cdfbc79'),
(179, 'craft', 'm210212_223539_delete_invalid_drafts', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '7cba7dc1-7669-49a4-b1a9-bf3fbe60f31d'),
(180, 'craft', 'm210214_202731_track_saved_drafts', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '49285d51-cbf8-4d8e-ac40-4de57cbdaaf4'),
(181, 'craft', 'm210223_150900_add_new_element_gql_schema_components', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', 'a3529510-7d30-47b9-a28e-ace0cad4e92c'),
(182, 'craft', 'm210302_212318_canonical_elements', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', 'd38fa047-72bd-40a9-abf2-691b506d7831'),
(183, 'craft', 'm210326_132000_invalidate_projectconfig_cache', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '3556b7b9-8dca-4553-bf4c-2ccc212fd93f'),
(184, 'craft', 'm210329_214847_field_column_suffixes', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '443d1b9b-621e-4240-9e65-856352c79ba3'),
(185, 'craft', 'm210331_220322_null_author', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '12f17b4b-26d2-4463-8f8c-3d68fbb6df3c'),
(186, 'craft', 'm210405_231315_provisional_drafts', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '0de275bf-e03f-4f7b-a116-23ac05c9ea4b'),
(187, 'craft', 'm210602_111300_project_config_names_in_config', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '8c42b4d8-4f67-41e4-995f-94eb35e290fe'),
(188, 'craft', 'm210611_233510_default_placement_settings', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '8b9bb6a8-c785-4fab-8dd1-b04e9faa42e6'),
(189, 'craft', 'm210613_145522_sortable_global_sets', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '19283948-f905-4db1-85e5-0cafb9bfb6e2'),
(190, 'craft', 'm210613_184103_announcements', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '7bf9adea-048a-4cdd-84eb-7003421917d8'),
(191, 'craft', 'm210829_000000_element_index_tweak', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '2021-09-09 03:37:07', '0e4df353-1c54-4dae-99e4-6cc1d893ee4c');

-- --------------------------------------------------------

--
-- Table structure for table `plugins`
--

CREATE TABLE `plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projectconfig`
--

CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projectconfig`
--

INSERT INTO `projectconfig` (`path`, `value`) VALUES
('dateModified', '1631158627'),
('email.fromEmail', '\"dev.bryanpineda@gmail.com\"'),
('email.fromName', '\"Bryan Craft\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('fieldGroups.28cb9747-6d2b-4b07-86da-ad26eff09695.name', '\"Common\"'),
('meta.__names__.28cb9747-6d2b-4b07-86da-ad26eff09695', '\"Common\"'),
('meta.__names__.3d128ea2-f3c4-43c2-9387-d6d3d3ddda14', '\"Bryan Craft\"'),
('meta.__names__.930bf084-c4f1-4c18-9480-8d1c6ef7f311', '\"Bryan Craft\"'),
('siteGroups.3d128ea2-f3c4-43c2-9387-d6d3d3ddda14.name', '\"Bryan Craft\"'),
('sites.930bf084-c4f1-4c18-9480-8d1c6ef7f311.baseUrl', '\"$PRIMARY_SITE_URL\"'),
('sites.930bf084-c4f1-4c18-9480-8d1c6ef7f311.handle', '\"default\"'),
('sites.930bf084-c4f1-4c18-9480-8d1c6ef7f311.hasUrls', 'true'),
('sites.930bf084-c4f1-4c18-9480-8d1c6ef7f311.language', '\"en-US\"'),
('sites.930bf084-c4f1-4c18-9480-8d1c6ef7f311.name', '\"Bryan Craft\"'),
('sites.930bf084-c4f1-4c18-9480-8d1c6ef7f311.primary', 'true'),
('sites.930bf084-c4f1-4c18-9480-8d1c6ef7f311.siteGroup', '\"3d128ea2-f3c4-43c2-9387-d6d3d3ddda14\"'),
('sites.930bf084-c4f1-4c18-9480-8d1c6ef7f311.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"Bryan Craft\"'),
('system.schemaVersion', '\"3.7.8\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', 'null'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `queue`
--

CREATE TABLE `queue` (
  `id` int(11) NOT NULL,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) UNSIGNED NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `relations`
--

CREATE TABLE `relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resourcepaths`
--

CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `resourcepaths`
--

INSERT INTO `resourcepaths` (`hash`, `path`) VALUES
('13ee99d4', '@lib/element-resize-detector'),
('19cc2496', '@craft/web/assets/updateswidget/dist'),
('1aa9cc46', '@craft/web/assets/cp/dist'),
('277666f8', '@craft/web/assets/recententries/dist'),
('2a3499d0', '@craft/web/assets/findreplace/dist'),
('2df1c55c', '@lib/velocity'),
('31d66ab4', '@lib/jquery.payment'),
('3c7e3221', '@bower/jquery/dist'),
('4464bdc5', '@lib/vue'),
('479857ee', '@craft/web/assets/sites/dist'),
('5940c5cd', '@craft/web/assets/utilities/dist'),
('5ea33fed', '@craft/web/assets/queuemanager/dist'),
('63585ef9', '@lib/jquery-ui'),
('698f1eb0', '@lib/axios'),
('7acf4de6', '@app/web/assets/dashboard/dist'),
('8175efdb', '@craft/web/assets/feed/dist'),
('8c372227', '@app/web/assets/installer/dist'),
('8dcc3971', '@lib/garnishjs'),
('94a7ca88', '@app/web/assets/craftsupport/dist'),
('988aed4f', '@lib/fabric'),
('9a356649', '@app/web/assets/updateswidget/dist'),
('a0d932eb', '@app/web/assets/cp/dist'),
('a2fa4e81', '@app/web/assets/pluginstore/dist'),
('a48f2427', '@app/web/assets/recententries/dist'),
('a49f304f', '@lib/iframe-resizer'),
('a83c0f58', '@lib/fileupload'),
('ac9cd7a', '@craft/web/assets/pluginstore/dist'),
('b0d40ea6', '@lib/picturefill'),
('b6666552', '@craft/web/assets/login/dist'),
('b7703264', '@lib/jquery-touch-events'),
('be60d29f', '@craft/web/assets/craftsupport/dist'),
('be712ef7', '@lib/d3'),
('c1e79646', '@craft/web/assets/updates/dist'),
('dbb9413b', '@app/web/assets/utilities/dist'),
('e4aa2322', '@lib/selectize'),
('eb639aa6', '@modules/yelpapimodule/assetbundles/yelpapimodule/dist'),
('ebbc4db2', '@craft/web/assets/routes/dist'),
('ecea6d1', '@craft/web/assets/installer/dist'),
('eec667a8', '@lib/xregexp'),
('f836c910', '@craft/web/assets/dashboard/dist');

-- --------------------------------------------------------

--
-- Table structure for table `revisions`
--

CREATE TABLE `revisions` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `searchindex`
--

CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `searchindex`
--

INSERT INTO `searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' admin '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' dev bryanpineda gmail com '),
(1, 'slug', 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections_sites`
--

CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sequences`
--

CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `userId`, `token`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, '_IgY7-t356ocoPHZtnscAcEpQA8uJoKu3IqwDBW6RkZICfpuusef1p3KXcukkUtmbx41Rel78RokNmTQlG3WBY0YFguL9beQtuKe', '2021-09-09 03:39:32', '2021-09-09 07:41:51', '1f95de8b-0efd-4e39-8aac-654a9426e4a3');

-- --------------------------------------------------------

--
-- Table structure for table `shunnedmessages`
--

CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sitegroups`
--

CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sitegroups`
--

INSERT INTO `sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'Bryan Craft', '2021-09-09 03:37:05', '2021-09-09 03:37:05', NULL, '3d128ea2-f3c4-43c2-9387-d6d3d3ddda14');

-- --------------------------------------------------------

--
-- Table structure for table `sites`
--

CREATE TABLE `sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sites`
--

INSERT INTO `sites` (`id`, `groupId`, `primary`, `enabled`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 1, 'Bryan Craft', 'default', 'en-US', 1, '$PRIMARY_SITE_URL', 1, '2021-09-09 03:37:05', '2021-09-09 03:37:05', NULL, '930bf084-c4f1-4c18-9480-8d1c6ef7f311');

-- --------------------------------------------------------

--
-- Table structure for table `structureelements`
--

CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `structures`
--

CREATE TABLE `structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `systemmessages`
--

CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taggroups`
--

CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templatecacheelements`
--

CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templatecachequeries`
--

CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templatecaches`
--

CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usergroups_users`
--

CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions`
--

CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_usergroups`
--

CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpermissions_users`
--

CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userpreferences`
--

CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `userpreferences`
--

INSERT INTO `userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\"}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'admin', NULL, NULL, NULL, 'dev.bryanpineda@gmail.com', '$2y$13$9bJHBQ/en6FfkgEu3D7q3OEzH27uwqlBnwKYwWP525aVkILNDY3cm', 1, 0, 0, 0, '2021-09-09 03:39:32', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2021-09-09 03:37:06', '2021-09-09 03:37:06', '2021-09-09 03:39:33', 'e83a6440-deb8-429b-bbca-8d6fb9d41faa');

-- --------------------------------------------------------

--
-- Table structure for table `volumefolders`
--

CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `volumes`
--

CREATE TABLE `volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `widgets`
--

INSERT INTO `widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, 4, '{\"siteId\":1,\"section\":\"*\",\"limit\":\"20\"}', 1, '2021-09-09 03:39:33', '2021-09-09 07:07:03', '5520875b-0d30-411f-9544-8a84fb2d09ed'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2021-09-09 03:39:33', '2021-09-09 03:39:33', 'f400d28d-c976-45ed-bf82-6926db177b33'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2021-09-09 03:39:33', '2021-09-09 03:39:33', 'f67ae8d4-f140-48b9-abc0-cdf99d0f57c4'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2021-09-09 03:39:33', '2021-09-09 03:39:33', 'a3dde075-a48c-46c1-99a2-84a39c0cad94');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_snhxmwxehiyjswtldjydlkamwrvuentasplt` (`userId`,`unread`,`dateRead`,`dateCreated`),
  ADD KEY `idx_rcndpcyblwjxcmkukiyjuzpgxukalcvclcno` (`dateRead`),
  ADD KEY `fk_vcpffiogmgqzluttiydaebppljzkkcslguwd` (`pluginId`);

--
-- Indexes for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_hodcymzdptpomenxjiugmdxjgpyvdgvyfckr` (`sessionId`,`volumeId`),
  ADD KEY `idx_ssudnwpqpriwrsaocftisblqibkvohthmvhp` (`volumeId`);

--
-- Indexes for table `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dnhdcdixtidkpfqutjmhmyqvdicikqsxwhru` (`filename`,`folderId`),
  ADD KEY `idx_tlxvyeelynubqvcgszmcxtrwoqmkxydrrqxg` (`folderId`),
  ADD KEY `idx_mrtwrkeuxagvvulspqzrvpwdlgmtkhtfkyrd` (`volumeId`),
  ADD KEY `fk_bejibnvdvypvniifakbzodhnqdzvkregahsw` (`uploaderId`);

--
-- Indexes for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_nwakhcetrwluibcvtfkvtncnokcelqmsngyz` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `assettransforms`
--
ALTER TABLE `assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_gidtvcrxuexssnsduvjdjiyzvjoigdfcifpz` (`name`),
  ADD KEY `idx_hsdrtzrstgmepzurlglqntfhnekmokslzidl` (`handle`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wzjcjlbdhfseqefyemgqtjmcogqnrtjemxpv` (`groupId`),
  ADD KEY `fk_erznpwqkwaewpninpdkshtstjrxozllrfgnx` (`parentId`);

--
-- Indexes for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ixjbmlxxugaposdxqjnuvyjeijusqcrfhwdi` (`name`),
  ADD KEY `idx_xpzezhrnfstlrpjnjyqaeqwqmgctcnxoekgn` (`handle`),
  ADD KEY `idx_ttruavqrwcmttsppdukmlryayunthlomjdgt` (`structureId`),
  ADD KEY `idx_zibmdatpdxlbxaoekxcnueiedihqafyaxhoc` (`fieldLayoutId`),
  ADD KEY `idx_gqbuddrxytksujwspfiouhuyavzepziszeyf` (`dateDeleted`);

--
-- Indexes for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_pwdyasemfhknkzuszdjnkwwdcbzkecshgdry` (`groupId`,`siteId`),
  ADD KEY `idx_flqfcvsqhyfpsrvkuksuxtxclkedyswwqevz` (`siteId`);

--
-- Indexes for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `idx_mkohfdgqhqwasyxyddhevpkdkcudmxqdksvp` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_wipnsqaqsqrwavfehlxnjeqtnitycrkkjbkq` (`siteId`),
  ADD KEY `fk_jaqkcvulilyiwoxsdogmstyjklgowprophle` (`userId`);

--
-- Indexes for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  ADD KEY `idx_wikdnxpefwbjflagnpcqjabnhlozqxnatjct` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `fk_wpyhjdcrvaupgtxzaqknzyuhfgpvqxpvepze` (`siteId`),
  ADD KEY `fk_ndvkzstamqzavmzgcdugjwbdddvcqbsbdvuh` (`fieldId`),
  ADD KEY `fk_qrwulicrchdxfptlmpbofrpsvizwwtbbynyf` (`userId`);

--
-- Indexes for table `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_xgyjhvyvffrcdpusnzjdkknblytgsbxmqazu` (`elementId`,`siteId`),
  ADD KEY `idx_fnhovoojopqojtwuqwarclfydmahknzzxlwz` (`siteId`),
  ADD KEY `idx_kqlzmfhswjjqtajsswcynbvnsqrxgiqmxlxe` (`title`);

--
-- Indexes for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ilqsbxffslgbwruvggoyursrtlowdlzbcmlj` (`userId`);

--
-- Indexes for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_hgvvjjwxtrlukenkrqehosgpaajdtdalumjn` (`key`,`fingerprint`);

--
-- Indexes for table `drafts`
--
ALTER TABLE `drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_hswheuqiisizbrbyelugbjvoolzuvbyprujr` (`creatorId`,`provisional`),
  ADD KEY `idx_cikzkotbwpwgarbulxpweljtebbvorybkhey` (`saved`),
  ADD KEY `fk_bbaeweelajalbmihfjhmcgmryfnvpumvtaup` (`sourceId`);

--
-- Indexes for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_llrxhehqssnusqlsxwtqihcabhocwkcfqder` (`type`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_blpsfvqsgqefmrzxgalvbuottvruyigkwlus` (`dateDeleted`),
  ADD KEY `idx_liaifylvhfbupdompvxvhcythcwztpvggybk` (`fieldLayoutId`),
  ADD KEY `idx_tutlqnvclehoulrjvrqmilhpgzlxjkpqilje` (`type`),
  ADD KEY `idx_euopjmivmvbfuvepzmcosfxphuhrmfcyzzai` (`enabled`),
  ADD KEY `idx_dswqrqjyhjtjosaaoeoxnopoisyfnywxxanf` (`archived`,`dateCreated`),
  ADD KEY `idx_vsfcldxiynbjsposbontgtdmutulagtwfimr` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  ADD KEY `fk_qlyddanubtxehyzpfywbsglkwaqowideyypu` (`canonicalId`),
  ADD KEY `fk_sgorunqhitloxrmlufhvcjzwcvvrulumxkqo` (`draftId`),
  ADD KEY `fk_jncwvoufnikdevfpvwvgpzvlyggajodlzigj` (`revisionId`);

--
-- Indexes for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_ivyyixyqnztzzaxlwudwfixujpoghusknyjh` (`elementId`,`siteId`),
  ADD KEY `idx_fdipffgofoxdvyzaxeuykswiquyugcshrgqd` (`siteId`),
  ADD KEY `idx_ifbgtuakgssgnkvkhrhrsvudotffxuostvtv` (`slug`,`siteId`),
  ADD KEY `idx_hyiuglztkxlifjetvsbpfmfwhhrzbrpazzps` (`enabled`),
  ADD KEY `idx_wivbqaivvjmiwnokayjizfqvrgtepxympudj` (`uri`,`siteId`);

--
-- Indexes for table `entries`
--
ALTER TABLE `entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lokrscvqovmllavxeedcjdiwntoalugeltnk` (`postDate`),
  ADD KEY `idx_defthmwgubhuzkjivwfvdyispazffwvghqpt` (`expiryDate`),
  ADD KEY `idx_vyzkuyzwkgkyfnwiotbqiqxslhbhyahbinje` (`authorId`),
  ADD KEY `idx_pkzanfvqmxmvllomgwonldnszpvbsogdrobc` (`sectionId`),
  ADD KEY `idx_uphgoqkaeomjpadfcvfqwxdauetwqdhoymxo` (`typeId`),
  ADD KEY `fk_kojsvocrrymfwrpendwzurdxhuzwlywkwkmg` (`parentId`);

--
-- Indexes for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lgouboutvpgbtmqaqedpylebvbhqtnnvqeby` (`name`,`sectionId`),
  ADD KEY `idx_walzmcxrpkgazmrdcuhhfinwqqxwjewozlpc` (`handle`,`sectionId`),
  ADD KEY `idx_mfjdjlpybxgafakzoggklqwpcshkywcepfgw` (`sectionId`),
  ADD KEY `idx_kuduaishggnspiaeaqoqkgucqglsgqyqhepg` (`fieldLayoutId`),
  ADD KEY `idx_jxepdptgldvatkmtarwzkawwklthhgqeqkry` (`dateDeleted`);

--
-- Indexes for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_dkyiplikhwyxxorofjsqwshgyfnnectotamw` (`name`),
  ADD KEY `idx_rkujoqmhcewhcsncamsolblybjuetbnrptbt` (`dateDeleted`,`name`);

--
-- Indexes for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_tcgfxhjjotigcwzlqqbunsordcwxodplrlzn` (`layoutId`,`fieldId`),
  ADD KEY `idx_uhgambhxxefqgvjwwjaaolcvpushownvkjtw` (`sortOrder`),
  ADD KEY `idx_lxtuvvvkafqynlogdldmgdgfosuishwvpdjr` (`tabId`),
  ADD KEY `idx_riuegsvdcpzzzwdepnzrpxzqrisagbkfduoc` (`fieldId`);

--
-- Indexes for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_efbxigxqkmuksasqdowkngllidhedvheawde` (`dateDeleted`),
  ADD KEY `idx_awwilojmicxanatnovwnrtsetsbsljlapxrq` (`type`);

--
-- Indexes for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lvhnswmnlcmfpafynmoqfjjwpdmbkaqjjypv` (`sortOrder`),
  ADD KEY `idx_ydadjkxyiggvwxgvwuxidoxplsuhtnfsaxzf` (`layoutId`);

--
-- Indexes for table `fields`
--
ALTER TABLE `fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_utiziaifbttseakpvzgpemncktpsbmmjztxm` (`handle`,`context`),
  ADD KEY `idx_hswnevwytfuwdtjstthsveiuvsbarzrdnehk` (`groupId`),
  ADD KEY `idx_idvuyuisljxtlpilrxgwuzsarvguspjmctod` (`context`);

--
-- Indexes for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lifoqljskmqkbadfwknhfsxuapurdongiqtp` (`name`),
  ADD KEY `idx_lhxzojhkmdisqrcbajswlumutcpwdiakjmmr` (`handle`),
  ADD KEY `idx_yffwnnevjnxxaamcphbwtvmyvgzvxtuxswij` (`fieldLayoutId`),
  ADD KEY `idx_schuswemjxcvzxfdsnykicobcwufnkbbslev` (`sortOrder`);

--
-- Indexes for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_bksdxkcebimszyxjmmqnttmxuzchtupzudgo` (`accessToken`),
  ADD UNIQUE KEY `idx_fhredjubojhmldbwnstyzqofglqwddvekzty` (`name`),
  ADD KEY `fk_kqwzgivpccxijyahgwujumieqsvujceyxngo` (`schemaId`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_wgykprtlxmszdawyybappzuahmrkddrkbtpr` (`ownerId`),
  ADD KEY `idx_dubirquumykbgupdmmhugsgelwypovfnrhin` (`fieldId`),
  ADD KEY `idx_rsbkcdysdtnogioalfzfcrficqubmkydgnis` (`typeId`),
  ADD KEY `idx_gbcvrfgvjpyirkzkmgtfxfjsivyjuyjdqcnr` (`sortOrder`);

--
-- Indexes for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_vacouldicannbafuwkyjvhvifdohuqqxtmut` (`name`,`fieldId`),
  ADD KEY `idx_bhtkocebqutoxsumkgyphtnvdjroifxzkvep` (`handle`,`fieldId`),
  ADD KEY `idx_csoifttiivlkfpfwghqjfalcuwgmpnzofvep` (`fieldId`),
  ADD KEY `idx_saxqjbplutmqoictpilqfownhqrrhjwjbynn` (`fieldLayoutId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_kwxuteoychqoyydatjpkuqdujfmjrztjqxda` (`track`,`name`);

--
-- Indexes for table `plugins`
--
ALTER TABLE `plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_dixupzrpbtjetbzifvxwsuuhiuzgrmctyjuh` (`handle`);

--
-- Indexes for table `projectconfig`
--
ALTER TABLE `projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indexes for table `queue`
--
ALTER TABLE `queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jxgnfxzpdohtfrjgrogtdnwdqznhlxiqzvys` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `idx_hpxfehkxrjoymkvsrjftylkhofdhlfcsfbwu` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `relations`
--
ALTER TABLE `relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_plifdduqnldatbejdvgohfgkaijyurntsnly` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `idx_cmuwaukscsooueeexxtvqeiybgbopzfgxkhf` (`sourceId`),
  ADD KEY `idx_vtpndrhoeuyxskomidshqlrlhdmlhzferxyy` (`targetId`),
  ADD KEY `idx_smbcdipinwlocbozkthlhuacndlrqraxzsnb` (`sourceSiteId`);

--
-- Indexes for table `resourcepaths`
--
ALTER TABLE `resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `revisions`
--
ALTER TABLE `revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_fyiqgzefscefwnifvgisrmlkvasvmxntlvqh` (`sourceId`,`num`),
  ADD KEY `fk_bavyfxxrhotgizljpvlxzqpfkpsmkoxwofzj` (`creatorId`);

--
-- Indexes for table `searchindex`
--
ALTER TABLE `searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `searchindex` ADD FULLTEXT KEY `idx_kuuelpkuovyhzllhtiorpwekjzpidfhoycqe` (`keywords`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jyuyzuipvoocvynptdpdfyjdxybhyzunnnya` (`handle`),
  ADD KEY `idx_szhosxtjaolamoyfiefiyapnhepbbtmtfvyc` (`name`),
  ADD KEY `idx_ckmphksusgmpwuiplrrcyndtcyvlvoptjxwg` (`structureId`),
  ADD KEY `idx_mpecxaezrsisuqhpxunwpykoykywgzrwtvox` (`dateDeleted`);

--
-- Indexes for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_wgvbisdggeasqwopsfhgjwfngelggtotsryb` (`sectionId`,`siteId`),
  ADD KEY `idx_tpnmjjztebsmtywcpymyelagvomkskhvayyc` (`siteId`);

--
-- Indexes for table `sequences`
--
ALTER TABLE `sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rroxkjudohradyizpfmyjzkfqcnqjcistlik` (`uid`),
  ADD KEY `idx_skkovxzckizxstgczvhueyzzcviowmqepddh` (`token`),
  ADD KEY `idx_kouitgxqlspergjtjsdwbwiitmnpjeocddga` (`dateUpdated`),
  ADD KEY `idx_rrhivvcoylcdrnkibhpccraqzhihamtmjbpo` (`userId`);

--
-- Indexes for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_iqnufdleyejszdwtznxelrzxqtgongcleauj` (`userId`,`message`);

--
-- Indexes for table `sitegroups`
--
ALTER TABLE `sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_xchudoaomgyxdtnvwnzggyoxmalypjwppkiv` (`name`);

--
-- Indexes for table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_zlyaymvraouyreooqptnzwoknympbklbftsk` (`dateDeleted`),
  ADD KEY `idx_apbjbgwfpfcybrhujacpcpkfslfcmssydqza` (`handle`),
  ADD KEY `idx_bcxbateqsdyevsrqexhnpsspowdfwvznlafa` (`sortOrder`),
  ADD KEY `fk_fjvyjayelctbfaqlignfyjynlhgbozsxfdyb` (`groupId`);

--
-- Indexes for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_kkjffikpxwxuamjifletyisaykljgfyknsiy` (`structureId`,`elementId`),
  ADD KEY `idx_fapyylwkldyzfpvswooyoitsdrgvxuphmnhz` (`root`),
  ADD KEY `idx_svpveogqefjttozbmlpzxihlfelihcmfpctt` (`lft`),
  ADD KEY `idx_uhxkrexrbuhsqqrgncicmxthugpwriricdll` (`rgt`),
  ADD KEY `idx_epuotarvkzfmjdpvjqmotojnhnsukxkqgify` (`level`),
  ADD KEY `idx_mqpzjesrpxsqcajncohinuhfmmpgyfrmrohm` (`elementId`);

--
-- Indexes for table `structures`
--
ALTER TABLE `structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_urfevvbeyfudsqjtyrxdzvvfgmtvbhpocynf` (`dateDeleted`);

--
-- Indexes for table `systemmessages`
--
ALTER TABLE `systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_dkuchbznckgydacqzqfucaogkgluvbpdhbtd` (`key`,`language`),
  ADD KEY `idx_rsahyfqqdegcapvpouiuloclpgomrrbmkqgj` (`language`);

--
-- Indexes for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fegtfhkfpgrfmulgzygzloahlhdvczgoizll` (`name`),
  ADD KEY `idx_kyudbtpkeaovvnvdgefrehccwfxpwsaluzwt` (`handle`),
  ADD KEY `idx_fdvmshhqlsxayguybcybseyhdhuhaxtqfweq` (`dateDeleted`),
  ADD KEY `fk_fknuaitixnsojwmikvwqutzgxbmvnmillzlp` (`fieldLayoutId`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_okwratnerlwzdfpohmqskfovltmvdkayodgb` (`groupId`);

--
-- Indexes for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_waznrendgmrjtkkzxsvnqimzosehsppwtxke` (`cacheId`),
  ADD KEY `idx_evawssuduokunmoyieboidtkrrmzxbjqwllk` (`elementId`);

--
-- Indexes for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_jbevifmfqjptfgyzexfeyqlexchlvrcmjiou` (`cacheId`),
  ADD KEY `idx_zjayobrtxoylosakrutxlkbqrhssqelxhzcq` (`type`);

--
-- Indexes for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ffrorslnmydbrgiiclttfoecjrbzzjtdnpzx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `idx_cqzekowebikcuyygpjhtptzubiovhxyslkdr` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `idx_wrzoammkjbajfhbxkrvoyqsdqlfiapqpqnrv` (`siteId`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_tivoqrkuzqhyagzypxfhwzrlpvjjouatcunf` (`token`),
  ADD KEY `idx_pyhkqskurmhxuqzeavyujqtcnnxlzwgwbdha` (`expiryDate`);

--
-- Indexes for table `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ebaejzfeumztvvklsofvghrjydocpwfdtdaf` (`handle`),
  ADD KEY `idx_misvpsqbqkulnitopmhtkiznjizfvadcaebj` (`name`);

--
-- Indexes for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_cnbgmmrexoglsmrfdnecddlpoqebrjdwiakr` (`groupId`,`userId`),
  ADD KEY `idx_rafogwhjlbnhpytfdqymwtxfxvgvdrwobdip` (`userId`);

--
-- Indexes for table `userpermissions`
--
ALTER TABLE `userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_unwoiqxrhyzblpbfpfbbeuvqaikqttplwold` (`name`);

--
-- Indexes for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_sujpzxoteoulqucnabraxfikylksibygqhsw` (`permissionId`,`groupId`),
  ADD KEY `idx_nxydhwwuqybhzpgqusdgkuquvlpvvpantxrf` (`groupId`);

--
-- Indexes for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_dtrhmiesznqsvusbdnvllttaiqwtwdtrymmb` (`permissionId`,`userId`),
  ADD KEY `idx_isapkgnrvclalcpmrjocatnucgeilnjhizat` (`userId`);

--
-- Indexes for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_fjkigidghrymjgzeykxjdzizryerdpaoesqt` (`uid`),
  ADD KEY `idx_avaclkornaabndhklyyjevmvphcfivcfsmpp` (`verificationCode`),
  ADD KEY `idx_stxznpixhxnmryphefthlyuhvfnpcedqnfml` (`email`),
  ADD KEY `idx_oaisjdhpzihppltkxnqnvslgylcbjaowbjjh` (`username`),
  ADD KEY `fk_eqalhjdftpvmhqjoeimehqzhrgsmmquhjdip` (`photoId`);

--
-- Indexes for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_libouqnzbhnlfhaqltbptfadttvdsftyzetc` (`name`,`parentId`,`volumeId`),
  ADD KEY `idx_umnwekgpvuifgfphwxoawuzgcbhokpevmstd` (`parentId`),
  ADD KEY `idx_ppdeempbsgbgytxwvbfxrarcfftzhvvobeoj` (`volumeId`);

--
-- Indexes for table `volumes`
--
ALTER TABLE `volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pfyopdnhdodqkzkycoqffwxgvlttnhwctjme` (`name`),
  ADD KEY `idx_pjqikwkltnwcrdwegakpdmvdawivesxwfakw` (`handle`),
  ADD KEY `idx_rspawxvjnxqwulatrisybxwwsybnbwywdrly` (`fieldLayoutId`),
  ADD KEY `idx_lukylnjsyaszprjxlkrwgohxebjemtadjuih` (`dateDeleted`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_ohascwtjhfztcovnfvnyzpniumpfqpwbjolb` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransformindex`
--
ALTER TABLE `assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assettransforms`
--
ALTER TABLE `assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups`
--
ALTER TABLE `categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content`
--
ALTER TABLE `content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deprecationerrors`
--
ALTER TABLE `deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `drafts`
--
ALTER TABLE `drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elementindexsettings`
--
ALTER TABLE `elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `elements_sites`
--
ALTER TABLE `elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `entrytypes`
--
ALTER TABLE `entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fieldgroups`
--
ALTER TABLE `fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fieldlayouts`
--
ALTER TABLE `fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fields`
--
ALTER TABLE `fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `globalsets`
--
ALTER TABLE `globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gqlschemas`
--
ALTER TABLE `gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gqltokens`
--
ALTER TABLE `gqltokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=192;

--
-- AUTO_INCREMENT for table `plugins`
--
ALTER TABLE `plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `queue`
--
ALTER TABLE `queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `relations`
--
ALTER TABLE `relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `revisions`
--
ALTER TABLE `revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections_sites`
--
ALTER TABLE `sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitegroups`
--
ALTER TABLE `sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `structureelements`
--
ALTER TABLE `structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `structures`
--
ALTER TABLE `structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `systemmessages`
--
ALTER TABLE `systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taggroups`
--
ALTER TABLE `taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templatecaches`
--
ALTER TABLE `templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions`
--
ALTER TABLE `userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userpreferences`
--
ALTER TABLE `userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `volumefolders`
--
ALTER TABLE `volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `volumes`
--
ALTER TABLE `volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `fk_vcpffiogmgqzluttiydaebppljzkkcslguwd` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_zxohtcyvrptepgcnttqwmaaxihglyumcecwv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assetindexdata`
--
ALTER TABLE `assetindexdata`
  ADD CONSTRAINT `fk_qjrhpfgszsjuvlrfvdttoltrtxcuqzktvhjy` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `assets`
--
ALTER TABLE `assets`
  ADD CONSTRAINT `fk_bejibnvdvypvniifakbzodhnqdzvkregahsw` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_koiqaoekdvxpygfrmoztsbqapjrhdgllrykl` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tsmbrtkpgpsbxgxnvtxdkihjcqqynmrmwwmu` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ziijlmbkamxtnsdaiwboiduxyvzjpkbbgoqw` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_erznpwqkwaewpninpdkshtstjrxozllrfgnx` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_jutnhnohexmscdmvvodjqbxdjqjfvwipusle` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ttmairkuyeiuhheivfpuuhxzjiucfmhgifbo` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categorygroups`
--
ALTER TABLE `categorygroups`
  ADD CONSTRAINT `fk_tiscwaacakwfoaycqbqjsrxyhcnljtjtohje` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_xowirzbkekknrdrpcqxeobyuiheyejyjdouv` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categorygroups_sites`
--
ALTER TABLE `categorygroups_sites`
  ADD CONSTRAINT `fk_hdignquoiqhknfvjuczztzgowziwykwxvadb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_keietsessmexcbfspbecrrvxsvbznrznxkmk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `changedattributes`
--
ALTER TABLE `changedattributes`
  ADD CONSTRAINT `fk_hnbfvvmzpptnqbepltqtfuaohvsnagpgmfsy` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_jaqkcvulilyiwoxsdogmstyjklgowprophle` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_wipnsqaqsqrwavfehlxnjeqtnitycrkkjbkq` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `changedfields`
--
ALTER TABLE `changedfields`
  ADD CONSTRAINT `fk_ndvkzstamqzavmzgcdugjwbdddvcqbsbdvuh` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_qiswzdiwhutoqhsernaywirvufcvecsougtb` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_qrwulicrchdxfptlmpbofrpsvizwwtbbynyf` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_wpyhjdcrvaupgtxzaqknzyuhfgpvqxpvepze` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `content`
--
ALTER TABLE `content`
  ADD CONSTRAINT `fk_fpikxgiqrqmpmjszugdivmnoxdbyngnakscv` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_iqhkpngtkdqoheintfangcoonykpxlyhnpig` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `craftidtokens`
--
ALTER TABLE `craftidtokens`
  ADD CONSTRAINT `fk_ilqsbxffslgbwruvggoyursrtlowdlzbcmlj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `drafts`
--
ALTER TABLE `drafts`
  ADD CONSTRAINT `fk_bbaeweelajalbmihfjhmcgmryfnvpumvtaup` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_rwdphqvcbmbpitstkngykvplqecrmurtmupf` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `elements`
--
ALTER TABLE `elements`
  ADD CONSTRAINT `fk_jncwvoufnikdevfpvwvgpzvlyggajodlzigj` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_qlyddanubtxehyzpfywbsglkwaqowideyypu` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_sgorunqhitloxrmlufhvcjzwcvvrulumxkqo` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ugcevvxaoiphofkjwphztgdzkiyywdweolib` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `elements_sites`
--
ALTER TABLE `elements_sites`
  ADD CONSTRAINT `fk_fdrebqsmjgrgtbbluulrwpneihtrglbkenut` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rimafuvniottprbmlnlboeplaifadbzfyycn` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entries`
--
ALTER TABLE `entries`
  ADD CONSTRAINT `fk_kojsvocrrymfwrpendwzurdxhuzwlywkwkmg` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_slukygfpowzxheepkmtnutvgboroovwgglih` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tpijfdprfaiedssllpkbtttgxnraqdpywthq` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_wgxexmgsudrdulcfpeuqsleugcigvrnuousi` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xoplzyrihtbrcjugeamiafrwctoimwvcuabu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `entrytypes`
--
ALTER TABLE `entrytypes`
  ADD CONSTRAINT `fk_jqreicfiidgbwbekutfxhcssawpnfbwvsmae` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_nuyvyzsaxqrrzddqzbmfrndrbjgerbnllhgb` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayoutfields`
--
ALTER TABLE `fieldlayoutfields`
  ADD CONSTRAINT `fk_baqxtxtsunhjfhgkhofncgasqnuphxgjbxcc` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_bfdtjuhhxyfcjgiteflimbktnfhtlhewayve` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_kqddiexhykygypsufmmhqtnkqwloprpohshj` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fieldlayouttabs`
--
ALTER TABLE `fieldlayouttabs`
  ADD CONSTRAINT `fk_varfpqyjmyhnmzwourmayvphidribiovsrjk` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fields`
--
ALTER TABLE `fields`
  ADD CONSTRAINT `fk_doyjwrdzulmmsntwhqxktxkejdhgxdtkrlel` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `globalsets`
--
ALTER TABLE `globalsets`
  ADD CONSTRAINT `fk_ahpeqjavnuriqhqumwnjcilttegrbnbwqjyu` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_zgiutceovckoljanfjvwjbwjsbcvsklnzueu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gqltokens`
--
ALTER TABLE `gqltokens`
  ADD CONSTRAINT `fk_kqwzgivpccxijyahgwujumieqsvujceyxngo` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `matrixblocks`
--
ALTER TABLE `matrixblocks`
  ADD CONSTRAINT `fk_gbmddxxhmotmrqtivoligdyrytgtajykkldt` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_gwgoejeyejexegqibrkantaxhxeldpswknct` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sipwsjtukbbjmiotgrqvkigqouvphdvbmoqk` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_weaatoxyvqhhakbfbqpzbsmlttytzlbwdzli` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `matrixblocktypes`
--
ALTER TABLE `matrixblocktypes`
  ADD CONSTRAINT `fk_fjeelbmbjssuztcvwveohqgbpwsrynwwjdqi` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_iaymylwakgryddzhriutbjgmaeyjnaspjchz` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `relations`
--
ALTER TABLE `relations`
  ADD CONSTRAINT `fk_eprpjrgrbrwujapicuwroxjnwwixhftatmjj` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_jkuuirrfqnmkmfyvykapbpvxkrluqmgnvycd` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_ubwfsaaopknvflsrbbqvkmlnzpsmnuswcxnr` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_wsoktyiuchhnzymoyxgvtwuxakqfpihydbrm` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `revisions`
--
ALTER TABLE `revisions`
  ADD CONSTRAINT `fk_bavyfxxrhotgizljpvlxzqpfkpsmkoxwofzj` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_ivcxnmnrdotupfespugggwwhesczsckbhsfs` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `fk_mdmowlxismqlalqkbcexzrgkpffsazqjkxzu` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sections_sites`
--
ALTER TABLE `sections_sites`
  ADD CONSTRAINT `fk_buezomxgdayxwnywfmdvbjmphxhciwjqayzx` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kpedqcjmafwgiytqnzymceoqwryogzvtakmf` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `fk_dsgeyjxhtwvzypaoorrufzcertldkbvhxaws` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shunnedmessages`
--
ALTER TABLE `shunnedmessages`
  ADD CONSTRAINT `fk_sxkquwbkystabmozhsgmupfpmevdpofytvcx` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `fk_fjvyjayelctbfaqlignfyjynlhgbozsxfdyb` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `structureelements`
--
ALTER TABLE `structureelements`
  ADD CONSTRAINT `fk_kirrucfzhxdsnfjehevbezrxfrizerdnrlyp` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_qjvvrlultwghrzhnpjrydxfmybmyzawxbxgs` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `taggroups`
--
ALTER TABLE `taggroups`
  ADD CONSTRAINT `fk_fknuaitixnsojwmikvwqutzgxbmvnmillzlp` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `fk_nikbbqvyjeafbuemvmsrnancxhdwbzwjmbpt` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xkapmfwwywkgbfxpaycdjezyjuozcuwjczql` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecacheelements`
--
ALTER TABLE `templatecacheelements`
  ADD CONSTRAINT `fk_pkwjtyjqrqgnhsatcvmnukfdznviiimnkbsi` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_tdtwxnaunygsynpnasiguzvwfekesbhasdys` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecachequeries`
--
ALTER TABLE `templatecachequeries`
  ADD CONSTRAINT `fk_bwtocdzpahknthzebevldpwjfmibmjsniwsa` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `templatecaches`
--
ALTER TABLE `templatecaches`
  ADD CONSTRAINT `fk_giwmticnomjarocgifamxpgattcbkyxxkyqd` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usergroups_users`
--
ALTER TABLE `usergroups_users`
  ADD CONSTRAINT `fk_ixhjlvqtifzfddncfebybvqegcbdzrsrvpeo` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xlxxeylnolrturolrllvomnpnuefxkbbezbt` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_usergroups`
--
ALTER TABLE `userpermissions_usergroups`
  ADD CONSTRAINT `fk_rkgpouuwtahpigucodjkwtnrsgtqoszypdzd` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xidijdstwdosxzdvjmhepkzvntegrygxzxue` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpermissions_users`
--
ALTER TABLE `userpermissions_users`
  ADD CONSTRAINT `fk_rglzaquabyjkbnonfrsqpvtsnursyzwrpmnl` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_xkfktqynngdsixchzxivfuqlzxafcshcpmad` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `userpreferences`
--
ALTER TABLE `userpreferences`
  ADD CONSTRAINT `fk_quwjwzavmcvqmbkmvqfsymwwqxhifcnknryl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_eqalhjdftpvmhqjoeimehqzhrgsmmquhjdip` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_zielglcmuinwzozqfhzlaijrigypsrctwhkt` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumefolders`
--
ALTER TABLE `volumefolders`
  ADD CONSTRAINT `fk_ldwpotlacddmlfjsbfnrmcifzrmwaurlvfzy` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_thiuqbmzauyfimfowcamwecixrsshgrmmjny` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `volumes`
--
ALTER TABLE `volumes`
  ADD CONSTRAINT `fk_pdmgrevxuohzgjszcgluzrtqfwvgzqfnwrin` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `fk_qtodjgpjngszeizktwdfzyrvgtinhvxvwkcp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
