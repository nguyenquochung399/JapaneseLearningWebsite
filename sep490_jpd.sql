-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2022 at 08:35 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sep490_jpd`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_code`
--

CREATE TABLE `account_code` (
  `codeID` int(11) NOT NULL,
  `code` varchar(6) NOT NULL,
  `expiryDate` datetime NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `alphabet`
--

CREATE TABLE `alphabet` (
  `alphabetID` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `alphabet` varchar(255) NOT NULL,
  `pronounce` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `alphabet`
--

INSERT INTO `alphabet` (`alphabetID`, `type`, `alphabet`, `pronounce`) VALUES
(1, 'Hiragana', 'あ', 'a'),
(2, 'Hiragana', 'い', 'i'),
(3, 'Hiragana', 'う', 'u'),
(4, 'Hiragana', 'え', 'e'),
(5, 'Hiragana', 'お', 'o'),
(6, 'Hiragana', 'か', 'ka'),
(7, 'Hiragana', 'き', 'ki'),
(8, 'Hiragana', 'く', 'ku'),
(9, 'Hiragana', 'け', 'ke'),
(10, 'Hiragana', 'こ', 'ko'),
(11, 'Hiragana', 'さ', 'sa'),
(12, 'Hiragana', 'し', 'shi'),
(13, 'Katakana', 'ア', 'a'),
(14, 'Katakana', 'イ', 'i'),
(15, 'Katakana', 'ウ', 'u'),
(16, 'Katakana', 'エ', 'e'),
(17, 'Katakana', 'オ', 'o'),
(18, 'Katakana', 'カ', 'ka'),
(19, 'Katakana', 'キ', 'ki'),
(20, 'Katakana', 'ク', 'ku'),
(21, 'Katakana', 'ケ', 'ke'),
(22, 'Katakana', 'コ', 'ko'),
(23, 'Katakana', 'サ', 'sa'),
(24, 'Katakana', 'シ', 'shi');

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE `answer` (
  `AnswerID` int(11) NOT NULL,
  `QuestionID` int(11) NOT NULL,
  `Answer` varchar(255) NOT NULL,
  `isCorrect` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`AnswerID`, `QuestionID`, `Answer`, `isCorrect`) VALUES
(1, 1, 'がっこう', b'1'),
(2, 1, 'がくこう', b'0'),
(3, 1, 'かくこう', b'0'),
(4, 1, 'かっこう', b'0'),
(5, 2, 'こんばん', b'1'),
(6, 2, 'けさ', b'0'),
(7, 2, 'ゆうべ', b'0'),
(8, 2, 'いまばん', b'0'),
(9, 3, 'しんぶん', b'1'),
(10, 3, 'しんふん', b'0'),
(11, 3, 'じんぶん', b'0'),
(12, 3, 'じんふん', b'0'),
(13, 4, 'ごご', b'1'),
(14, 4, 'ごぜん', b'0'),
(15, 4, 'ごあと', b'0'),
(16, 4, 'ごこ', b'0'),
(17, 5, 'みせ', b'1'),
(18, 5, 'こえ', b'0'),
(19, 5, 'かみ', b'0'),
(20, 5, 'はな', b'0'),
(21, 6, 'ひとりで', b'1'),
(22, 6, 'いちひとで', b'0'),
(23, 6, 'いちにんで', b'0'),
(24, 6, 'いちじんで', b'0'),
(25, 7, 'みます', b'1'),
(26, 7, 'のみます', b'0'),
(27, 7, 'たべます', b'0'),
(28, 7, 'すいます', b'0'),
(29, 8, 'みず', b'1'),
(30, 8, 'か', b'0'),
(31, 8, 'こおり', b'0'),
(32, 8, 'うみ', b'0'),
(33, 9, 'たんじょうび', b'1'),
(34, 9, 'たんじょうひ', b'0'),
(35, 9, 'たんしょうにち', b'0'),
(36, 9, 'たんじょうにち', b'0'),
(37, 10, 'ごぜん', b'1'),
(38, 10, 'ごご', b'0'),
(39, 10, 'ごまえ', b'0'),
(40, 10, 'しょうまえ', b'0'),
(41, 11, 'おおきい', b'1'),
(42, 11, 'ちいさい', b'0'),
(43, 11, 'ちかい', b'0'),
(44, 11, 'おおい', b'0'),
(45, 12, 'しろい', b'1'),
(46, 12, 'くろい', b'0'),
(47, 12, 'あかい', b'0'),
(48, 12, 'あおい', b'0'),
(49, 13, 'にもつ', b'1'),
(50, 13, 'にぶつ', b'0'),
(51, 13, 'におの', b'0'),
(52, 13, 'につか', b'0'),
(53, 14, 'たべもの', b'1'),
(54, 14, 'たべもつ', b'0'),
(55, 14, 'たべぶつ', b'0'),
(56, 14, 'たへもの', b'0'),
(57, 15, 'みぎ', b'1'),
(58, 15, 'いし', b'0'),
(59, 15, 'ひだり', b'0'),
(60, 15, 'となり', b'0'),
(61, 16, 'ちかく', b'1'),
(62, 16, 'おおく', b'0'),
(63, 16, 'ちいさく', b'0'),
(64, 16, 'おおきく', b'0'),
(65, 17, 'うしろ', b'1'),
(66, 17, 'あとろ', b'0'),
(67, 17, 'ごろ', b'0'),
(68, 17, 'まえろ', b'0'),
(69, 18, 'てがみ', b'1'),
(70, 18, 'しゅかみ', b'0'),
(71, 18, 'でかみ', b'0'),
(72, 18, 'しゅがみ', b'0'),
(73, 19, 'いぬ', b'1'),
(74, 19, 'ねこ', b'0'),
(75, 19, 'か', b'0'),
(76, 19, 'ねずみ', b'0'),
(77, 20, 'なか', b'1'),
(78, 20, 'ちゅう', b'0'),
(79, 20, 'よる', b'0'),
(80, 20, 'なま', b'0'),
(105, 21, 'おに', b'1'),
(106, 21, 'あね', b'0'),
(107, 21, 'おね', b'0'),
(108, 21, 'あに', b'0'),
(109, 22, 'いっしゅうかん', b'1'),
(110, 22, 'いちしゅうかん', b'0'),
(111, 22, 'いっしゅかん', b'0'),
(112, 22, 'いちしゅかん', b'0'),
(113, 23, 'なつ', b'1'),
(114, 23, 'はる', b'0'),
(115, 23, 'あき', b'0'),
(116, 23, 'ふゆ', b'0'),
(117, 24, 'あね', b'1'),
(118, 24, 'いもうと', b'0'),
(119, 24, 'おとうと', b'0'),
(120, 24, 'あに', b'0'),
(121, 25, 'さむく', b'1'),
(122, 25, 'つめたく', b'0'),
(123, 25, 'あつく', b'0'),
(124, 25, 'うすく', b'0'),
(125, 26, 'てんき', b'1'),
(126, 26, 'げんき', b'0'),
(127, 26, 'でんき', b'0'),
(128, 26, 'ねんき', b'0'),
(129, 27, 'すこし', b'1'),
(130, 27, 'すし', b'0'),
(131, 27, 'こし', b'0'),
(132, 27, 'おし', b'0'),
(133, 28, 'おねえさん', b'1'),
(134, 28, ' おにいさん', b'0'),
(135, 28, 'おいもとさん', b'0'),
(136, 28, 'おとうさん', b'0'),
(137, 29, 'おおい', b'1'),
(138, 29, 'おいしい', b'0'),
(139, 29, ' たのしい', b'0'),
(140, 29, 'ちかい', b'0'),
(141, 30, 'おにいさん', b'1'),
(142, 30, 'おにさん', b'0'),
(143, 30, 'おあにさん', b'0'),
(144, 30, 'おあにいさん', b'0'),
(145, 31, 'りょこう', b'1'),
(146, 31, 'りょうこ', b'0'),
(147, 31, 'りょこ', b'0'),
(148, 31, 'りょうこう', b'0'),
(149, 32, 'けいかく', b'1'),
(150, 32, 'けいが', b'0'),
(151, 32, 'けえかく', b'0'),
(152, 32, 'けえがく', b'0'),
(153, 33, 'いけん', b'1'),
(154, 33, 'いみ', b'0'),
(155, 33, 'いけ', b'0'),
(156, 33, 'いし', b'0'),
(157, 34, 'いって', b'1'),
(158, 34, 'たって', b'0'),
(159, 34, 'うって', b'0'),
(160, 34, 'きって', b'0'),
(161, 35, 'せんげつ', b'1'),
(162, 35, 'せんけつ', b'0'),
(163, 35, 'さぎげつ', b'0'),
(164, 35, 'さきげつ', b'0'),
(165, 36, 'かいました', b'1'),
(166, 36, 'こいました', b'0'),
(167, 36, 'ばいました', b'0'),
(168, 36, 'もらいました', b'0'),
(169, 37, 'まいにち', b'1'),
(170, 37, 'まいひ', b'0'),
(171, 37, 'まいび', b'0'),
(172, 37, 'まいじつ', b'0'),
(173, 38, 'べんきょう', b'1'),
(174, 38, 'べんき', b'0'),
(175, 38, 'べんきょ', b'0'),
(176, 38, 'はんきょう', b'0'),
(177, 39, 'つかって', b'1'),
(178, 39, 'もって', b'0'),
(179, 39, 'つくって', b'0'),
(180, 39, 'しって', b'0'),
(181, 40, 'みち', b'1'),
(182, 40, 'いち', b'0'),
(183, 40, 'どう', b'0'),
(184, 40, 'とおり', b'0'),
(225, 41, 'はん', b'1'),
(226, 41, 'かん', b'0'),
(227, 41, 'ほん', b'0'),
(228, 41, 'ばん', b'0'),
(229, 42, 'あつまって', b'1'),
(230, 42, 'あまって', b'0'),
(231, 42, 'とまって', b'0'),
(232, 42, 'つまって', b'0'),
(233, 43, 'しゅっぱつ', b'1'),
(234, 43, 'しゅぱつ', b'0'),
(235, 43, 'しっぱつ', b'0'),
(236, 43, 'しはつ', b'0'),
(237, 44, 'しゅっぱつ', b'1'),
(238, 44, 'しゅぱつ', b'0'),
(239, 44, 'しっぱつ', b'0'),
(240, 44, 'しはつ', b'0'),
(241, 45, 'かきました', b'1'),
(242, 45, 'つきました', b'0'),
(243, 45, 'できました', b'0'),
(244, 45, 'ときました', b'0'),
(245, 46, 'しゃちょう', b'1'),
(246, 46, 'さしょう', b'0'),
(247, 46, 'けいしゃ', b'0'),
(248, 46, 'しゃじょう', b'0'),
(249, 47, 'いえ', b'1'),
(250, 47, 'か', b'0'),
(251, 47, 'や', b'0'),
(252, 47, 'あち', b'0'),
(253, 48, 'すんで', b'1'),
(254, 48, 'つんで', b'0'),
(255, 48, 'そんで', b'0'),
(256, 48, 'うんで', b'0'),
(257, 49, 'ちいさい', b'1'),
(258, 49, 'こさい', b'0'),
(259, 49, 'すこしい', b'0'),
(260, 49, 'ちいさ', b'0'),
(261, 50, 'せかい', b'1'),
(262, 50, 'せがい', b'0'),
(263, 50, 'せか', b'0'),
(264, 50, 'せいかい', b'0'),
(265, 51, 'らいしゅう', b'1'),
(266, 51, 'せんしゅう', b'0'),
(267, 51, 'こんしゅう', b'0'),
(268, 51, 'きしゅう', b'0'),
(269, 52, 'すいようび', b'1'),
(270, 52, 'すようび', b'0'),
(271, 52, 'みずようび', b'0'),
(272, 52, 'すいよび', b'0'),
(273, 53, 'さくぶん', b'1'),
(274, 53, 'そくぶん', b'0'),
(275, 53, 'きぶん', b'0'),
(276, 53, 'ろんぶん', b'0'),
(277, 54, 'だして', b'1'),
(278, 54, 'でして', b'0'),
(279, 54, 'でて', b'0'),
(280, 54, 'かして', b'0'),
(281, 55, 'えいご', b'1'),
(282, 55, 'ええご', b'0'),
(283, 55, 'えいごう', b'0'),
(284, 55, 'えいこう', b'0'),
(285, 56, 'てがみ', b'1'),
(286, 56, 'しゅかみ', b'0'),
(287, 56, 'てかみ', b'0'),
(288, 56, 'でがみ', b'0'),
(289, 57, 'かく', b'1'),
(290, 57, 'はく', b'0'),
(291, 57, 'おく', b'0'),
(292, 57, 'がく', b'0'),
(293, 58, 'へた', b'1'),
(294, 58, 'したて', b'0'),
(295, 58, 'したで', b'0'),
(296, 58, 'べた', b'0'),
(297, 59, 'ひ', b'1'),
(298, 59, 'び', b'0'),
(299, 59, 'とき', b'0'),
(300, 59, 'にち', b'0'),
(301, 60, 'おんがく', b'1'),
(302, 60, 'おんかく', b'0'),
(303, 60, 'おとがく', b'0'),
(304, 60, 'おとかく', b'0'),
(305, 61, 'はれる', b'1'),
(306, 61, 'ばれる', b'0'),
(307, 61, 'てれる', b'0'),
(308, 61, 'なれる', b'0'),
(309, 62, 'いっぱん', b'1'),
(310, 62, 'いっせん', b'0'),
(311, 62, 'いつせん', b'0'),
(312, 62, 'いっそう', b'0'),
(313, 63, 'くだもの', b'1'),
(314, 63, 'けだもの', b'0'),
(315, 63, 'かぶつ', b'0'),
(316, 63, 'かもの', b'0'),
(317, 64, 'たたかって', b'1'),
(318, 64, 'かたかって', b'0'),
(319, 64, 'かかたって', b'0'),
(320, 64, 'たかたって', b'0'),
(321, 65, 'こくさいかいぎ', b'1'),
(322, 65, 'こくさいかい', b'0'),
(323, 65, 'こくせかいに', b'0'),
(324, 65, 'こくせいかいぎ', b'0'),
(325, 66, 'せいじけいざい', b'1'),
(326, 66, 'せいちけいざい', b'0'),
(327, 66, 'せいちけいさい', b'0'),
(328, 66, 'せいじけいさい', b'0'),
(329, 67, 'まけない', b'1'),
(330, 67, 'なさけない', b'0'),
(331, 67, 'なまけない', b'0'),
(332, 67, 'もけない', b'0'),
(333, 68, 'げんりょう', b'1'),
(334, 68, 'ひりょう', b'0'),
(335, 68, 'ねんりょう', b'0'),
(336, 68, 'こうりょう', b'0'),
(337, 69, 'なげすて', b'1'),
(338, 69, 'なげつて', b'0'),
(339, 69, 'まげすて', b'0'),
(340, 69, 'まげつて', b'0'),
(341, 70, 'すませて', b'1'),
(342, 70, 'からませて', b'0'),
(343, 70, 'おわませて', b'0'),
(344, 70, 'さませて', b'0'),
(345, 71, 'きょうりょく', b'1'),
(346, 71, 'きゅうりょく', b'0'),
(347, 71, 'こうりょく', b'0'),
(348, 71, 'こうりゃく', b'0'),
(349, 72, 'てつだって', b'1'),
(350, 72, 'たすけって', b'0'),
(351, 72, 'ことつかって', b'0'),
(352, 72, 'つたえって', b'0'),
(353, 73, 'こまって', b'1'),
(354, 73, 'くまって', b'0'),
(355, 73, 'よわって', b'0'),
(356, 73, 'まいって', b'0'),
(357, 74, 'びじゅつかん', b'1'),
(358, 74, 'ぶじゅつかん', b'0'),
(359, 74, 'ぎじゅつかん', b'0'),
(360, 74, 'しゅじゅつかん', b'0'),
(361, 75, 'くうこう', b'1'),
(362, 75, 'こうきょう', b'0'),
(363, 75, 'こうこう', b'0'),
(364, 75, 'くうきょう', b'0'),
(365, 76, 'てら', b'1'),
(366, 76, 'じ', b'0'),
(367, 76, 'に', b'0'),
(368, 76, 'ち', b'0'),
(369, 77, 'そなえて', b'1'),
(370, 77, 'そろえて', b'0'),
(371, 77, 'むかえて', b'0'),
(372, 77, 'おさえて', b'0'),
(373, 78, 'よぼう', b'1'),
(374, 78, 'ようぼう', b'0'),
(375, 78, 'ゆぼう', b'0'),
(376, 78, 'ゆうぼう', b'0'),
(377, 79, 'かして', b'1'),
(378, 79, 'きして', b'0'),
(379, 79, 'けして', b'0'),
(380, 79, 'さして', b'0'),
(381, 80, 'うちがわ', b'1'),
(382, 80, 'そとがわ', b'0'),
(383, 80, 'ないがわ', b'0'),
(384, 80, 'うしがわ', b'0'),
(385, 81, 'じこ', b'1'),
(386, 81, 'じこう', b'0'),
(387, 81, 'じっこう', b'0'),
(388, 81, 'じご', b'0'),
(389, 82, 'ぞうか', b'1'),
(390, 82, 'じょうか', b'0'),
(391, 82, 'しょうか', b'0'),
(392, 82, 'じょか', b'0'),
(393, 83, 'ほうふ', b'1'),
(394, 83, 'ほうふく', b'0'),
(395, 83, 'ゆうふく', b'0'),
(396, 83, 'ゆよく', b'0'),
(397, 84, 'めぐまれて', b'1'),
(398, 84, 'ふかまれて', b'0'),
(399, 84, 'とまれて', b'0'),
(400, 84, 'かまれて', b'0'),
(401, 85, 'いっぱん', b'1'),
(402, 85, 'いっばん', b'0'),
(403, 85, 'いちはん', b'0'),
(404, 85, 'いちばん', b'0'),
(405, 86, 'はんばい', b'1'),
(406, 86, 'はんうり', b'0'),
(407, 86, 'はばい', b'0'),
(408, 86, 'はんぱい', b'0'),
(409, 87, 'ねこ', b'1'),
(410, 87, 'いぬ', b'0'),
(411, 87, 'さる', b'0'),
(412, 87, 'ぶた', b'0'),
(413, 88, 'せなか', b'1'),
(414, 88, 'けいなか', b'0'),
(415, 88, 'せちゅう', b'0'),
(416, 88, 'ぜなか', b'0'),
(417, 89, 'ごうとう', b'1'),
(418, 89, 'ごうどう', b'0'),
(419, 89, 'ごとう', b'0'),
(420, 89, 'きょうどう', b'0'),
(421, 90, 'けん', b'1'),
(422, 90, 'ど', b'0'),
(423, 90, 'かい', b'0'),
(424, 90, 'こ', b'0'),
(425, 91, 'びょうにん', b'1'),
(426, 91, 'びょうじん', b'0'),
(427, 91, 'びょういん', b'0'),
(428, 91, 'びょうしん', b'0'),
(429, 92, 'あんせい', b'1'),
(430, 92, 'あいせい', b'0'),
(431, 92, 'あんぜい', b'0'),
(432, 92, 'あんぜん', b'0'),
(433, 93, 'ねて', b'1'),
(434, 93, 'にて', b'0'),
(435, 93, 'あいて', b'0'),
(436, 93, 'みて', b'0'),
(437, 94, '犯罪', b'1'),
(438, 94, '判在', b'0'),
(439, 94, '犯在', b'0'),
(440, 94, '判罪', b'0'),
(441, 95, '安心', b'1'),
(442, 95, '安信', b'0'),
(443, 95, '案信', b'0'),
(444, 95, '案心', b'0'),
(445, 96, '暮せない', b'1'),
(446, 96, '暗せない', b'0'),
(447, 96, '活せない', b'0'),
(448, 96, '生せない', b'0'),
(449, 97, '周辺', b'1'),
(450, 97, '週辺', b'0'),
(451, 97, '衆辺', b'0'),
(452, 97, '集辺', b'0'),
(453, 98, '住民', b'1'),
(454, 98, '重民', b'0'),
(455, 98, '自由民', b'0'),
(456, 98, '主民', b'0'),
(457, 99, 'けいき', b'1'),
(458, 99, 'きょうき', b'0'),
(459, 99, 'けえき', b'0'),
(460, 99, 'きょき', b'0'),
(461, 100, 'せいふ', b'1'),
(462, 100, 'せふ', b'0'),
(463, 100, 'せえふ', b'0'),
(464, 100, 'しょうふ', b'0'),
(505, 111, '才能', b'1'),
(506, 111, '済能', b'0'),
(507, 111, '催能', b'0'),
(508, 111, '再能', b'0'),
(509, 112, '最低', b'1'),
(510, 112, '災難', b'0'),
(511, 112, '最終', b'0'),
(512, 112, '最後', b'0'),
(513, 113, 'こうりょ', b'1'),
(514, 113, 'こうりょう', b'0'),
(515, 113, 'こりょ', b'0'),
(516, 113, 'こりょう', b'0'),
(517, 114, 'だいどころ', b'1'),
(518, 114, 'たいところ', b'0'),
(519, 114, 'だいところ', b'0'),
(520, 114, 'たいどころ', b'0'),
(521, 115, 'てふくろ', b'1'),
(522, 115, 'しゅたい', b'0'),
(523, 115, 'てぶくろ', b'0'),
(524, 115, 'しゅだい', b'0'),
(525, 116, 'ゆか', b'1'),
(526, 116, 'とこ', b'0'),
(527, 116, 'ろうか', b'0'),
(528, 116, 'ゆうか', b'0'),
(529, 117, 'すいてき', b'1'),
(530, 117, 'すうてき', b'0'),
(531, 117, 'すてき', b'0'),
(532, 117, 'してき', b'0'),
(533, 118, '水産', b'1'),
(534, 118, '推産', b'0'),
(535, 118, '乗算', b'0'),
(536, 118, '推算', b'0'),
(537, 119, '資源', b'1'),
(538, 119, '子源', b'0'),
(539, 119, '史源', b'0'),
(540, 119, '市源', b'0'),
(541, 120, '守る', b'1'),
(542, 120, '防る', b'0'),
(543, 120, '保る', b'0'),
(544, 120, '衛る', b'0'),
(545, 121, '公表', b'1'),
(546, 121, '講表', b'0'),
(547, 121, '講評', b'0'),
(548, 121, '高表', b'0'),
(549, 122, 'ようそ', b'1'),
(550, 122, 'よそ', b'0'),
(551, 122, 'よおそ', b'0'),
(552, 122, 'ようそう', b'0'),
(553, 123, 'こうりょ', b'1'),
(554, 123, 'こうりょう', b'0'),
(555, 123, 'こりょ', b'0'),
(556, 123, 'こりょう', b'0'),
(557, 124, 'しんちょう', b'1'),
(558, 124, 'まんしょう', b'0'),
(559, 124, 'しんしょう', b'0'),
(560, 124, 'まんちょう', b'0'),
(561, 125, 'ふせげる', b'1'),
(562, 125, 'かかげる', b'0'),
(563, 125, 'さまたげる', b'0'),
(564, 125, 'ささげる', b'0'),
(565, 126, '孝行', b'1'),
(566, 126, '考行', b'0'),
(567, 126, '好考', b'0'),
(568, 126, '孝考', b'0'),
(569, 127, '息子', b'1'),
(570, 127, '子息', b'0'),
(571, 127, '男子', b'0'),
(572, 127, '娘', b'0'),
(573, 128, '贈り物', b'1'),
(574, 128, '送物', b'0'),
(575, 128, '送者', b'0'),
(576, 128, '贈答', b'0'),
(577, 129, '香水', b'1'),
(578, 129, '硬水', b'0'),
(579, 129, '好水', b'0'),
(580, 129, '口水', b'0'),
(581, 130, '喜ばせた', b'1'),
(582, 130, '好ばせた', b'0'),
(583, 130, '楽ばせた', b'0'),
(584, 130, '善ばせた', b'0'),
(585, 131, 'で', b'1'),
(586, 131, 'の', b'0'),
(587, 131, 'を', b'0'),
(588, 131, 'か', b'0'),
(589, 132, 'の', b'1'),
(590, 132, 'は', b'0'),
(591, 132, 'が', b'0'),
(592, 132, 'を', b'0'),
(593, 133, 'どれ', b'1'),
(594, 133, 'もう', b'0'),
(595, 133, 'どこ', b'0'),
(596, 133, 'まだ', b'0'),
(597, 134, 'かいて', b'1'),
(598, 134, 'かいた', b'0'),
(599, 134, 'かき', b'0'),
(600, 134, 'かく', b'0'),
(601, 135, 'が', b'1'),
(602, 135, 'を', b'0'),
(603, 135, 'で', b'0'),
(604, 135, 'しか', b'0'),
(605, 136, 'ものですね', b'1'),
(606, 136, 'ところですね', b'0'),
(607, 136, 'とおりですね', b'0'),
(608, 136, 'べきですね', b'0'),
(609, 137, 'といえば', b'1'),
(610, 137, 'としては', b'0'),
(611, 137, 'のたびに', b'0'),
(612, 137, 'のことだから', b'0'),
(613, 138, 'にあたって', b'1'),
(614, 138, '最中に', b'0'),
(615, 138, '場合に', b'0'),
(616, 138, 'ものなら', b'0'),
(617, 139, 'ものの', b'1'),
(618, 139, 'ところの', b'0'),
(619, 139, 'ところを', b'0'),
(620, 139, 'ものを', b'0'),
(621, 140, 'ことだ', b'1'),
(622, 140, 'ことだろう', b'0'),
(623, 140, 'ことか', b'0'),
(624, 140, 'ことだから', b'0'),
(625, 141, 'から', b'1'),
(626, 141, 'しか', b'0'),
(627, 141, 'を', b'0'),
(628, 141, 'まで', b'0'),
(629, 142, 'まで', b'1'),
(630, 142, 'しか', b'0'),
(631, 142, 'だけ', b'0'),
(632, 142, 'ながら', b'0'),
(633, 143, 'あぶない', b'1'),
(634, 143, 'あぶなく', b'0'),
(635, 143, 'あぶなくて', b'0'),
(636, 143, 'あぶないです', b'0'),
(637, 144, 'より', b'1'),
(638, 144, 'には', b'0'),
(639, 144, 'まで', b'0'),
(640, 144, 'から', b'0'),
(641, 145, 'いかが', b'1'),
(642, 145, 'いくら', b'0'),
(643, 145, 'いくつ', b'0'),
(644, 145, 'いつも', b'0'),
(645, 146, 'を', b'1'),
(646, 146, 'で', b'0'),
(647, 146, 'の', b'0'),
(648, 146, 'が', b'0'),
(649, 147, 'が', b'1'),
(650, 147, 'と', b'0'),
(651, 147, 'や', b'0'),
(652, 147, 'で', b'0'),
(653, 148, 'もう', b'1'),
(654, 148, 'など', b'0'),
(655, 148, 'とても', b'0'),
(656, 148, 'また', b'0'),
(657, 149, 'が', b'1'),
(658, 149, 'も', b'0'),
(659, 149, 'から', b'0'),
(660, 149, 'から', b'0'),
(661, 150, 'から', b'1'),
(662, 150, 'ごろ', b'0'),
(663, 150, 'あと', b'0'),
(664, 150, 'まで', b'0'),
(665, 151, 'なん', b'1'),
(666, 151, 'どう', b'0'),
(667, 151, 'どの', b'0'),
(668, 151, 'なに', b'0'),
(669, 152, 'へ', b'1'),
(670, 152, 'は', b'0'),
(671, 152, 'と', b'0'),
(672, 152, 'が', b'0'),
(673, 153, 'やすいです', b'1'),
(674, 153, 'やすくです', b'0'),
(675, 153, 'やすくないです', b'0'),
(676, 153, 'やすいではありません', b'0'),
(677, 154, 'かた', b'1'),
(678, 154, 'ほう', b'0'),
(679, 154, 'さん', b'0'),
(680, 154, 'さま', b'0'),
(681, 155, 'と', b'1'),
(682, 155, 'や', b'0'),
(683, 155, 'か', b'0'),
(684, 155, 'わ', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `examplegrammar`
--

CREATE TABLE `examplegrammar` (
  `exampleID` int(11) NOT NULL,
  `grammarID` int(11) NOT NULL,
  `exJ` varchar(255) NOT NULL,
  `exV` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `examplegrammar`
--

INSERT INTO `examplegrammar` (`exampleID`, `grammarID`, `exJ`, `exV`) VALUES
(1, 1, '健康な体あっての人生です。', 'Cuộc sống phụ thuộc vào việc có một cơ thể khỏe mạnh.'),
(2, 1, 'お客様あっての仕事だから、言葉遣いに気を付けてください。', 'Hãy cẩn thận với ngôn ngữ bạn sử dụng với khách hàng bởi vì chăm sóc khách hàng là công việc của chúng ta.'),
(3, 2, '小説を書くことが楽しければこそ、40年も書き続けてきたのです。', 'Chính vì công việc viết tiểu thuyết là niềm vui nên tôi mới viết suốt 40 năm qua.'),
(4, 2, '親は子供のためを思えばこそ厳しく?るのだ。', 'Chính vì nghĩ cho con cái nên bố mẹ mới la mắng nghiêm khắc.'),
(5, 3, '先生であれ学生であれ、この規則には従わなければならない。', 'Cho dù bạn là giáo viên hay học sinh, bạn phải tuân thủ quy tắc này.'),
(6, 4, '年を取って、お金もなく、家族かぞくもいないとは心細こころぼそい限かぎりです。', 'Khi tôi già đi, không có tiền, không có gia đình, tôi cảm thấy cô đơn.'),
(7, 4, '従兄弟いとこの結婚式けっこんしきに出られないとは残念な限かぎりだ。', 'Tôi cảm thấy rất là tiếc nếu không thể xuất hiện trong đám cưới của anh họ.'),
(9, 5, '何度なんども手術しゅじゅつしたあげく、治なおらないと言われた。', 'Sau khi phẫu thuật nhiều lần thì được thông báo rằng bệnh không thể chữa khỏi.'),
(10, 5, '彼は酔よっ払ぱらって騒さわいだあげく、寝てしまった。', 'Sau một thời gian say rượu và làm ồn thì cuối cùng anh ấy cũng đã đi ngủ.'),
(11, 7, 'お金がないばかりに、今度こんどの旅行りょこうに行けなかった。', 'Tôi không thể đi du lịch lần tới vì tôi không có tiền.'),
(12, 7, '私が遅刻ちこくをしたばかりに皆みなに迷惑めいわくをかけてしまった。', 'Chỉ vì đến trễ,tôi đã làm phiền mọi người.'),
(13, 6, '緊張きんちょうのあまり、体が震ふるえた', 'Cơ thể run lên vì quá căng thẳng.'),
(14, 6, '心配しんぱいするあまり、母は寝込ねこんでしまった。', 'Vì quá lo lắng mà mẹ tôi đã ngủ thiếp đi.');

-- --------------------------------------------------------

--
-- Table structure for table `forum_comment`
--

CREATE TABLE `forum_comment` (
  `comment_id` int(9) NOT NULL,
  `post_id` int(9) NOT NULL,
  `comment_content` varchar(600) NOT NULL,
  `userID` int(11) NOT NULL,
  `comment_date` datetime NOT NULL,
  `comment_edit_date` datetime NOT NULL,
  `comment_status` varchar(10) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `forum_comment`
--

INSERT INTO `forum_comment` (`comment_id`, `post_id`, `comment_content`, `userID`, `comment_date`, `comment_edit_date`, `comment_status`) VALUES
(1, 8, 'nó còn phụ thuộc vào cách bạn làm món đó<br>nướng: まだ焼けてない<br>chiên: まだ揚げてない<br>còn gọi chung chung thì まだできてない<br>', 1, '2022-12-09 11:09:41', '2022-12-09 11:09:41', 'active'),
(2, 7, 'mình cũng mù viết, nhưng có thể chia sẻ cách học viết của mình như sau:<br>mình học bộ thủ + nghĩa<br>sau đó mình luyện viết theo các chữ hán giống nhau:<br>Ví dụ1:<br>義: con cừu bị ngã vì chính NGHĨA<br>儀 : người nhân nghĩa tuân thủ lễ NGHI<br>犠: con bò vì nghĩa mà HY sinh<br>議: nói lời có nghĩa trong hội NGHỊ<br>Ví dụ 2:<br>識: Nói: tri thức<br>織: Nối: tổ chức<br>職: Nghe: công việc<br>Rảnh là mình viết, có ngày mình viết dày đặc 4 5 trang giấy A4 mà vẫn hay quên :v<br>Bạn tham khảo<br>', 1, '2022-12-09 11:10:17', '2022-12-09 11:10:17', 'active'),
(3, 10, 'にえる<br>これはまだ煮えていない<br>', 2, '2022-12-09 11:11:10', '2022-12-09 11:11:10', 'active'),
(4, 9, 'Câu 心に傷みつけたい chẳng có nghĩa gì cả, chủ thớt viết sai chữ 傷. Câu đúng là 心に刻みつけたい。', 2, '2022-12-09 11:11:29', '2022-12-09 11:11:29', 'active'),
(5, 10, 'nó còn phụ thuộc vào cách bạn làm món đó<br>nướng: まだ焼けてない<br>chiên: まだ揚げてない<br>còn gọi chung chung thì まだできてない<br>', 3, '2022-12-09 11:13:55', '2022-12-09 11:13:55', 'active'),
(6, 9, 'Tại buổi diễn thuyết hòa bình ngày hôm nay, thị trưởng Hiroshima - ông Matsui Kazumi đã tuyên bố vũ khí hạt nhân là “Cái ác tuyệt đối’. Hi vọng Thủ tướng Abe và Đại sứ Mỹ tại Nhật ông Roos cũng khắc ghi điều này. Ở giai đoạn xuất phát trên danh nghĩa người tiếp nối, chúng tôi cũng sẽ khắc sâu điều này vào trong tim.<br>Bạn tham khảo ạ.<br>', 3, '2022-12-09 11:14:17', '2022-12-09 11:14:17', 'active'),
(7, 11, 'ai biết giúp đỡ mình với', 1, '2022-12-09 11:16:59', '2022-12-09 11:16:59', 'active'),
(8, 10, 'Mọi người giúp với', 1, '2022-12-09 11:28:00', '2022-12-09 11:28:00', 'disable'),
(9, 12, 'mệt gì đâu', 1, '2022-12-09 11:30:18', '2022-12-09 11:30:18', 'disable'),
(10, 13, 'Tâm trạng này xuất hiện là do em Trai mới nhắn: \"chị sắm đồ chưa, em mới mua cho chị cái ao khoác nè.\"<br>Mấy Bác sắm đồ tết chưa?', 1, '2022-12-09 11:37:17', '2022-12-09 11:37:17', 'disable'),
(11, 14, '3. Cần bao nhiêu tiền khi về thì có thể ổn định cuộc sống ban đầu được', 1, '2022-12-09 12:19:04', '2022-12-09 12:19:04', 'active'),
(12, 15, 'Ai giới thiệu cho em với', 1, '2022-12-09 13:41:48', '2022-12-09 13:41:48', 'active'),
(13, 14, 'Mọi người nghĩ sao', 1, '2022-12-09 13:42:38', '2022-12-09 13:42:38', 'disable'),
(16, 20, 'Câu này có nghĩa là chào buổi sáng', 1, '2022-12-18 00:49:55', '2022-12-18 00:50:03', 'active'),
(17, 20, 'Mình cần dịch gấp', 2, '2022-12-18 00:54:29', '2022-12-18 00:54:29', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `forum_post`
--

CREATE TABLE `forum_post` (
  `post_id` int(9) NOT NULL,
  `topic_id` int(9) NOT NULL,
  `post_title` varchar(150) NOT NULL,
  `post_content` varchar(600) NOT NULL,
  `userID` int(11) NOT NULL,
  `post_date` datetime NOT NULL,
  `post_edit_date` datetime NOT NULL,
  `post_status` varchar(10) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `forum_post`
--

INSERT INTO `forum_post` (`post_id`, `topic_id`, `post_title`, `post_content`, `userID`, `post_date`, `post_edit_date`, `post_status`) VALUES
(1, 5, 'Nguyện vọng lúc phỏng vấn', 'Trong lúc phỏng vấn thì mình nói với cty là mình muốn sodan lương cao hơn, hay là sau khi có naitei thì mình mới sodan các bạn nhỉ,cảm ơn các bạn ạ.', 3, '2022-12-09 11:03:40', '2022-12-09 11:03:40', 'active'),
(2, 5, 'Mức sống ở tokyo', 'Nếu ở tokyo mà mức lương 27 man .tiền nhà 5 man(bao gồm nhà, điện, nước ,ga), vậy mỗi tháng để lại dc khoảng bao nhiêu tiền,mình đang ở vùng nông thôn thì ăn uống mỗi tháng hết khoảng 3 man.có bạn nào sống ở tokyo , nhờ tư vấn giúp mình ạ.mình xin cảm ơn ạ.', 3, '2022-12-09 11:04:16', '2022-12-09 11:04:16', 'active'),
(3, 4, 'Văn hóa NB nói riêng và văn hóa tư bản nói chung!', 'Thấy bác ở dưới bảo Vin làm kiểu vắt kiệt sức theo đúng nghĩa đen và thành quả nhận lại thì cũng tương xứng.<br>Không nói điêu nhưng giai đoạn phát triển thần tốc của mấy thằng tư bản nó làm khiếp thật, làm ngày làm đêm làm đến điên đến dại nên nó mới có ngày hôm nay ấy chứ các bác nhỉ? Em thấy mấy bác làm nhiều thì sợ hãi các thứ nhưng mà có làm như vậy thì nó mới phát triển được, genz giờ không biế', 3, '2022-12-09 11:04:46', '2022-12-09 11:04:46', 'active'),
(4, 4, '柚 (Trái Thanh Yên)', 'Có bé em nhắn tin hỏi mình trái 柚 có được xem là biểu tượng may mắn ở Nhật không?<br>mọi người có biết về trái này không ạ?<br>', 3, '2022-12-09 11:05:17', '2022-12-09 11:05:17', 'active'),
(5, 3, 'TRUNG TÂM ĐI NHẬT UY TÍN', 'Em đang muốn đi sang Nhật, mọi người cho em hỏi trước đó mọi người sang có thông qua trung tâm nào không ạ. <br>Review giúp em với ạ. Trung tâm nào uy tín ạ, chứ bạn em đi Hàn gặp trung tâm nó làm ăn hời hợt cả năm chưa bay được :((((<br>', 2, '2022-12-09 11:06:43', '2022-12-09 11:06:43', 'active'),
(6, 3, 'chuyển trường senmon', 'mình đang học năm nhất senmon , mà giờ muốn học hết năm nhất rồi chuyển qua trường khác học , thì có được k nhỉ', 2, '2022-12-09 11:07:03', '2022-12-09 11:07:03', 'active'),
(7, 2, 'Viết chữ', 'Mn có cách nào học viết nhanh ko ạ. Trc giờ e toàn nhìn mặt chữ r đọc chứ ít viết lắm. <br>Nên giờ muốn viết để sau thi kiếm ít cái chứng chỉ cho tiện mà giờ viết đi viết lại k hiệu quả cho lắm toàn thiếu nét<br>', 2, '2022-12-09 11:07:31', '2022-12-09 11:07:31', 'active'),
(8, 2, '月末 hay 上旬', 'Cuối tháng thì dùng 月末 hay 上旬. 2 từ này khác nhau như nào ạ mn', 2, '2022-12-09 11:07:51', '2022-12-09 11:07:51', 'active'),
(9, 1, 'Dịch viết', 'Đoạn này câu cuối nên dịch như thế nào đây ạ =(((<br><br>広島市の松井一美市長は今日の平和宣言で、核兵器は「絶対悪」と呼びかける。安倍首相もルース駐日米大使も肝に銘じてほしい。私たちも伝承者としての出発点に当たり、心に傷みつけたい。<br>', 1, '2022-12-09 11:08:37', '2022-12-09 11:08:37', 'active'),
(10, 1, 'Chín', 'Từ chín trong Nấu chín đồ ăn hoặc đồ ăn này chưa chín thì dùng từ nào vậy ah?', 1, '2022-12-09 11:09:05', '2022-12-09 11:09:05', 'active'),
(11, 1, 'onegaiiiiii', 'tài chính 5 man, cần mua iphone 12 tại cửa hàng mà nó viết 1 yên thì nội dung chi tiết như thế nào vậy các bác, các bác giải thích rõ với nak', 1, '2022-12-09 11:16:28', '2022-12-09 11:16:28', 'disable'),
(12, 1, 'Hết VJ, giờ đến Bamboo cũng đổi chuyến bay', 'Mới nhận được tin bên Bamboo cũng đổi giờ bay của mình từ Hà Nội về Nha Trang, chuyển lên sớm hơn :((<br><br>Nếu ko có chuyến khác hợp lý hơn thì khả năng phải cancel, haizz, nghe tin mà nẫu thật sự :((', 1, '2022-12-09 11:29:50', '2022-12-09 11:29:50', 'disable'),
(13, 1, 'Đồ Tết', 'Mọi người sắm Tết sao rồi?<br><br>Còn nhớ ngày nhỏ năm nào cũng đòi mẹ sắm đồ Tết cho, gần tết là đòi cho bằng được 3 bộ mặc 3 mùng, thấy bạn bè dc sắm hơn 3 bộ cũng về khóc lóc nhây nhưa đòi sắm thêm cho bằng bạn bằng bè.<br>Giao thừa tới là rộn ràng cập rập mặc đồ mới để đi giao thừa ở Chùa với Ba với Bà.<br>Từ ngày tự sắm đồ cho bản thân thì không còn quan tâm tới đồ tết nữa, có nhiều năm liền cũng ko đi', 1, '2022-12-09 11:37:02', '2022-12-09 11:37:02', 'disable'),
(14, 1, 'Về VN sống', 'Khảo sát những ai có ý định về VN sống lâu dài chút nhé<br><br>1. Mọi người dự định về VN làm ở thành phố hay về ở gần bố mẹ<br>2. Ở VN mọi người có nhà hay đất chưa', 1, '2022-12-09 12:18:55', '2022-12-09 12:18:55', 'disable'),
(15, 6, 'Hỏi về công việc CNTT', 'Có bác nào giới thiệu em công việc CNTT ở Nhật Bản với', 1, '2022-12-09 13:28:31', '2022-12-09 13:28:31', 'active'),
(19, 1, 'Mọi người dịch giúp mình với', '広島市の松井一美市長は今日の平和宣言で、核兵器は「絶対悪」と呼びかける。安倍首相もルース駐日米大使も肝に銘じてほしい。私たちも伝承者としての出発点に当たり、心に傷みつけたい。<br>Câu này nghĩa là gì vậy', 1, '2022-12-18 00:38:55', '2022-12-18 00:42:02', 'active'),
(20, 2, 'Câu này nghĩa là gì', 'おはようございます', 2, '2022-12-18 00:48:15', '2022-12-18 00:48:15', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `forum_report_comment`
--

CREATE TABLE `forum_report_comment` (
  `report_comment_id` int(9) NOT NULL,
  `user_report_id` int(11) NOT NULL,
  `report_comment_reason` varchar(600) NOT NULL,
  `comment_id` int(9) NOT NULL,
  `report_comment_date` datetime NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `forum_report_comment`
--

INSERT INTO `forum_report_comment` (`report_comment_id`, `user_report_id`, `report_comment_reason`, `comment_id`, `report_comment_date`, `status`) VALUES
(4, 1, 'Không phù hợp', 17, '2022-12-18 00:55:11', 'disable');

-- --------------------------------------------------------

--
-- Table structure for table `forum_report_notification`
--

CREATE TABLE `forum_report_notification` (
  `report_notification_id` int(9) NOT NULL,
  `userID` int(11) NOT NULL,
  `report_notification_content` varchar(600) NOT NULL,
  `post_id` int(9) DEFAULT NULL,
  `comment_id` int(9) DEFAULT NULL,
  `report_notification_status` varchar(10) NOT NULL DEFAULT 'not read',
  `status` varchar(10) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `forum_report_notification`
--

INSERT INTO `forum_report_notification` (`report_notification_id`, `userID`, `report_notification_content`, `post_id`, `comment_id`, `report_notification_status`, `status`) VALUES
(1, 2, 'Có Bình Luận Mới', 8, NULL, 'not read', 'active'),
(2, 2, 'Có Bình Luận Mới', 7, NULL, 'not read', 'active'),
(3, 1, 'Có Bình Luận Mới', 10, NULL, 'read', 'active'),
(4, 1, 'Có Bình Luận Mới', 9, NULL, 'read', 'active'),
(5, 1, 'Có Bình Luận Mới', 10, NULL, 'read', 'active'),
(6, 1, 'Có Bình Luận Mới', 10, NULL, 'read', 'active'),
(7, 1, 'Có Bình Luận Mới', 9, NULL, 'read', 'active'),
(8, 1, 'Lý Do Xoá: Nội dung không phù hợp với chủ đề nên chúng tôi xin phép xoá bài đăng của bạn', 11, NULL, 'read', 'active'),
(9, 1, 'Lý Do Xoá: Nội dung không phù hợp với chủ đề nên chúng tôi xin phép xoá bài đăng của bạn', NULL, 7, 'read', 'active'),
(10, 1, 'Lý Do Xoá: Nội dung không phù hợp', 12, NULL, 'read', 'active'),
(11, 1, 'Lý Do Xoá: Nội dung không phù hợp', 13, NULL, 'read', 'active'),
(12, 1, 'Lý Do Xoá: Nội dung không phù hợp', NULL, 9, 'read', 'disable'),
(13, 2, 'Có Bình Luận Mới', 20, NULL, 'not read', 'active'),
(14, 1, 'Lý Do Xoá: Không phù hợp', 14, NULL, 'not read', 'active'),
(15, 1, 'Lý Do Xoá: Không phù hợp', NULL, 13, 'not read', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `forum_report_post`
--

CREATE TABLE `forum_report_post` (
  `report_post_id` int(9) NOT NULL,
  `user_report_id` int(11) NOT NULL,
  `report_post_reason` varchar(600) NOT NULL,
  `post_id` int(9) NOT NULL,
  `report_post_date` datetime NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `forum_report_post`
--

INSERT INTO `forum_report_post` (`report_post_id`, `user_report_id`, `report_post_reason`, `post_id`, `report_post_date`, `status`) VALUES
(5, 1, 'Không phù hợp', 20, '2022-12-18 00:54:58', 'disable');

-- --------------------------------------------------------

--
-- Table structure for table `forum_topic`
--

CREATE TABLE `forum_topic` (
  `topic_id` int(9) NOT NULL,
  `topic_name` varchar(150) NOT NULL,
  `topic_status` varchar(10) NOT NULL DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `forum_topic`
--

INSERT INTO `forum_topic` (`topic_id`, `topic_name`, `topic_status`) VALUES
(1, 'Dịch', 'active'),
(2, 'Học Tiếng Nhật', 'active'),
(3, 'Du Học Nhật Bản', 'active'),
(4, 'Văn Hoá Nhật Bản', 'active'),
(5, 'Góc Chia Sẻ', 'active'),
(6, 'CNTT', 'active'),
(7, 'Việc Làm Nhật Bản', 'disable'),
(9, 'Hán Tự', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `grammar`
--

CREATE TABLE `grammar` (
  `grammarID` int(11) NOT NULL,
  `levelID` int(11) NOT NULL,
  `structure` varchar(255) NOT NULL,
  `use` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `grammar`
--

INSERT INTO `grammar` (`grammarID`, `levelID`, `structure`, `use`) VALUES
(1, 1, 'N1 + あっての + N2', 'Bởi vì có …/Sự tồn tại…không thể thiếu…'),
(2, 1, 'Vば　+　こそ<br>Aい　ければ　+　こそ<br>N/na であれば　+　こそ', 'Chính vì…'),
(3, 1, 'N / na　+　であれ', 'Cho dù～cho dù…'),
(4, 1, 'Aい　+　限かぎりだ<br>na Adj な　+　限かぎりだ', 'Rất/cảm thấy rất…'),
(5, 2, 'Vた /N の　+　あげく<br>Vた /N の　+　あげくに<br>Vた /N の　+　あげく の N', 'Cuối cùng thì/Làm～nhưng cuối cùng…'),
(6, 2, 'Vる 　+　あまり<br>na Adj＋な　+　あまり<br>N＋の　 +　あまり', 'Quá'),
(7, 2, 'Aい/V(普)　+　ばかりに<br>na Adj+な　+　ばかりに<br>N + である　+　ばかりに', 'Chỉ vì…');

-- --------------------------------------------------------

--
-- Table structure for table `grammarhistory`
--

CREATE TABLE `grammarhistory` (
  `grammarID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `grammarHistoryStatus` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kanji`
--

CREATE TABLE `kanji` (
  `kanjiID` int(11) NOT NULL,
  `levelID` int(11) NOT NULL,
  `kanji` varchar(255) NOT NULL,
  `meaning` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kanji`
--

INSERT INTO `kanji` (`kanjiID`, `levelID`, `kanji`, `meaning`, `picture`) VALUES
(5, 1, '阿', 'A', 'upload\\a.png'),
(6, 1, '織', 'CHỨC', 'upload\\chức.png'),
(7, 1, '功', 'CÔNG', 'upload\\CÔNG.png'),
(8, 1, '堅', 'KIÊN', 'upload\\kiên.png'),
(9, 1, '奈', 'NẠI', 'upload\\nại.png'),
(10, 1, '裁', 'TÀI', 'upload\\tài.png'),
(11, 1, '升', 'THĂNG', 'upload\\thang.png'),
(12, 1, '徐', 'TỪ', 'upload\\từ.png'),
(13, 1, '菖', 'XƯƠNG', 'upload\\xương.png'),
(14, 1, '炊', 'XUY', 'upload\\xuy.png'),
(15, 2, '極', 'CỰC', 'upload\\cực.png'),
(16, 2, '導', 'ĐẠO', 'upload\\đạo.png'),
(17, 2, '賢', 'HIỀN', 'upload\\hiền.png'),
(18, 2, '枯', 'KHÔ', 'upload\\khô.png'),
(19, 2, '柔', 'NHU', 'upload\\nhu.png'),
(20, 2, '沸', 'PHÍ', 'upload\\phí.png'),
(21, 2, '均', 'QUÂN', 'upload\\quân.png'),
(22, 2, '掃', 'TẢO', 'upload\\tảo.png'),
(23, 2, '装', 'TRANG', 'upload\\trang.png'),
(24, 2, '伺', 'TÝ', 'upload\\tý.png'),
(25, 3, '共', 'CỘNG', 'upload\\cộng.png'),
(26, 3, '居', 'CƯ', 'upload\\cư.png'),
(27, 3, '易', 'DỊCH', 'upload\\dịch.png'),
(28, 3, '都', 'ĐÔ', 'upload\\đô.png'),
(29, 3, '回', 'HỒI', 'upload\\hồi.png'),
(30, 3, '初', 'SƠ', 'upload\\sơ.png'),
(31, 3, '散', 'TÁN', 'upload\\tán.png'),
(32, 3, '位', 'VỊ', 'upload\\vị.png'),
(33, 3, '泳', 'VỊNH', 'upload\\vịnh.png'),
(34, 3, '望', 'VỌNG', 'upload\\vọng.png'),
(35, 4, '不', 'BẤT', 'upload\\bất.png'),
(36, 4, '別', 'BIỆT', 'upload\\biệt.png'),
(37, 4, '真', 'CHÂN', 'upload\\chân.png'),
(38, 4, '正', 'CHÁNH', 'upload\\chánh.png'),
(39, 4, '界', 'GIỚI', 'upload\\giới.png'),
(40, 4, '漢', 'HÁN', 'upload\\hán.png'),
(41, 4, '会', 'HỘI', 'upload\\hội.png'),
(42, 4, '力', 'LỰC', 'upload\\lực.png'),
(43, 4, '風', 'PHONG', 'upload\\phong.png'),
(44, 4, '員', 'VIÊN', 'upload\\viên.png'),
(45, 5, '百', 'BÁCH', 'upload\\bách.png'),
(46, 5, '大', 'ĐẠI', 'upload\\đại.png'),
(47, 5, '校', 'GIÁO', 'upload\\giáo.png'),
(48, 5, '行', 'HÀNH', 'upload\\hành.png'),
(49, 5, '学', 'HỌC', 'upload\\học.png'),
(50, 5, '今', 'KIM', 'upload\\kim.png'),
(51, 5, '父', 'PHỤ', 'upload\\phụ.png'),
(52, 5, '天', 'THIÊN', 'upload\\thiên.png'),
(53, 5, '子', 'TỬ', 'upload\\tử.png'),
(54, 5, '聞', 'VĂN', 'upload\\văn.png');

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `levelID` int(11) NOT NULL,
  `levelName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`levelID`, `levelName`) VALUES
(1, 'N1'),
(2, 'N2'),
(3, 'N3'),
(4, 'N4'),
(5, 'N5');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `messageID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `chatContent` text NOT NULL,
  `time` datetime NOT NULL,
  `sessionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notificationID` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `details` varchar(6000) NOT NULL,
  `time` datetime NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notificationID`, `title`, `details`, `time`, `status`, `userID`) VALUES
(1, '[Hệ Thống] Thông báo mở website JPD', 'Website JPD chính thức được đưa vào hoạt động hôm nay! Người dùng bây giờ có thể truy cập vào hệ thống và sử dụng trang web của JPD.', '2022-12-09 13:45:41', 0, 3),
(2, '[Tính Năng] Thông báo mở tính năng Thi thử JLPT', 'Các đề thi thử của tất cả các cấp từ N5 đến N1 đã được cập nhật trên hệ thống của JPD. Người dùng đã có thể truy cập để sử dụng tính năng Thi thử ngay từ hôm nay.', '2022-12-09 13:47:06', 0, 3),
(3, '[Hệ Thống] Thông báo bảo trì hệ thống ngày 09/12/2022', 'Website JPD sẽ tạm thời ngưng hoạt động từ 7h ngày 09/12/2022 đến 12h ngày 09/12/2022. Người dùng xin hãy lưu ý và thoát khỏi hệ thống trước thời gian trên.', '2022-12-09 13:47:42', 0, 3),
(4, '[JLPT] Thông tin về kỳ thi JLPT Tháng 12 tại Việt Nam', '- Ngày thi: Chủ Nhật, ngày 04/12/2022\r\n\r\n- Thời gian vào phòng thi: Từ 8 giờ đến 8 giờ 30 phút\r\n\r\n- Cấp độ thi: N1 N2 N3 N4 N5\r\n\r\n- Phí mua hồ sơ: 30.000 đồng/bộ\r\n\r\n- Lệ  phí thi : N1-N2-N3: 550.000 đồng/thí sinh; N4-N5: 500.000 đồng/thí sinh\r\n\r\n- Hạn cuối mua và nộp hồ sơ đăng ký thi: Tùy vào từng khu vực thi mà có thể thay đổi nhah hay chậm mấy hôm\r\n\r\n- Địa điểm bán và nộp hồ sơ đăng ký thi: Hà Nội, Tp. HCM, Huế và Đà Nẵng.', '2022-12-09 13:49:19', 0, 3),
(5, '[JLPT] Thông tin về kỳ thi JLPT Tháng 12 tại Nhật Bản', '(Hiện tại đã đăng ký thi qua mạng trực tiếp được trên điện thoại không cần PC)\r\n\r\n- Ngày thi: Chủ Nhật, ngày 03/07/2022\r\n\r\n- Thời gian vào phòng thi: Từ 11h45 đến 12h30\r\n\r\n- Thời gian bắt đầu thi: 12 giờ 30 phút ( chú ý đến đúng giờ, nếu đến muộn bạn sẽ không được dự thi phần thi thứ 1, bạn vẫn có thể dự thi phần thi thứ 2 nhưng sẽ không được tính điểm nên bạn sẽ bị trượt)\r\n\r\n- Cấp độ thi: N1 N2 N3 N4 N5\r\n\r\n- Địa điểm thi: Được tổ chức ở tất cả 47 tỉnh thành của Nhật và ở nước ngoài . Điểm thi ở Nhật sẽ được ghi trên phiếu báo thi được gửi về địa chỉ nhà bạn sau khi đăng ký một thời gian.\r\n\r\n- Thời gian đăng ký thi: Đang cập nhật\r\n\r\n- Hình thức đăng ký thi: Đăng ký thi qua mạng (không đăng ký thi qua đường bưu điện)', '2022-12-09 13:54:54', 0, 3),
(6, '[Tính Năng] Thông báo mở tính năng Luyện Viết Hiragana', 'Tính năng Luyện Viết Hiragana đã có mặt trên hệ thống của JPD. Người dùng đã có thể truy cập để sử dụng tính năng Thi thử ngay từ hôm nay.', '2022-12-09 13:57:02', 0, 3),
(7, '[Hệ Thống] Thông báo bảo trì hệ thống ngày 19/12/2022', 'Website JPD sẽ tạm thời ngưng hoạt động từ 7h ngày 19/12/2022 đến 12h ngày 19/12/2022. Người dùng xin hãy lưu ý và thoát khỏi hệ thống trước thời gian trên.', '2022-12-09 13:57:33', 0, 3),
(8, '[Giải Trí] Học tiếng Nhật qua các câu nói truyền cảm hứng trong Doraemon', '「君が昼寝をしている間にも時間は流れ続ける。一秒待ってくれない。」\r\n\"Trong lúc cậu đang ngủ trưa, thời gian vẫn tiếp tục trôi. Một giây cũng không chờ cậu đâu.\" - Doraemon\r\n\r\n「一番いけないのは自分なんかだめだと思い込むことだよ。」\r\n\"Điều cấm kỵ nhất là việc nghĩ rằng bản thân sẽ không làm được.\" - Nobita\r\n\r\n「持々、理屈にあわないことするのが人間なのよ。」\r\n\"Thỉnh thoảng lại làm những điều vô lý mới đúng là con người.\" - Doraemon\r\n\r\n「人間の値打ちは中身だぞ。」\r\n\"Giá trị của con người nằm ở bên trong họ.\" - Doraemon', '2022-12-09 14:10:01', 0, 3),
(9, '[JLPT] Xem đáp án đề thi JLPT 12/2022 N1 N2 N3 N4 N5', 'https://camnangnhatban.com/ky-thi-jlpt/xem-dap-an-de-thi-jlpt-12-2022-n1-n2-n3-n4-n5-nhanh-chinh-xac-nhat.html', '2022-12-09 14:11:17', 0, 3),
(10, '[JLPT] Cách tính điểm thi năng lực tiếng Nhật JLPT N3', 'Tổng điểm 180\r\nĐiểm đỗ 95, điểm thành phần tối thiểu\r\n\r\nTừ vựng, chữ Hán, ngữ pháp: 19điểm\r\nĐọc hiểu: 19 điểm ( rất dễ liệt vì ý nào cũng na ná đúng )\r\nNghe hiểu: 19 điểm\r\nCó một chú ý là: Ngữ pháp gộp với đọc hiểu nhưng tính điểm lại cộng vào Moji, Goi, Bunpou ( gengo chishiki ), mà 1 câu ngữ pháp chỉ 1 điểm trong khi 1 câu đọc hiểu là 3 điểm với bài đọc ngắn và 4 điểm với các bài đọc trung, dài và tìm thông tin, vì vậy, làm đọc hiểu trước, hoặc chỉ bấm đúng 15 phút để làm ngữ pháp thôi nhé, nếu không sẽ không kịp giờ.', '2022-12-09 14:11:35', 0, 3),
(11, '[Hệ Thống] Thông báo bảo trì hệ thống ngày 27/12/2022', 'Website JPD sẽ tạm thời ngưng hoạt động từ 7h ngày 27/12/2022 đến 12h ngày 27/12/2022. Người dùng xin hãy lưu ý và thoát khỏi hệ thống trước thời gian trên.', '2022-12-09 14:12:47', 0, 3),
(12, '[Tính Năng] Thống báo mở tính năng Luyện nói tiếng Nhật', 'Thử độ chính xác của bạn khi phát âm tiếng Nhật với tính năng Luyện nói hoàn toàn mới trên JPD. Bạn có thể sử dụng tính năng này ngay từ hôm nay!', '2022-12-09 14:15:45', 0, 3),
(13, '[Giao Tiếp] 4 cách nói xin chào bằng tiếng Nhật', '1. Xin chào tiếng Nhật cơ bản.\r\n\"Konnichiwa\" - こんにちは  là câu chào tiếng Nhật phù hợp với đa số hoàn cảnh và mục đích giao tiếp. Có nghĩa là xin chào khi gặp nhau , cũng mang nghĩa là chào buổi chiều .Đây cũng là cách chào cơ bản nhất, thông dụng và dễ dùng nhất.\r\n\r\n2. Chào bằng tiếng Nhật qua điện thoại.\r\n\"Moshi Moshi\"  là cách chào tiêu chuẩn qua điện thoại. Bạn có thể sử dụng lời chào này cho dù bạn là người gọi hoặc người được gọi đến. Moshi Moshi sẽ thích hợp để sử dụng cho các cuộc trò chuyện điện thoại hơn là konnichiwa.\r\n\r\n3. Các câu chào tiếng Nhật tùy thời điểm.\r\n- おはようございます ohayogozaimasu : chào buổi sáng\r\nBạn cũng có thể rút ngắn lời chào buổi sáng của bạn  \"Ohayo\" khi nói chuyện với bạn bè và trong những hoàn cảnh giao tiếp thông thường. \r\n- こんばんは – konbanwa : chào buổi tối\r\nNhư một lời chúc buổi tối tốt lành, konbanwa là lời chào tiêu chuẩn để sử dụng trong suốt buổi tối. \r\n- さようなら-sayounara : chào tạm biệt\r\n-おやすみなさい-oyasuminasai : chúc ngủ ngon\r\nKhi nói chuyện với bạn bè thân thiết lâu năm , bạn cũng có thể nói \"Oyasumi\" \r\n\r\n4. Biến thể chào tiếng Nhật\r\n- \"ossu\" là một lời chào rất thân mật được sử dụng giữa những người bạn nam thân hoặc người thân gần gũi nam ở cùng độ tuổi. Cụm từ này thường không được sử dụng giữa những người bạn nữ hoặc giữa bạn bè khác giới tính.\r\n- Ở  Osaka, \"yaho\"cũng là một cách để nói xin chào với bạn bè. Nó thường được viết bằng katakana, một biến thể của biểu cảm. yahoo trong tiếng Anh. Yaho cũng được sử dụng như là một cách để nói chào thân thiện trong giới trẻ, đặc biệt là trẻ em gái.\r\n- \"saikin dō\" là một cách chào quen thuộc gix những người bạn, anh chị em thân thiết. Đây vừa là cách chào vừa là cách hỏi thăm nhẹ nhàng.\r\n- \"hisashiburi.\" là một cách chào hỏi khá thân thiện. Nó có nghĩa là \"lâu rồi không gặp\". Bạn thường sẽ sử dụng lời chào này khi gặp lại một người quen, bạn bè lâu năm không gặp.', '2022-12-09 14:17:54', 0, 3),
(14, '[Giao Tiếp] Các cách nói cảm ơn trong tiếng Nhật', '1. Arigatou あ り が と う\r\nĐây là hình thức cảm ơn tiếng Nhật phổ biến nhất. Nó có nghĩa thông thường là \"cảm ơn bạn\", một cách không quá tầm thường cũng không quá trang trọng. Bạn có thể sử dụng Arigatou cho một loạt các hoạt động xảy ra hằng ngày trong đời sống bình thường, nhưng bạn sẽ không sử dụng nó trong các trường hợp nhấn mạnh hay cần tỏ rõ đặc biệt về lòng biết ơn.\r\n\r\n2. Doumo ど う も\r\nMột từ cảm ơn tiếng Nhật hay được dùng khác, đó là Doumo. Nếu một người nào đó giữ cửa cho bạn hoặc giúp đỡ bạn cầm túi xách một cách thân thiện, bạn sẽ sử dụng Doumo (phát âm là \"Domo\"), điều đó có nghĩa đơn giản là \"Cảm ơn\". \r\n\r\n3. Doumo arigatou ど う も あ り が と う\r\nMột biến thể khác của từ Cảm ơn sử dụng cả hai từ arigatou và doumo. Doumo arigatou có nghĩa là \"Cảm ơn rất nhiều.\" Nó vẫn bình thường, nhưng cũng mạnh hơn Doumo trong việc bày tỏ lòng biết ơn. Bạn có thể sử dụng từ nàyví dụ trong trường hợp ai đó giúp bạn dọn giấy tờ trong phòng làm việc giúp bạn.\r\n\r\n4. Arigatou gozaimasu あ り が と う ご ざ い ま す\r\nNếu bạn đang ở trong một tình huống khá lịch sự (Ví dụ: bạn muốn cám ơn 1 người lớn tuổi hay bề trên, tiền bối), bạn nên sử dụng Arigatou gozaimasu hoặc Arigatou gozaimashita ( あ り が と う ご ざ い ま し た). Đây là một biến thể cao cấp hơn của Arigatou, mang tính lịch sự hơn và bày tỏ nhiều lòng biết ơn hơn.\r\n\r\n5.  Doumo arigatou gozaimasu ど う も あ り が と う ご ざ い ま す\r\nĐây là câu nói biểm hiện sự cảm ơn chân thành nhất và chính thức nhất. Bạn có thể thấy nó bao gồm cả 3 từ cơ bản: arigatou, doumo và gozaimasu. Từ cám ơn tiếng Nhật này mang ý nghĩa lịch sự và trang trọng nhất.', '2022-12-09 14:19:24', 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `QuestionID` int(11) NOT NULL,
  `Question` varchar(255) NOT NULL,
  `TestID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`QuestionID`, `Question`, `TestID`) VALUES
(1, '先週の金曜日学校のとしょかんでレポートを書きました。', 1),
(2, '今晩いっしょにビールを飲みませんか。', 1),
(3, '新聞を読みます。それから、CDを聞きます。', 1),
(4, '学校は午後一時五十分からです。', 1),
(5, 'あの店で辞書を買いました。', 1),
(6, '来月一人で京都へ行きますか。', 1),
(7, 'よる時々ビデオを見ます。', 1),
(8, 'ちょっと休みませんか。水を飲みましょう。', 1),
(9, '誕生日は何月何日ですか。', 1),
(10, 'ロサンゼルスは今午前十一時です。', 1),
(11, 'あなたのカメラは大きいですか。', 2),
(12, '白い花を買いました。', 2),
(13, '荷物を送ります。', 2),
(14, '日本の食べ物はおいしいです。', 2),
(15, '銀行の右に学校があります。', 2),
(16, '郵便局はスーパーの近くにです。', 2),
(17, '駅の前に白いビルがあります。そして駅の後ろに大きいデパートがあります。', 2),
(18, 'テーブルの上に手紙があります。', 2),
(19, '男の子と女の子の間に犬がいます。', 2),
(20, 'スーパーの中に花屋があります。', 2),
(21, '兄は会社員です。弟は大学生です。', 3),
(22, 'あの兄弟は一週間に二回サッカーをします。', 3),
(23, '春と秋とどちらがすきですか。', 3),
(24, '夏休みに姉と国へ帰ります。', 3),
(25, '今年の冬はあまり寒くなかったです。', 3),
(26, 'きのうの天気はあまりよくなかったです。', 3),
(27, 'アイスクリームを少し食べました。', 3),
(28, 'ワンさんのお姉さんは元気な人です。', 3),
(29, '東京はニューヨークより人が多いですか、少ないですか。', 3),
(30, 'マリアさんのお兄さんは一ヶ月に三回映画を見ます。', 3),
(31, '旅行の計画について、意見のある方はどんどん言ってください。', 4),
(32, '旅行の計画について、意見のある方はどんどん言ってください。', 4),
(33, '旅行の計画について、意見のある方はどんどん言ってください。', 4),
(34, '旅行の計画について、意見のある方はどんどん言ってください。', 4),
(35, '先月、コンピューターを買いました。毎日、こどもも勉強に使っています。', 4),
(36, '先月、コンピューターを買いました。毎日、こどもも勉強に使っています。', 4),
(37, '先月、コンピューターを買いました。毎日、こどもも勉強に使っています。', 4),
(38, '先月、コンピューターを買いました。毎日、こどもも勉強に使っています。', 4),
(39, '先月、コンピューターを買いました。毎日、こどもも勉強に使っています。', 4),
(40, '道がわからないので、いっしょうけんめい　住所と地図を見ながら大使館へ行きます。', 4),
(41, '6時半に　集まった、すぐ　出発したので、9時ごろには　みずうみに　書きました。', 5),
(42, '6時半に　集まった、すぐ　出発したので、9時ごろには　みずうみに　書きました。', 5),
(43, '6時半に　集まった、すぐ　出発したので、9時ごろには　みずうみに　書きました。', 5),
(44, '6時半に　集まった、すぐ　出発したので、9時ごろには　みずうみに　書きました。', 5),
(45, 'おじは　ガスの会社の　社長で、大きい家に　住んでいます。', 5),
(46, 'おじは　ガスの会社の　社長で、大きい家に　住んでいます。', 5),
(47, 'おじは　ガスの会社の　社長で、大きい家に　住んでいます。', 5),
(48, 'おじは　ガスの会社の　社長で、大きい家に　住んでいます。', 5),
(49, '山の　小さい町で、スキーの　世界大会が　開かれるそうです。', 5),
(50, '山の　小さい町で、スキーの　世界大会が　開かれるそうです。', 5),
(51, '来週 の　水曜日までに　作文を　書いて 出して ください。', 6),
(52, '来週 の　水曜日までに　作文を　書いて 出して ください。', 6),
(53, '来週 の　水曜日までに　作文を　書いて 出して ください。', 6),
(54, '来週 の　水曜日までに　作文を　書いて 出して ください。', 6),
(55, '来週 の　水曜日までに　作文を　書いて 出して ください。', 6),
(56, '来週 の　水曜日までに　作文を　書いて 出して ください。', 6),
(57, '来週 の　水曜日までに　作文を　書いて 出して ください。', 6),
(58, '来週 の　水曜日までに　作文を　書いて 出して ください。', 6),
(59, '休みの日は　音楽を　聞いたり、買い物に　行ったり、へやを　かたづけたりします。', 6),
(60, '休みの日は　音楽を　聞いたり、買い物に　行ったり、へやを　かたづけたりします。', 6),
(61, '週末は全国的に晴れるでしょう。', 7),
(62, 'これは日本で一般に売られている食品です。', 7),
(63, 'これはなんという果物ですか。', 7),
(64, '私たちのチームは強いチームと戦って勝ちました。', 7),
(65, '国際会議に出席する。', 7),
(66, '大学で政治経済を学ぶ。', 7),
(67, '寒さに負けないでがんばろう。', 7),
(68, '原料を輸入する。', 7),
(69, '車の窓からごみを投げ捨てないでください。', 7),
(70, '宿題を済ませてから、テレビを見ます。', 7),
(71, 'ご協力ありがとうございます。', 8),
(72, '手伝ってくれませんか。', 8),
(73, '日本語が分からなくて困っています。', 8),
(74, '美術館に絵を見に行きました。', 8),
(75, '空港は空の港です。', 8),
(76, '京都に金閣という有名なお寺があります。', 8),
(77, '地震に備えて色々なことをしています。', 8),
(78, 'インフルエンザを予防する。', 8),
(79, '消しゴムを貸してくれませんか。', 8),
(80, '危ないですから、黄色線の内側に下がってお待ちください。', 8),
(81, '交通事故は年々増加している。', 9),
(82, '交通事故は年々増加している。', 9),
(83, 'この国は豊富なしげんに恵まれている。', 9),
(84, 'この国は豊富なしげんに恵まれている。', 9),
(85, 'この商品は、会員の方には１時から、一般の方には３時から販売します。', 9),
(86, 'この商品は、会員の方には１時から、一般の方には３時から販売します。', 9),
(87, '猫の背中は丸い。', 9),
(88, '猫の背中は丸い。', 9),
(89, '先月だけで銀行強盗が件あった。', 9),
(90, '先月だけで銀行強盗が件あった。', 9),
(91, '病人は安静にして寝ていたので、すっかりよくなった。', 10),
(92, '病人は安静にして寝ていたので、すっかりよくなった。', 10),
(93, '病人は安静にして寝ていたので、すっかりよくなった。', 10),
(94, 'こんなにはんざいが多いとあんしんしてくらせない」としゅうへんのじゅうみんがうったえている。', 10),
(95, 'こんなにはんざいが多いとあんしんしてくらせない」としゅうへんのじゅうみんがうったえている。', 10),
(96, 'こんなにはんざいが多いとあんしんしてくらせない」としゅうへんのじゅうみんがうったえている。', 10),
(97, 'こんなにはんざいが多いとあんしんしてくらせない」としゅうへんのじゅうみんがうったえている。', 10),
(98, 'こんなにはんざいが多いとあんしんしてくらせない」としゅうへんのじゅうみんがうったえている。', 10),
(99, '景気が悪くなり続けているので、政府は経済を立て直すため、長期的な計画を示した。', 10),
(100, '景気が悪くなり続けているので、政府は経済を立て直すため、長期的な計画を示した。', 10),
(111, '頭の働きや、何かができる能力。', 11),
(112, 'あんな下品な話を人前でするなんて_____な人だ。', 11),
(113, '全くの要素を考慮して慎重に行動すれば、ほとんどの事故が防げるはずだ。', 11),
(114, '台所から出てきた母の手には、炊事用の手袋がはめられており、床の上に水滴がぽとぽと落ちていた。', 11),
(115, '台所から出てきた母の手には、炊事用の手袋がはめられており、床の上に水滴がぽとぽと落ちていた。', 11),
(116, '台所から出てきた母の手には、炊事用の手袋がはめられており、床の上に水滴がぽとぽと落ちていた。', 11),
(117, '台所から出てきた母の手には、炊事用の手袋がはめられており、床の上に水滴がぽとぽと落ちていた。', 11),
(118, '日本では、すいさんしげんをまもるために、最近はそだてるぎょぎょうをじゅうししている。', 11),
(119, '日本では、すいさんしげんをまもるために、最近はそだてるぎょぎょうをじゅうししている。', 11),
(120, '日本では、すいさんしげんをまもるために、最近はそだてるぎょぎょうをじゅうししている。', 11),
(121, '世の中の人に広く知らせること。', 12),
(122, '全くの要素を考慮して慎重に行動すれば、ほとんどの事故が防げるはずだ。', 12),
(123, '全くの要素を考慮して慎重に行動すれば、ほとんどの事故が防げるはずだ。', 12),
(124, '全くの要素を考慮して慎重に行動すれば、ほとんどの事故が防げるはずだ。', 12),
(125, '全くの要素を考慮して慎重に行動すれば、ほとんどの事故が防げるはずだ。', 12),
(126, '彼はこうこうむすこだから、母の日のおくりものにこうすいを買い、母をよろこばせた。', 12),
(127, '彼はこうこうむすこだから、母の日のおくりものにこうすいを買い、母をよろこばせた。', 12),
(128, '彼はこうこうむすこだから、母の日のおくりものにこうすいを買い、母をよろこばせた。', 12),
(129, '彼はこうこうむすこだから、母の日のおくりものにこうすいを買い、母をよろこばせた。', 12),
(130, '彼はこうこうむすこだから、母の日のおくりものにこうすいを買い、母をよろこばせた。', 12),
(131, 'その　さかなは　5匹（_____）2,500えんです。', 13),
(132, 'それでは、5級の　文法（_____）練習を　始めましょう。', 13),
(133, 'まいにち（_____）ぐらい　ねますか。', 13),
(134, 'これは　わたしの　かさですよ。なまえが（_____）あります。', 13),
(135, 'おばあさん（_____）「いってらっしゃい」　といいました。', 13),
(136, 'ただ１年間勉強しただけで、１級試験に合格したなんて、たいした（_____）。', 14),
(137, '「１１月３日は休日だそうだね。」「休日（_____）日本は祝祭日しゅくさいじつが多いとおもわないか。」', 14),
(138, '新入社員がうちに就職する（_____）、事務室を新しくした。', 14),
(139, '今週の宿題は量的に少ないという（_____）、とても難しい宿題なんですよ。', 14),
(140, '手紙によると、家族みんな健康だという。ありがたい（_____）。', 14),
(141, 'へやの　まど（_____）うみが　みえる。', 15),
(142, 'あんな　ところは　たぶん（_____）でしょう。', 15),
(143, 'おとうさんは　おにいさん（_____）せが　ひくいです。', 15),
(144, 'ビールを　もう　いっぱい（_____）ですか。', 15),
(145, 'ごぜん　ともだちと　いっしょに　まち（_____）でかけます。', 15),
(146, 'うるさいから、テレビの　おと（_____）ちいさく　してください。', 16),
(147, 'わたしは　たばこ（_____）すいたいです。', 16),
(148, 'さいふの　なかには（_____）1000えんしか　ありません。', 16),
(149, 'くるまが　ほしいです（_____）、かう　おかねが　ありません。', 16),
(150, 'よる、はを　みがいて（_____）ねます。', 16),
(151, 'わたしは（_____）でもたべます。きらいなものはありません。', 17),
(152, '１５ふんぐらいあるいてみぎ（_____）まがってください。', 17),
(153, 'このぼうしはきれいで、そして、（_____）。', 17),
(154, 'あの（_____）はりょうりがとてもじょうずです。', 17),
(155, 'ゆうべ、かいしゃのともだち（_____）のみにいきました。', 17);

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `ResultID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `TestID` int(11) NOT NULL,
  `timeBigin` datetime NOT NULL,
  `timeExpire` datetime NOT NULL,
  `Score` int(11) NOT NULL,
  `trueQuestion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `resultdetail`
--

CREATE TABLE `resultdetail` (
  `ResultDetailID` int(11) NOT NULL,
  `ResultID` int(11) NOT NULL,
  `QuestionID` int(11) NOT NULL,
  `Answer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `sessionID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `TagID` int(11) NOT NULL,
  `Desc` varchar(255) NOT NULL DEFAULT 'description of tags'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`TagID`, `Desc`) VALUES
(1, 'Kanji'),
(2, 'Grammar');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `TestID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `TagID` int(11) NOT NULL,
  `LevelID` int(11) NOT NULL,
  `Status` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`TestID`, `Name`, `TagID`, `LevelID`, `Status`) VALUES
(1, 'Test 1', 1, 5, b'1'),
(2, 'Test 2', 1, 5, b'1'),
(3, 'Test 3', 1, 5, b'1'),
(4, 'Test 1', 1, 4, b'1'),
(5, 'Test 2', 1, 4, b'1'),
(6, 'Test 3', 1, 4, b'1'),
(7, 'Test 1', 1, 3, b'1'),
(8, 'Test 2', 1, 3, b'1'),
(9, 'Test 1', 1, 2, b'1'),
(10, 'Test 2', 1, 2, b'1'),
(11, 'Test 1', 1, 1, b'1'),
(12, 'Test 2', 1, 1, b'1'),
(13, 'Test 1', 2, 1, b'1'),
(14, 'Test 1', 2, 2, b'1'),
(15, 'Test 1', 2, 3, b'1'),
(16, 'Test 1', 2, 4, b'1'),
(17, 'Test 1', 2, 5, b'1');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type`) VALUES
('Hiragana'),
('Katakana');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `email`, `password`, `username`, `phone`, `avatar`, `role`) VALUES
(1, 'user@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Quốc Hưng', '', 'images\\hung.jpg', 'Người dùng'),
(2, 'cm@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Thanh Tâm', '', 'images\\tam.jpg', 'Quản lí nội dung'),
(3, 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 'Mạnh Tân', '', 'images\\tan.jpg', 'Quản trị viên');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_code`
--
ALTER TABLE `account_code`
  ADD PRIMARY KEY (`codeID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `alphabet`
--
ALTER TABLE `alphabet`
  ADD PRIMARY KEY (`alphabetID`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`AnswerID`),
  ADD KEY `QuestionID` (`QuestionID`);

--
-- Indexes for table `examplegrammar`
--
ALTER TABLE `examplegrammar`
  ADD PRIMARY KEY (`exampleID`),
  ADD KEY `examplegrammar_ibfk_1` (`grammarID`);

--
-- Indexes for table `forum_comment`
--
ALTER TABLE `forum_comment`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `forum_comment_ibfk_1` (`userID`),
  ADD KEY `forum_comment_ibfk_2` (`post_id`);

--
-- Indexes for table `forum_post`
--
ALTER TABLE `forum_post`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `fk_topic_id` (`topic_id`),
  ADD KEY `fk_userID` (`userID`);

--
-- Indexes for table `forum_report_comment`
--
ALTER TABLE `forum_report_comment`
  ADD PRIMARY KEY (`report_comment_id`),
  ADD KEY `forum_report_comment_ibfk_1` (`comment_id`),
  ADD KEY `forum_report_comment_ibfk_2` (`user_report_id`);

--
-- Indexes for table `forum_report_notification`
--
ALTER TABLE `forum_report_notification`
  ADD PRIMARY KEY (`report_notification_id`),
  ADD KEY `userID` (`userID`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `comment_id` (`comment_id`);

--
-- Indexes for table `forum_report_post`
--
ALTER TABLE `forum_report_post`
  ADD PRIMARY KEY (`report_post_id`),
  ADD KEY `forum_report_post_ibfk_1` (`post_id`),
  ADD KEY `forum_report_post_ibfk_2` (`user_report_id`);

--
-- Indexes for table `forum_topic`
--
ALTER TABLE `forum_topic`
  ADD PRIMARY KEY (`topic_id`);

--
-- Indexes for table `grammar`
--
ALTER TABLE `grammar`
  ADD PRIMARY KEY (`grammarID`),
  ADD KEY `levelID` (`levelID`);

--
-- Indexes for table `grammarhistory`
--
ALTER TABLE `grammarhistory`
  ADD PRIMARY KEY (`grammarID`,`UserID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `kanji`
--
ALTER TABLE `kanji`
  ADD PRIMARY KEY (`kanjiID`),
  ADD KEY `levelID` (`levelID`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`levelID`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`messageID`),
  ADD KEY `sessionID_FK_1` (`sessionID`),
  ADD KEY `usernameMessage_FK_1` (`userID`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notificationID`),
  ADD KEY `userID_FK_1` (`userID`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`QuestionID`),
  ADD KEY `TestID` (`TestID`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`ResultID`),
  ADD KEY `TestID` (`TestID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `resultdetail`
--
ALTER TABLE `resultdetail`
  ADD PRIMARY KEY (`ResultDetailID`),
  ADD KEY `ResultID` (`ResultID`),
  ADD KEY `QuestionID` (`QuestionID`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`sessionID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`TagID`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`TestID`),
  ADD KEY `test_ibfk_1` (`LevelID`),
  ADD KEY `TagID` (`TagID`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_code`
--
ALTER TABLE `account_code`
  MODIFY `codeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `alphabet`
--
ALTER TABLE `alphabet`
  MODIFY `alphabetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `answer`
--
ALTER TABLE `answer`
  MODIFY `AnswerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=685;

--
-- AUTO_INCREMENT for table `examplegrammar`
--
ALTER TABLE `examplegrammar`
  MODIFY `exampleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `forum_comment`
--
ALTER TABLE `forum_comment`
  MODIFY `comment_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `forum_post`
--
ALTER TABLE `forum_post`
  MODIFY `post_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `forum_report_comment`
--
ALTER TABLE `forum_report_comment`
  MODIFY `report_comment_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `forum_report_notification`
--
ALTER TABLE `forum_report_notification`
  MODIFY `report_notification_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `forum_report_post`
--
ALTER TABLE `forum_report_post`
  MODIFY `report_post_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `forum_topic`
--
ALTER TABLE `forum_topic`
  MODIFY `topic_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `grammar`
--
ALTER TABLE `grammar`
  MODIFY `grammarID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kanji`
--
ALTER TABLE `kanji`
  MODIFY `kanjiID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `level`
--
ALTER TABLE `level`
  MODIFY `levelID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `messageID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notificationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `QuestionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `ResultID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resultdetail`
--
ALTER TABLE `resultdetail`
  MODIFY `ResultDetailID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `sessionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `TagID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `TestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_code`
--
ALTER TABLE `account_code`
  ADD CONSTRAINT `account_code_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `alphabet`
--
ALTER TABLE `alphabet`
  ADD CONSTRAINT `alphabet_ibfk_1` FOREIGN KEY (`type`) REFERENCES `type` (`type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`QuestionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `examplegrammar`
--
ALTER TABLE `examplegrammar`
  ADD CONSTRAINT `examplegrammar_ibfk_1` FOREIGN KEY (`grammarID`) REFERENCES `grammar` (`grammarID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `forum_comment`
--
ALTER TABLE `forum_comment`
  ADD CONSTRAINT `forum_comment_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `forum_comment_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `forum_post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `forum_post`
--
ALTER TABLE `forum_post`
  ADD CONSTRAINT `fk_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `forum_topic` (`topic_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_userID` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `forum_report_comment`
--
ALTER TABLE `forum_report_comment`
  ADD CONSTRAINT `forum_report_comment_ibfk_1` FOREIGN KEY (`comment_id`) REFERENCES `forum_comment` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `forum_report_comment_ibfk_2` FOREIGN KEY (`user_report_id`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `forum_report_notification`
--
ALTER TABLE `forum_report_notification`
  ADD CONSTRAINT `forum_report_notification_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `forum_report_notification_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `forum_post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `forum_report_notification_ibfk_3` FOREIGN KEY (`comment_id`) REFERENCES `forum_comment` (`comment_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `forum_report_post`
--
ALTER TABLE `forum_report_post`
  ADD CONSTRAINT `forum_report_post_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `forum_post` (`post_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `forum_report_post_ibfk_2` FOREIGN KEY (`user_report_id`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `grammar`
--
ALTER TABLE `grammar`
  ADD CONSTRAINT `grammar_ibfk_1` FOREIGN KEY (`levelID`) REFERENCES `level` (`levelID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `grammarhistory`
--
ALTER TABLE `grammarhistory`
  ADD CONSTRAINT `grammarhistory_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `grammarhistory_ibfk_2` FOREIGN KEY (`grammarID`) REFERENCES `grammar` (`grammarID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kanji`
--
ALTER TABLE `kanji`
  ADD CONSTRAINT `kanji_ibfk_1` FOREIGN KEY (`levelID`) REFERENCES `level` (`levelID`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `sessionID_FK_1` FOREIGN KEY (`sessionID`) REFERENCES `session` (`sessionID`),
  ADD CONSTRAINT `usernameMessage_FK_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `userID_FK_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`TestID`) REFERENCES `test` (`TestID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `result_ibfk_1` FOREIGN KEY (`TestID`) REFERENCES `test` (`TestID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `result_ibfk_2` FOREIGN KEY (`UserID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `resultdetail`
--
ALTER TABLE `resultdetail`
  ADD CONSTRAINT `resultdetail_ibfk_1` FOREIGN KEY (`ResultID`) REFERENCES `result` (`ResultID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `resultdetail_ibfk_2` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`QuestionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `test_ibfk_1` FOREIGN KEY (`LevelID`) REFERENCES `level` (`levelID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `test_ibfk_2` FOREIGN KEY (`TagID`) REFERENCES `tag` (`TagID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
