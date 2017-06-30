﻿-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 17, 2017 at 10:10 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qlbh`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CatID` int(11) UNSIGNED NOT NULL,
  `CatName` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CatID`, `CatName`) VALUES
(1, 'Sách'),
(2, 'Điện thoại'),
(3, 'Máy chụp hình'),
(4, 'Quần áo - Giày dép'),
(5, 'Máy tính'),
(6, 'Đồ trang sức'),
(7, 'Khác');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetails`
--

CREATE TABLE `orderdetails` (
  `ID` int(11) UNSIGNED NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Price` bigint(20) NOT NULL,
  `Amount` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) UNSIGNED NOT NULL,
  `OrderDate` datetime NOT NULL,
  `UserID` int(11) NOT NULL,
  `Total` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProID` int(11) UNSIGNED NOT NULL,
  `ProName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TinyDes` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `FullDes` text COLLATE utf8_unicode_ci NOT NULL,
  `Price` int(11) NOT NULL,
  `CatID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `TimeStart` datetime NOT NULL,
  `TimeFinish` datetime NOT NULL,
  `Image1` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Image2` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Image3` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `Seller` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `BestBuyer` varchar(50) COLLATE utf8_unicode_ci NOT NULL

) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `likes` (
  `LikeID` int(11) UNSIGNED NOT NULL,
  `Users` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IDPro` int(11) NOT NULL,
  `NamePro` varchar(50) COLLATE utf8_unicode_ci NOT NULL

) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProID`, `ProName`, `TinyDes`, `FullDes`, `Price`, `CatID`, `Quantity`) VALUES
(1, 'Freshwater Cultured Pearl', 'Freshwater Cultured Pearl, Citrine, Peridot & Amethyst Bracelet, 7.5\"', '<UL>\r\n    <LI>Metal stamp: 14k </LI>\r\n    <LI>Metal: yellow-ld</LI>\r\n    <LI>Material Type: amethyst, citrine, ld, pearl, peridot</LI>\r\n    <LI>Gem Type: citrine, peridot, amethyst</LI>\r\n    <LI>Length: 7.5 inches</LI>\r\n    <LI>Clasp Type: filigree-box</LI>\r\n    <LI>Total metal weight: 0.6 Grams</LI>\r\n</UL>\r\n<STRONG>Pearl Information</STRONG><BR>\r\n<UL>\r\n    <LI>Pearl type: freshwater-cultured</LI>\r\n</UL>\r\n<STRONG>Packaging Information</STRONG><BR>\r\n<UL>\r\n    <LI>Package: Regal Blue Sueded-Cloth Pouch</LI>\r\n</UL>', 1500000, 6, 83),
(2, 'Pink Sapphire Sterling Silver', '14 1/2 Carat Created Pink Sapphire Sterling Silver Bracelet w/ Diamond Accents', '<P><STRONG>Jewelry Information</STRONG></P>\r\n<UL>\r\n    <LI>Loại hàng: Hàng trong nước</LI>\r\n</UL>\r\n', 300000, 6, 64),
(3, 'Torrini KC241', 'Nhẫn kim cương - vẻ đẹp kiêu sa', '<P>Không chỉ có kiểu dáng truyền thống chỉ có một hạt kim cương ở giữa, các nhà thiết kế đã tạo những những chiếc nhẫn vô cùng độc đáo và tinh tế. Tuy nhiên, giá của đồ trang sức này thì chỉ có dân chơi mới có thể kham được.</P>\r\n<UL>\r\n    <LI>Kiểu sản phẩm: Nhẫn nữ</LI>\r\n    <LI>Loại đá: To paz</LI>\r\n    <LI>Chất liệu: kim cương, nguyên liệu và công nghệ Italy...</LI>\r\n    <LI>Đơn giá: 2,110,250 VND / Chiếc</LI>\r\n</UL>\r\n', 1600000000, 6, 86),
(4, 'Torrini KC242', 'tinh xảo và sang trọng', '<P>Để sở hữu một chiếc nhẫn kim cương lấp lánh trên tay, bạn phải là người chịu chi và sành điệu.<BR>\r\nVới sự kết hợp khéo léo và độc đáo giữa kim cương và Saphia, Ruby... những chiếc nhẫn càng trở nên giá trị.</P>\r\n<UL>\r\n    <LI>Kiểu sản phẩm: Nhẫn nam</LI>\r\n    <LI>Loại đá: To paz</LI>\r\n    <LI>Chất liệu: Vàng tây 24K, nguyên liệu và công nghệ Italy...</LI>\r\n</UL>\r\n', 42000000, 6, 63),
(5, 'Nokia 7610', 'Độ phân giải cao, màn hình màu, chụp ảnh xuất sắc.', '<UL>\r\n    <LI>Máy ảnh có độ phân giải 1 megapixel</LI>\r\n    <LI>Màn hình 65.536 màu, rộng 2,1 inch, 176 X 208 pixel với đồ họa sắc nét, độ phân giải cao</LI>\r\n    <LI>Quay phim video lên đến 10 phút với hình ảnh sắc nét hơn</LI>\r\n    <LI>Kinh nghiệm đa phương tiện được tăng cường</LI>\r\n    <LI>Streaming video &amp; âm thanh với RealOne Player (hỗ trợ các dạng thức MP3/AAC).</LI>\r\n    <LI>Nâng cấp cho những đoạn phim cá nhân của bạn bằng các tính năng chỉnh sửa tự động thông minh</LI>\r\n    <LI>In ảnh chất lượng cao từ nhà, văn phòng, kios và qua mạng</LI>\r\n    <LI>Dễ dàng kết nối vớI máy PC để lưu trữ và chia sẻ (bằng cáp USB, PopPort, công nghệ Bluetooth)</LI>\r\n    <LI>48 nhạc chuông đa âm sắc, True tones. Mạng GSM 900 / GSM 1800 / GSM 1900</LI>\r\n    <LI>Kích thước 109 x 53 x 19 mm, 93 cc</LI>\r\n    <LI>Trọng lượng 118 g</LI>\r\n    <LI>Hiển thị: Loại TFT, 65.536 màu</LI>\r\n    <LI>Kích cở: 176 x 208 pixels </LI>\r\n</UL>\r\n', 2900000, 2, 0),
(6, 'Áo thun nữ', 'Màu sắc tươi tắn, kiểu dáng trẻ trung', '<UL>\r\n    <LI>Loại hàng: Hàng trong nước</LI>\r\n    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>\r\n</UL>\r\n', 180000, 4, 62),
(7, 'Simen AP75', 'Thiết kế tinh xảo, hiện đại', '<UL>\r\n    <LI>Hình ảnh hoàn hảo, rõ nét ở mọi góc màn hình</LI>\r\n    <LI>Giảm thiểu sự phản chiếu ánh sáng</LI>\r\n    <LI>Menu hiển thị tiếng Việt</LI>\r\n    <LI>Hệ thống hình ảnh thông minh</LI>\r\n    <LI>Âm thanh Hifi Stereo mạnh mẽ</LI>\r\n    <LI>Hệ thống âm lượng thông minh</LI>\r\n    <LI>Bộ nhớ 100 chương trình</LI>\r\n    <LI>Chọn kênh ưa thích</LI>\r\n    <LI>Các kiểu sắp đặt sẵn hình ảnh / âm thanh</LI>\r\n    <LI>Kích thước (rộng x cao x dày): 497 x 458 x 487mm</LI>\r\n    <LI>Trọng lượng: 25kg</LI>\r\n    <LI>Màu: vàng, xanh, bạc </LI>\r\n</UL>\r\n', 2800000, 2, 15),
(8, 'Áo bé trai', 'Hóm hỉnh dễ thương', '<UL>\r\n    <LI>Quần áo bé trai</LI>\r\n    <LI>Loại hàng: Hàng trong nước</LI>\r\n    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>\r\n</UL>\r\n', 270000, 4, 74),
(9, 'Bông tai nạm hạt rubby', 'Trẻ trung và quý phái', '<UL>\n    <LI>Tên sản phẩm: Bông tai nạm hạt rubby</LI>\n    <LI>Đóng nhãn hiệu: Torrini</LI>\n    <LI>Nguồn gốc, xuất xứ: Italy</LI>\n    <LI>Hình thức thanh toán: L/C T/T M/T CASH</LI>\n    <LI>Thời gian giao hàng: trong vòng 3 ngày kể từ ngày mua</LI>\n    <LI>Chất lượng/chứng chỉ: od</LI>\n</UL>\n', 2400000, 6, 43),
(10, 'Đầm dạ hội ánh kim', 'Đủ màu sắc - kiểu dáng', '<UL>\r\n    <LI>Màu sắc: Khuynh hướng ánh kim có thể thể hiện trên vàng, bạc, đỏ tía, xanh biển, vàng tím, trắng và đen.</LI>\r\n    <LI>Một số biến tấu mang tính vui nhộn là vàng chanh, màu hoa vân anh và ngọc lam; trong đó hoàng kim và nhũ bạc khá phổ biến.</LI>\r\n    <LI>Phong cách: Diềm đăng ten, rủ xuống theo chiều thẳng đứng, nhiều lớp, cổ chẻ sâu, eo chít cao tới ngực... được biến tấu tùy theo mỗi nhà thiết kế.</LI>\r\n</UL>\r\n', 2800000, 4, 80),
(11, 'Dây chuyền ánh bạc', 'Kiểu dáng mới lạ', '<UL>\r\n    <LI>Chất liệu chính: Bạc</LI>\r\n    <LI>Màu sắc: Bạc</LI>\r\n    <LI>Chất lượng: Mới</LI>\r\n    <LI>Phí vận chuyển: Liên hệ</LI>\r\n    <LI>Giá bán có thể thay đổi tùy theo trọng lượng và giá vàng của từng thời điểm.</LI>\r\n</UL>\r\n', 250000, 6, 88),
(12, 'Đồ bộ bé gái', 'Đủ màu sắc - kiểu dáng', '<UL>\r\n    <LI>Màu sắc: đỏ tía, xanh biển, vàng tím, trắng và đen.</LI>\r\n    <LI>Xuất xứ: Tp. Hồ Chí Minh</LI>\r\n    <LI>Chất liệu: cotton</LI>\r\n    <LI>Loại hàng: hàng trong nước</LI>\r\n</UL>\r\n', 120000, 4, 61),
(13, 'Đầm dạ hội Xinh Xinh', 'Đơn giản nhưng quý phái', '<P>Những đường cong tuyệt đẹp sẽ càng được phô bày khi diện các thiết kế này.</P>\r\n<UL>\r\n    <LI>Nét cắt táo bạo ở ngực giúp bạn gái thêm phần quyến rũ, ngay cả khi không có trang&nbsp; sức nào trên người.</LI>\r\n    <LI>Đầm hai dây thật điệu đà với nơ xinh trước ngực nhưng trông bạn vẫn toát lên vẻ tinh nghịch và bụi bặm nhờ thiết kế đầm bí độc đáo cùng sắc màu sẫm.</LI>\r\n    <LI>Hãng sản xuất: NEM</LI>\r\n    <LI>Kích cỡ : Tất cả các kích cỡ</LI>\r\n    <LI>Kiểu dáng : Quây/Ống</LI>\r\n    <LI>Chất liệu : Satin</LI>\r\n    <LI>Màu : đen, đỏ</LI>\r\n    <LI>Xuất xứ : Việt Nam</LI>\r\n</UL>\r\n', 2600000, 4, 92),
(14, 'Đầm dạ hội NEM', 'Táo bạo và quyến rũ', '<P>Những đường cong tuyệt đẹp sẽ càng được phô bày khi diện các thiết kế này.</P>\r\n<UL>\r\n    <LI>Nét cắt táo bạo ở ngực giúp bạn gái thêm phần quyến rũ, ngay cả khi không có trang&nbsp; sức nào trên người.</LI>\r\n    <LI>Đầm hai dây thật điệu đà với nơ xinh trước ngực nhưng trông bạn vẫn toát lên vẻ tinh nghịch và bụi bặm nhờ thiết kế đầm bí độc đáo cùng sắc màu sẫm.</LI>\r\n    <LI>Hãng sản xuất: NEM</LI>\r\n    <LI>Kích cỡ : Tất cả các kích cỡ</LI>\r\n    <LI>Kiểu dáng : Quây/Ống</LI>\r\n    <LI>Chất liệu : Satin</LI>\r\n    <LI>Màu : đen, đỏ</LI>\r\n    <LI>Xuất xứ : Việt Nam</LI>\r\n</UL>\r\n', 1200000, 4, 0),
(15, 'Dây chuyền đá quý', 'Kết hợp vàng trắng và đá quý', '<UL>\r\n    <LI>Kiểu sản phẩm: Dây chuyền</LI>\r\n    <LI>Chất liệu: Vàng trắng 14K và đá quý, nguyên liệu và công nghệ Italy...</LI>\r\n    <LI>Trọng lượng chất liệu: 1.1 Chỉ </LI>\r\n</UL>\r\n', 1925000, 6, 22),
(16, 'Nokia N72', 'Sành điệu cùng N72', '<UL>\r\n    <LI>Camera mega pixel : 2 mega pixel</LI>\r\n    <LI>Bộ nhớ trong : 16 - 31 mb</LI>\r\n    <LI>Chức năng : quay phim, ghi âm, nghe đài FM</LI>\r\n    <LI>Hỗ trợ: Bluetooth, thẻ nhớ nài, nhạc MP3 &lt;br/&gt;</LI>\r\n    <LI>Trọng lượng (g) : 124g</LI>\r\n    <LI>Kích thước (mm) : 109 x 53 x 21.8 mm</LI>\r\n    <LI>Ngôn ngữ : Có tiếng việt</LI>\r\n    <LI>Hệ điều hành: Symbian OS 8.1</LI>\r\n</UL>\r\n', 3200000, 2, 81),
(17, 'Mặt dây chuyền Ruby', 'Toả sáng cùng Ruby', '<UL>\r\n    <LI>Kiểu sản phẩm:&nbsp; Mặt dây</LI>\r\n    <LI>Chất liệu: Vàng trắng 14K, nguyên liệu và công nghệ Italy...</LI>\r\n    <LI>Trọng lượng chất liệu: 0.32 Chỉ</LI>\r\n</UL>\r\n', 1820000, 6, 33),
(18, '1/2 Carat Pink Sapphire Silver', 'Created Pink Sapphire', '<UL>\r\n    <LI>Brand Name: Ice.com</LI>\r\n    <LI>Material Type: sterling-silver, created-sapphire, diamond</LI>\r\n    <LI>Gem Type: created-sapphire, Diamond</LI>\r\n    <LI>Minimum total gem weight: 14.47 carats</LI>\r\n    <LI>Total metal weight: 15 Grams</LI>\r\n    <LI>Number of stones: 28</LI>\r\n    <LI>Created-sapphire Information</LI>\r\n    <LI>Minimum color: Not Available</LI>\r\n</UL>\r\n', 3400000, 6, 10),
(19, 'Netaya', 'Dây chuyền vàng trắng', '<UL>\r\n    <LI>Kiểu sản phẩm:&nbsp; Dây chuyền</LI>\r\n    <LI>Chất liệu: Vàng tây 18K, nguyên liệu và công nghệ Italy...</LI>\r\n    <LI>Trọng lượng chất liệu: 1 Chỉ</LI>\r\n</UL>\r\n', 1820000, 6, 17),
(20, 'Giày nam GN16', 'Êm - đẹp - bề', '<UL>\r\n    <LI>Loại hàng: Hàng trong nước</LI>\r\n    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>\r\n    <LI>Giá: 300 000 VNĐ</LI>\r\n</UL>\r\n', 540000, 4, 0),
(21, 'G3.370A', 'Đen bóng, sang trọng', '<UL>\r\n    <LI>Loại hàng: Hàng trong nước</LI>\r\n    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>\r\n</UL>\r\n', 300000, 4, 74),
(22, 'Giày nữ GN1', 'Kiểu dáng thanh thoát', '<UL>\r\n    <LI>Loại hàng: Hàng trong nước</LI>\r\n    <LI>Xuất xứ: Tp Hồ Chí Minh</LI>\r\n</UL>\r\n', 290000, 4, 30),
(23, 'NV002', 'Kiểu dáng độc đáo', '<P><STRONG>Thông tin sản phẩm</STRONG></P>\r\n<UL>\r\n    <LI>Mã sản phẩm: NV002</LI>\r\n    <LI>Trọng lượng: 2 chỉ</LI>\r\n    <LI>Vật liệu chính: Vàng 24K</LI>\r\n</UL>\r\n', 3600000, 6, 5),
(24, 'NV009', 'Sáng chói - mới lạ', '<P><STRONG>Thông tin sản phẩm</STRONG></P>\r\n<UL>\r\n    <LI>Mã sản phẩm: NV005</LI>\r\n    <LI>Trọng lượng: 1 cây</LI>\r\n    <LI>Vật liệu chính: Vàng 24K</LI>\r\n</UL>\r\n', 14900000, 6, 22),
(25, 'CK010', 'Độc đáo, sang trọng', '<UL>\r\n    <LI>Kiểu dáng nam tính và độc đáo, những thiết kế dưới đây đáp ứng được mọi yêu cần khó tính nhất của người sở hữu.</LI>\r\n    <LI>Những hạt kim cương sẽ giúp người đeo nó tăng thêm phần sành điệu</LI>\r\n    <LI>Không chỉ có kiểu dáng truyền thống chỉ có một hạt kim cương ở giữa, các nhà thiết kế đã tạo những những chiếc nhẫn vô cùng độc đáo và tinh tế.</LI>\r\n    <LI>Tuy nhiên, giá của đồ trang sức này thì chỉ có dân chơi mới có thể kham được</LI>\r\n</UL>\r\n', 2147483647, 6, 52),
(26, 'CK009', 'Nữ tính - đầy quí phái', '<UL>\r\n    <LI>Để sở hữu một chiếc nhẫn kim cương lấp lánh trên tay, bạn phải là người chịu chi và sành điệu.</LI>\r\n    <LI>Với sự kết hợp khéo léo và độc đáo giữa kim cương và Saphia, Ruby... những chiếc nhẫn càng trở nên giá trị</LI>\r\n    <LI>Nhà sản xuất: Torrini</LI>\r\n</UL>\r\n<P>Cái này rất phù hợp cho bạn khi tặng nàng</P>\r\n', 1850000000, 6, 11),
(27, 'CK007', 'Sự kết hợp khéo léo, độc đáo', '<UL>\r\n    <LI>Để sở hữu một chiếc nhẫn kim cương lấp lánh trên tay, bạn phải là người chịu chi và sành điệu.</LI>\r\n    <LI>Với sự kết hợp khéo léo và độc đáo giữa kim cương và Saphia, Ruby... những chiếc nhẫn càng trở nên giá trị</LI>\r\n    <LI>Nhà sản xuất: Torrini</LI>\r\n</UL>\r\n<P>Cái này rất phù hợp cho bạn khi tặng nàng</P>\r\n', 2147483647, 6, 28),
(28, 'CK005', 'Tinh xảo - sang trọng', '<UL>\r\n    <LI>Kim cương luôn là đồ trang sức thể hiện đẳng cấp của người sử dụng.</LI>\r\n    <LI>Không phải nói nhiều về những kiểu nhẫn dưới đây, chỉ có thể gói gọn trong cụm từ: tinh xảo và sang trọng</LI>\r\n    <LI>Thông tin nhà sản xuất: Torrini</LI>\r\n    <LI>Thông tin chi tiết: Cái này rất phù hợp cho bạn khi tặng nàng</LI>\r\n</UL>\r\n', 1800000000, 6, 29),
(29, 'NV01TT', 'Tinh tế đến không ngờ', '<UL>\r\n    <LI>Tinh xảo và sang trọng</LI>\r\n    <LI>Thông tin nhà sản xuất: Torrini</LI>\r\n    <LI>Không chỉ có kiểu dáng truyền thống chỉ có một hạt kim cương ở giữa, các nhà thiết kế đã tạo những những chiếc nhẫn vô cùng độc đáo và tinh tế.</LI>\r\n    <LI>Tuy nhiên, giá của đồ trang sức này thì chỉ có dân chơi mới có thể kham được</LI>\r\n</UL>\r\n', 500000000, 6, 49),
(30, 'Motorola W377', 'Nữ tính - trẻ trung', '<UL>\r\n    <LI>General: 2G Network, GSM 900 / 1800 / 1900</LI>\r\n    <LI>Size:&nbsp; 99 x 45 x 18.6 mm, 73 cc</LI>\r\n    <LI>Weight: 95 g</LI>\r\n    <LI>Display: type TFT, 65K colors</LI>\r\n    <LI>Size: 128 x 160 pixels, 28 x 35 mm</LI>\r\n</UL>\r\n', 2400000, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('08lgtImH3aP0hVgQC3jVseEtOt1cZAId', 1497770618, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"id\":14,\"email\":\"quangdung100194@gmail.com\",\"hoten\":\"Lê Quang Dũng\",\"date\":\"1994-01-09T17:00:00.000Z\",\"roll\":1}}'),
('1IDvxnjjGSSxvSYwjvyn-vzTCnYcBYZR', 1497772091, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"id\":14,\"email\":\"quangdung100194@gmail.com\",\"hoten\":\"Lê Quang Dũng\",\"date\":\"1994-01-09T17:00:00.000Z\",\"roll\":1}}'),
('7-LdSM00KW-KZIw-QZNkDQvzWN5jXH5U', 1497683266, '{\"cookie\":{\"originalMaxAge\":-1000,\"expires\":\"2017-06-17T07:07:46.400Z\",\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":false,\"user\":null,\"cart\":null}'),
('8XBvlEhW3KejisyvLI6v8XaZpCwVZgaS', 1497679069, '{\"cookie\":{\"originalMaxAge\":-1000,\"expires\":\"2017-06-17T05:57:48.727Z\",\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":false,\"user\":null,\"cart\":null}'),
('AEjpafjg_7i7myb_gL9qd5a72te7z3Hs', 1497685308, '{\"cookie\":{\"originalMaxAge\":-1000,\"expires\":\"2017-06-17T07:41:48.448Z\",\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":false,\"user\":null,\"cart\":null}'),
('BsUrOFfabjcjpCTWHQvF0Td84MRA9yoe', 1497771373, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"id\":14,\"email\":\"quangdung100194@gmail.com\",\"hoten\":\"Lê Quang Dũng\",\"date\":\"1994-01-09T17:00:00.000Z\",\"roll\":1}}'),
('Bwqy1SSDzzcfHFYjNlmRXSb4xWpLuNcU', 1497765625, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"id\":39,\"email\":\"123@gmail.com\",\"hoten\":\"dung\",\"date\":\"2017-06-15T17:00:00.000Z\",\"roll\":0},\"cart\":[]}'),
('Byp7LKTyq_-pKAEpQnWOEHJlhJlznnp0', 1497685334, '{\"cookie\":{\"originalMaxAge\":-1000,\"expires\":\"2017-06-17T07:42:14.485Z\",\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":false,\"user\":null,\"cart\":null}'),
('DuQ4gvWBpPBHJL5QdWVMNKNGe_3PEQK1', 1497771643, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"id\":14,\"email\":\"quangdung100194@gmail.com\",\"hoten\":\"Lê Quang Dũng\",\"date\":\"1994-01-09T17:00:00.000Z\",\"roll\":1}}'),
('E0PhzCKEXiZ8f1c7Xa-B0FH3W_55rbhs', 1497768228, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"id\":39,\"email\":\"123@gmail.com\",\"hoten\":\"dung\",\"date\":\"2017-06-15T17:00:00.000Z\",\"roll\":0},\"cart\":[]}'),
('FQm4G_9R4C6UEuTeUwerA9ch4Nff695G', 1497771231, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"id\":14,\"email\":\"quangdung100194@gmail.com\",\"hoten\":\"Lê Quang Dũng\",\"date\":\"1994-01-09T17:00:00.000Z\",\"roll\":1}}'),
('Fo84vZUVzYTZ6EI04zdy59bsV6fXiPQr', 1497675415, '{\"cookie\":{\"originalMaxAge\":-1000,\"expires\":\"2017-06-17T04:56:55.404Z\",\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":false,\"user\":null,\"cart\":null}'),
('OzWj5yheW2sSlThjMJrgvMetPgRmZ7zS', 1497770637, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"id\":14,\"email\":\"quangdung100194@gmail.com\",\"hoten\":\"Lê Quang Dũng\",\"date\":\"1994-01-09T17:00:00.000Z\",\"roll\":1}}'),
('T-w3TlegdA3ip_250n4m-xHv1AneQSeO', 1497771514, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"id\":14,\"email\":\"quangdung100194@gmail.com\",\"hoten\":\"Lê Quang Dũng\",\"date\":\"1994-01-09T17:00:00.000Z\",\"roll\":1}}'),
('VneSB3z5w0gOULn5DJ_oA0R95SwabiaK', 1497769570, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"id\":44,\"email\":\"123@gmail.com\",\"hoten\":\"ky\",\"date\":\"1994-06-16T17:00:00.000Z\",\"roll\":0},\"cart\":[]}'),
('WgTYP9aLW6_pKqCb7Dh2KH5HRmBTHMPz', 1497771351, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"id\":14,\"email\":\"quangdung100194@gmail.com\",\"hoten\":\"Lê Quang Dũng\",\"date\":\"1994-01-09T17:00:00.000Z\",\"roll\":1}}'),
('XRXqOiVuzVlhQPLYyWc-LtY7sTHvSovY', 1497770541, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"id\":14,\"email\":\"quangdung100194@gmail.com\",\"hoten\":\"Lê Quang Dũng\",\"date\":\"1994-01-09T17:00:00.000Z\",\"roll\":1}}'),
('_GtRcHzr1Drr9Pwhp8HLxlOlu2-bGBi-', 1497772066, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('cXYJX4O2iTh82Ssvsec5MU3_8UPZXJeA', 1497771985, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"id\":14,\"email\":\"quangdung100194@gmail.com\",\"hoten\":\"Lê Quang Dũng\",\"date\":\"1994-01-09T17:00:00.000Z\",\"roll\":1}}'),
('femBfCKbwfKOL1MitSnrfyCNgH404KXr', 1497683326, '{\"cookie\":{\"originalMaxAge\":-1000,\"expires\":\"2017-06-17T07:08:45.578Z\",\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":false,\"user\":null,\"cart\":null}'),
('kxyuVIVeo-WxAJPjW6HCTn2FndES6Uwg', 1497765975, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"id\":39,\"email\":\"123@gmail.com\",\"hoten\":\"dung\",\"date\":\"2017-06-15T17:00:00.000Z\",\"roll\":0},\"cart\":[]}'),
('srm3FKE3Ss687LsNa8gue13OQGxcUKa7', 1497765340, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"id\":39,\"email\":\"123@gmail.com\",\"hoten\":\"dung\",\"date\":\"2017-06-15T17:00:00.000Z\",\"roll\":0},\"cart\":[]}'),
('sxQ9pJvTauKzzBgT4gAE_hGajJOuCaNI', 1497764760, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"id\":2,\"username\":\"Lê Quang Dũng\",\"name\":\"Dung\",\"email\":\"quangdung100194@gmail.com\",\"dob\":\"2017-06-26T17:00:00.000Z\",\"permission\":0},\"cart\":[]}'),
('xH-eex01EogGYToHXcmDvEO0ajW8tdSb', 1497771760, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"isLogged\":true,\"user\":{\"id\":1,\"username\":\"quangdung\",\"name\":\"dung\",\"email\":\"quangdung100194@gmail.com\",\"dob\":\"2017-06-04T17:00:00.000Z\",\"permission\":0},\"cart\":[]}');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hoten` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `roll` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `hoten`, `password`, `date`, `roll`) VALUES
(14, 'quangdung100194@gmail.com', 'Lê Quang Dũng', 'e10adc3949ba59abbe56e057f20f883e', '1994-01-10', 1),
(15, 'anhdung@gmail.com', 'Nguyễn Hoàng Anh Dũng', '96e79218965eb72c92a549dd5a330112', '1995-02-04', 0),
(44, '123@gmail.com', 'ky', '96e79218965eb72c92a549dd5a330112', '1994-06-17', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `f_ID` int(11) NOT NULL,
  `f_Username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_Password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `f_Name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_Email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `f_DOB` date NOT NULL,
  `f_Permission` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`f_ID`, `f_Username`, `f_Password`, `f_Name`, `f_Email`, `f_DOB`, `f_Permission`) VALUES
(1, 'quangdung', '96e79218965eb72c92a549dd5a330112', 'dung', 'quangdung100194@gmail.com', '2017-06-05', 0),
(2, 'Lê Quang Dũng', '96e79218965eb72c92a549dd5a330112', 'Dung', 'quangdung100194@gmail.com', '2017-06-27', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CatID`);

--
-- Indexes for table `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`);

  ALTER TABLE `likes`
  ADD PRIMARY KEY (`LikeID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProID`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);


--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`f_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CatID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `orderdetails`
--
ALTER TABLE `orderdetails`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

  ALTER TABLE `likes`
  MODIFY `LikeID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `f_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
