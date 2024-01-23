-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2024 at 12:59 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spicefy`
--

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(11) NOT NULL,
  `label` varchar(100) NOT NULL,
  `akurasi` varchar(100) NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`id`, `label`, `akurasi`, `tanggal`, `user_id`) VALUES
(1, 'Bawang Putih', '100.0', '2024-01-17 04:44:54', 4),
(2, 'Bawang Putih', '100.0', '2024-01-17 04:44:54', 4),
(3, 'Asam Jawa', '30.204400420188904', '2024-01-17 04:45:40', 4),
(4, 'Bawang Putih', '100.0', '2024-01-17 04:52:42', 5),
(5, 'Asam Jawa', '30.204400420188904', '2024-01-17 05:07:51', 4),
(6, 'Kunyit', '27.064287662506104', '2024-01-17 05:08:58', 5),
(7, 'Cengkeh', '85.2160632610321', '2024-01-17 05:09:47', 5),
(8, 'Bawang Putih', '100.0', '2024-01-17 05:12:05', 5),
(9, 'Jahe', '37.25116848945618', '2024-01-17 05:12:16', 5),
(10, 'Bawang Putih', '100.0', '2024-01-17 08:35:56', 4),
(11, 'Kunyit', '99.94661211967468', '2024-01-17 08:38:30', 4),
(12, 'Kunyit', '99.94661211967468', '2024-01-18 09:49:28', 4),
(13, 'Kunyit', '99.94661211967468', '2024-01-18 09:49:30', 4),
(14, 'Kunyit', '99.94661211967468', '2024-01-18 13:55:15', 4),
(15, 'Kunyit', '99.94661211967468', '2024-01-18 13:55:15', 4),
(16, 'Kunyit', '99.94661211967468', '2024-01-18 13:55:16', 4),
(17, 'Bawang Putih', '100.0', '2024-01-18 15:34:53', 4),
(18, 'Bawang Putih', '100.0', '2024-01-18 15:40:55', 5),
(19, 'Bawang Putih', '100.0', '2024-01-18 15:46:08', 4);

-- --------------------------------------------------------

--
-- Table structure for table `rempah`
--

CREATE TABLE `rempah` (
  `rempah_id` int(11) NOT NULL,
  `nama_rempah` varchar(100) NOT NULL,
  `nama_latin` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `image` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rempah`
--

INSERT INTO `rempah` (`rempah_id`, `nama_rempah`, `nama_latin`, `deskripsi`, `image`) VALUES
(1, 'Adas Bintang', 'Illicium verum', 'Adas bintang, atau bunga lawang, adalah rempah dengan bentuk menyerupai bintang dan aroma manis pedas yang khas. Dikenal sebagai penyedap rasa dalam masakan, adas bintang tidak hanya memberikan citarasa unik pada hidangan, tetapi juga memiliki khasiat dalam pengobatan tradisional, meredakan gangguan pencernaan, kembung, dan masalah pernapasan. Minyak atsiri yang terkandung di dalamnya, terutama anetol, tidak hanya memberikan aroma khas tetapi juga memiliki sifat antimikroba. Adas bintang sering digunakan dalam masakan Asia dan Timur Tengah, memberikan kontribusi pada cita rasa yang kaya dan kompleks dalam berbagai hidangan.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245895/awobrzjrpw4bfmq6fz4s.jpg'),
(2, 'Andaliman', 'Zanthoxylum acanthopodium', 'Andaliman, tuba atau itir-itir (Latin: Zanthoxylum acanthopodium DC) adalah bumbu masak khas Asia yang berasal dari kulit luar buah beberapa jenis tumbuhan anggota marga Zanthoxylum (suku jeruk-jerukan, Rutaceae). Bumbu ini di Indonesia hanya dikenal untuk masakan Batak, sehingga dikenal orang luar daerah ini sebagai merica batak. Khasiatnya yang mampu menghilangkan bau amis pada ikan mentah menjadikan andaliman sebagai bumbu andalan dalam masakan khas Batak seperti arsik dan saksang. Serbuk buah andaliman yang mengandung senyawa aromatik dan minyak esensial juga dapat berfungsi sebagai antioksidan dan antimikroba yang berfungsi untuk menghambat perkembangan bakteri Bacillus cereus, Eschericia coli, Pseudomonas fluorescens, Salmonella typhimurium, dan Staphylococcus aureus. Kandungan vitamin C dan E alami dalam buah ini juga dapat berfungsi untuk menjaga daya tahan tubuh. Di dunia pertanian sendiri, andaliman dapat diandalkan sebagai insektisida yang mampu menghambat pertumbuhan hama bubuk jagung dari serangga Sitophilus zeamais.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245908/r7ghdpun4k9cwr79i9es.jpg'),
(3, 'Asam Jawa', 'Tamarindus indica', 'Asam Jawa, atau tamarind, adalah rempah dengan rasa asam yang khas dan aroma yang segar. Buah cokelat tua ini digunakan secara luas dalam masakan Asia dan dunia, memberikan citarasa asam yang menyegarkan pada berbagai hidangan. Asam Jawa juga dikenal karena khasiatnya dalam kesehatan. Kandungan asam tartarik dan antioksidan dalam buah ini memberikan efek detoksifikasi pada tubuh, mendukung sistem pencernaan, dan memiliki sifat antiinflamasi. Selain itu, asam Jawa mengandung vitamin C yang baik untuk sistem kekebalan tubuh. Secara tradisional, asam Jawa juga digunakan sebagai penambah rasa pada hidangan dan bumbu dalam berbagai jenis masakan.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245883/dk1i0afr4ls2thyuolii.png'),
(7, 'Temulawak', 'Curcuma xanthorrhiza', 'Temulawak, atau Curcuma xanthorrhiza, adalah sejenis tumbuhan rempah yang tumbuh di berbagai daerah tropis, terutama di Asia Tenggara. Temulawak memiliki akar yang kaya akan kurkuminoid, senyawa yang memberikan warna kuning khas dan memiliki beragam manfaat kesehatan. Dalam dunia kuliner, temulawak sering digunakan sebagai bumbu atau penyedap pada masakan tradisional, memberikan sentuhan harum dan cita rasa khas. Di samping itu, temulawak juga terkenal dalam pengobatan tradisional, di mana akarnya digunakan untuk meredakan berbagai masalah pencernaan, meningkatkan sistem kekebalan tubuh, dan bahkan sebagai antioksidan alami. Temulawak telah menjadi bagian integral dari warisan kuliner dan pengobatan tradisional di banyak budaya, menunjukkan kekayaan manfaat alamiah yang ditawarkan oleh rempah ini.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245971/vwh8kvgy15qwqduatejf.jpg'),
(8, 'Lengkuas', ' Alpinia galanga', 'Lengkuas, atau Alpinia galanga, merupakan rempah yang berasal dari keluarga jahe-jahean dan banyak digunakan dalam masakan Asia Tenggara. Tanaman ini dikenal dengan akar yang memiliki aroma harum dan rasa segar yang unik. Lengkuas memiliki dua varietas utama, yaitu lengkuas putih dan lengkuas merah, yang keduanya sering digunakan dalam pembuatan masakan untuk memberikan cita rasa khas. Selain digunakan sebagai bumbu penyedap, lengkuas juga terkenal karena sifat-sifat kesehatannya. Senyawa-senyawa aktif dalam lengkuas, seperti flavonoid dan minyak atsiri, memiliki potensi antiinflamasi, antimikroba, dan antioksidan. Lengkuas juga dikenal dapat membantu meningkatkan pencernaan, meredakan masalah perut, dan memiliki efek tonik untuk kesehatan secara keseluruhan. Sebagai bagian penting dalam masakan tradisional, lengkuas memberikan kontribusi tidak hanya pada rasa masakan, tetapi juga pada manfaat kesehatan yang dapat diperoleh dari konsumsinya.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245952/ot4nfphfbtjbvad5pw4o.jpg'),
(9, 'Wijen', 'Sesamum indicum', 'Wijen, rempah yang dihasilkan dari biji tanaman Sesamum indicum, memiliki ciri khas rasa gurih dan aroma khas yang memperkaya berbagai hidangan. Wijen dikenal sebagai bahan penting dalam masakan Asia, terutama dalam pembuatan saus, kacang-kacangan, dan hidangan panggang. Selain memberikan rasa yang unik, wijen juga dihargai karena kandungan nutrisinya yang kaya, termasuk asam lemak omega-3, serat, vitamin, dan mineral. Rempah ini telah lama digunakan dalam pengobatan tradisional, di mana beberapa meyakini bahwa wijen dapat meningkatkan kesehatan jantung, mendukung fungsi pencernaan, dan memiliki sifat antiinflamasi. Keunikan wijen, baik dalam rasa maupun manfaat kesehatannya, menjadikannya salah satu rempah yang sering digunakan dalam berbagai masakan dan memiliki tempat istimewa dalam beragam budaya kuliner di seluruh dunia.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245906/wen83cly1slz2t7wgczc.png'),
(10, 'Biji Adas', 'Foeniculum vulgare', 'Biji Adas, juga dikenal sebagai Foeniculum vulgare, adalah rempah dengan biji kecil berbentuk oval yang memiliki aroma harum dan rasa manis. Rempah ini sering digunakan dalam berbagai masakan, baik sebagai bumbu maupun sebagai obat tradisional. Biji adas mengandung minyak atsiri, terutama anetol, yang memberikan aroma dan rasa khas. Selain memberikan citarasa unik pada hidangan, biji adas juga memiliki berbagai khasiat kesehatan. Mereka dapat membantu meredakan masalah pencernaan seperti kembung dan gangguan pencernaan. Selain itu, biji adas juga diketahui memiliki sifat antiinflamasi dan antioksidan, yang dapat memberikan manfaat bagi kesehatan secara keseluruhan.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245896/hzyx3bvecycihqqso9t3.png'),
(11, 'Kencur', 'Kaempferia galanga', 'Kencur adalah sejenis rempah yang berasal dari rimpang tanaman Kaempferia galanga. Rimpang kencur memiliki aroma harum dan rasa pedas yang khas. Rempah ini umumnya digunakan dalam masakan tradisional di berbagai wilayah Asia, terutama di Indonesia, sebagai penyedap dan penambah aroma pada hidangan. Kencur juga dikenal memiliki sejumlah khasiat kesehatan. Dalam pengobatan tradisional, kencur sering digunakan untuk meredakan gangguan pencernaan, seperti perut kembung dan mual. Kandungan minyak atsiri, zat antioksidan, dan senyawa bioaktif lainnya dalam kencur memberikan efek antimikroba dan antiinflamasi. Selain itu, kencur juga dianggap dapat meningkatkan daya tahan tubuh dan memperkuat sistem kekebalan. Kencur, dengan keberagamannya dalam masakan dan manfaat kesehatannya, menjadi bagian integral dari warisan kuliner dan pengobatan tradisional di Asia.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245889/aacqs7dwsrpic35fpxxe.jpg'),
(12, 'Kemiri', 'Aleurites moluccanus', 'Kemiri, atau juga dikenal sebagai candlenut, merupakan rempah yang berasal dari buah tanaman Aleurites moluccanus. Rempah ini memiliki tekstur keras dan kulit luar yang keras, dengan inti yang kaya akan minyak. Kemiri sering digunakan dalam masakan tradisional, terutama di berbagai masakan Asia Tenggara. Kandungan minyak dalam kemiri memberikan cita rasa khas pada hidangan dan sekaligus berperan sebagai pengental. Selain itu, kemiri juga dikenal memiliki sejumlah manfaat kesehatan. Minyak yang diekstrak dari kemiri mengandung asam lemak omega-3, omega-6, dan vitamin E, yang dapat mendukung kesehatan kulit dan rambut. Beberapa tradisi pengobatan tradisional juga menggunakan kemiri untuk meredakan peradangan dan sebagai bahan dalam ramuan penyembuhan. Kemiri, dengan keunikan rasanya dan manfaat kesehatannya, menjadi bagian penting dalam kuliner dan pengobatan tradisional di berbagai budaya.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245888/bwrqvn0thv3iurkx0ecr.jpg'),
(13, 'Serai', 'Cymbopogon citratus', 'Serai, atau Cymbopogon citratus, adalah sejenis rumput yang tumbuh subur di daerah tropis. Rempah ini memiliki aroma segar, citrus, dan sedikit bunga yang unik. Serai sering digunakan sebagai bumbu dalam masakan Asia Tenggara, khususnya dalam hidangan sup, gulai, dan berbagai hidangan daging dan seafood. Selain memberikan cita rasa yang segar dan harum pada masakan, serai juga dikenal memiliki khasiat kesehatan. Senyawa-senyawa seperti citronella yang terkandung dalam serai telah dikaitkan dengan sifat antiinflamasi, antimikroba, dan antioksidan. Serai juga digunakan dalam pengobatan tradisional untuk meredakan gangguan pencernaan, meningkatkan sistem kekebalan tubuh, dan bahkan membantu mengatasi masalah tidur. Dengan kombinasi rasa dan aroma yang unik serta manfaat kesehatannya, serai menjadi salah satu rempah yang penting dan serbaguna dalam dunia kuliner dan pengobatan tradisional.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245888/sm9e4wpujioyyadx7qrn.jpg'),
(14, 'Vanili', 'Vanilla planifolia', 'Vanili, yang berasal dari biji buah vanilla orchid, adalah rempah yang terkenal dengan aroma manis dan lezatnya. Rempah ini telah menjadi elemen penting dalam dunia kuliner dan pembuatan kue, memberikan sentuhan khas ke dalam berbagai hidangan. Proses produksi vanili melibatkan fermentasi dan pengeringan buah vanilla orchid, menghasilkan biji vanili yang dikenal sebagai \\\'vanilla beans.\\\' Selain digunakan sebagai perasa alami, vanili juga memiliki khasiat kesehatan. Beberapa percaya bahwa vanili memiliki sifat relaksan yang dapat meredakan stres dan kecemasan. Selain itu, vanili juga diklaim memiliki potensi antioksidan dan dapat membantu meningkatkan mood. Keberagaman penggunaan vanili, baik dalam bidang kuliner maupun pengobatan tradisional, mencerminkan nilai dan kepopuleran rempah ini di berbagai aspek kehidupan sehari-hari.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245887/q2y4vlkasg6b9lhunid0.jpg'),
(15, 'Kayu Secang', 'Caesalpinia sappan', 'Kayu secang, rempah dengan warna merah pekat hingga cokelat tua, dihasilkan dari serbuk kayu yang berasal dari tumbuhan Caesalpinia sappan. Rempah ini sering digunakan dalam masakan tradisional, memberikan warna dan aroma yang khas pada berbagai hidangan. Selain sebagai pewarna alami, kayu secang juga diketahui memiliki sejumlah manfaat kesehatan. Kandungan senyawa seperti brazilin dan brazilein dalam kayu secang telah dikaitkan dengan sifat antiinflamasi dan antioksidan. Beberapa tradisi pengobatan tradisional menggunakan kayu secang untuk membantu mengatasi masalah pencernaan, meredakan radang, dan bahkan sebagai tonik untuk kesehatan secara keseluruhan. Dengan kombinasi keunikan warna dan potensi manfaatnya, kayu secang menjadi salah satu rempah yang menarik perhatian dalam dunia kuliner dan kesehatan.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245887/whi0jq8s0ygvpsqn92sn.jpg'),
(16, 'Kapulaga', 'Elettaria cardamomum', 'Kapulaga, rempah yang berasal dari biji buah tanaman kapulaga, memiliki aroma yang khas dan rasa yang harum. Umumnya digunakan dalam masakan sebagai penyedap rasa, kapulaga juga mempunyai sejumlah manfaat kesehatan. Kandungan minyak esensial, seperti cineole dan terpineol, memberikan kapulaga sifat antimikroba dan antiinflamasi. Rempah ini juga telah lama dikenal dalam pengobatan tradisional untuk meredakan gangguan pencernaan, seperti kembung dan gangguan perut. Beberapa studi juga menunjukkan bahwa kapulaga dapat membantu meningkatkan sirkulasi darah dan memiliki potensi efek antikanker. Selain digunakan dalam masakan, kapulaga sering disajikan dalam bentuk teh atau digunakan dalam rempah-rempah campuran untuk memberikan manfaat kesehatan dan kelezatan pada hidangan.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245886/qjp97dpfruetprieakcv.jpg'),
(17, 'Kayu Manis', 'Cinnamomum burmannii', 'Kayu manis, rempah dengan aroma manis dan hangat, diambil dari kulit bagian dalam pohon kayu manis. Selain memberikan cita rasa yang khas pada berbagai hidangan, kayu manis juga diketahui memiliki sejumlah manfaat kesehatan. Kandungan senyawa seperti kumarin dan antioksidan dalam kayu manis telah dikaitkan dengan sifat antiinflamasi dan antibakteri. Beberapa penelitian menunjukkan bahwa konsumsi kayu manis dapat membantu mengatur kadar gula darah, meningkatkan sensitivitas insulin, dan mengurangi risiko penyakit jantung. Selain itu, kayu manis juga terkenal sebagai penambah rasa pada minuman, kue, dan hidangan penutup. Dengan kombinasi cita rasa yang lezat dan potensi manfaat kesehatannya, kayu manis menjadi salah satu rempah yang populer digunakan dalam berbagai kuliner dan minuman.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245886/wltcaujiq6mmlinaw7ey.jpg'),
(18, 'Jahe', 'Zingiber officinal', 'Jahe, yang berasal dari akar tanaman Zingiber officinale, telah menjadi bagian integral dari beragam budaya kuliner dan sistem pengobatan tradisional selama berabad-abad. Rempah-rempah ini dikenal karena rasa pedas dan hangatnya yang khas, serta aroma yang menyegarkan. Selain digunakan sebagai bumbu penyedap dalam masakan, jahe juga sering diaplikasikan dalam minuman seperti teh jahe, memberikan sensasi menyegarkan dan kesejukan. Tidak hanya menjadi bagian dari pengalaman kuliner, jahe telah dihargai karena potensinya dalam kesehatan. Jahe mengandung senyawa-senyawa seperti gingerol yang memiliki sifat antiinflamasi dan antioksidan. Dalam pengobatan tradisional, jahe sering digunakan untuk meredakan gangguan pencernaan, mengurangi mual, dan mengatasi gejala pilek atau flu. Dengan profil rasa yang unik dan manfaat kesehatannya, jahe terus menjadi elemen penting dalam dunia kuliner dan kesehatan.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245885/zdwx7vva0n0eiixdhfyx.jpg'),
(19, 'Daun Salam', 'Syzygium polyanthum', 'Daun salam, dikenal juga sebagai bay leaf, adalah bumbu dapur yang berasal dari daun pohon salam. Memiliki aroma harum dan rasa khas, daun salam sering digunakan dalam berbagai masakan, terutama untuk memberikan cita rasa pada sup, saus, dan hidangan berkuah lainnya. Selain fungsinya sebagai penyedap, daun salam mengandung senyawa-senyawa seperti eugenol, tannin, dan flavonoid, yang memberikan manfaat kesehatan. Eugenol memiliki sifat antiinflamasi dan antikanker, sedangkan daun salam secara tradisional dihubungkan dengan manfaat pencernaan dan kemampuannya untuk membantu mengatur kadar gula darah. Dalam proses memasak, daun salam sering dimasukkan untuk memberikan aroma dan rasa, dan kemudian diangkat sebelum hidangan disajikan.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245884/v2j7z4oirlmhgxxlizot.jpg'),
(20, 'Daun Ketumbar', 'Coriandrum sativum', 'Daun ketumbar, juga dikenal sebagai cilantro atau coriander, adalah bagian dari tumbuhan Coriandrum sativum. Daun ini memiliki aroma yang segar, harum, dan sedikit citrus, dengan daun yang berbentuk bulat dan dipotong-potong halus. Daun ketumbar biasanya digunakan sebagai bumbu dalam masakan Asia, Amerika Latin, dan Mediterania. Ketumbar mengandung senyawa-senyawa seperti linalool, geraniol, dan terpena, yang memberikan aroma khasnya. Selain memberikan cita rasa yang unik pada masakan, daun ketumbar juga dikenal memiliki beberapa khasiat kesehatan. Senyawa-senyawa di dalamnya memiliki sifat antioksidan dan antiinflamasi. Masyarakat tradisional telah menggunakan ketumbar untuk membantu meredakan gangguan pencernaan, meningkatkan nafsu makan, dan bahkan mengatasi masalah tidur. Secara keseluruhan, daun ketumbar adalah tambahan yang populer dalam masakan global, memberikan cita rasa segar dan aroma yang khas, sambil memberikan manfaat kesehatan yang potensial.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245884/bh0hfee0sbpsmkr18lni.jpg'),
(21, 'Pala', 'Myristica fragrans', 'Pala, atau Myristica fragrans, adalah rempah yang berasal dari biji buah pohon pala yang tumbuh di wilayah tropis. Rempah ini memiliki aroma khas dan rasa yang hangat, manis, dan sedikit pedas. Pala sering digunakan dalam berbagai masakan, terutama kue-kue, minuman, dan hidangan berbasis rempah. Selain memberikan cita rasa yang khas, pala juga diketahui memiliki berbagai manfaat kesehatan. Senyawa-senyawa seperti miristisin, elemicin, dan eugenol yang terdapat dalam pala telah dikaitkan dengan sifat antiinflamasi, antimikroba, dan antioksidan. Pala juga dikenal dapat membantu meredakan gangguan pencernaan, meningkatkan nafsu makan, dan bahkan memiliki potensi afrodisiak. Sebagai rempah yang telah lama digunakan dalam tradisi kuliner dan pengobatan, pala tidak hanya memberikan sentuhan istimewa pada masakan, tetapi juga menawarkan manfaat kesehatan yang beragam.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245882/grtaddloqqidbwgqpku2.jpg'),
(22, 'Biji Ketumbar', ' Coriandrum sativum', 'Biji ketumbar, yang berasal dari tanaman Coriandrum sativum, adalah rempah yang memiliki biji kecil berwarna cokelat yang mengandung aroma harum dan rasa citrus. Rempah ini sering digunakan dalam berbagai masakan, baik masakan Asia, Timur Tengah, maupun masakan Eropa. Biji ketumbar mengandung senyawa seperti linalool dan pinene yang memberikan aroma segar dan citarasa khas. Selain menjadi bumbu penyedap, biji ketumbar juga dikenal memiliki beberapa khasiat kesehatan. Mereka dapat membantu meredakan gangguan pencernaan, mengurangi peradangan, dan memiliki sifat antioksidan. Selain itu, biji ketumbar juga telah digunakan dalam pengobatan tradisional untuk meredakan masalah seperti sakit perut dan mual.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245882/sivjrafiureeqcavi8yo.jpg'),
(23, 'Cengkeh', 'Syzygium aromaticum', 'Cengkeh adalah rempah yang berasal dari bunga pohon cengkeh (Syzygium aromaticum). Rempah ini memiliki aroma yang kuat dan rasa pedas manis yang khas. Cengkeh sering digunakan dalam berbagai masakan, terutama masakan khas oriental dan kue-kue tradisional. Selain kegunaannya sebagai bumbu masakan, cengkeh juga memiliki khasiat kesehatan. Cengkeh mengandung senyawa seperti eugenol, yang memiliki sifat antioksidan, antiinflamasi, dan antiseptik. Oleh karena itu, cengkeh sering digunakan dalam pengobatan tradisional untuk meredakan nyeri gigi, mengatasi gangguan pencernaan, dan meningkatkan sistem kekebalan tubuh. Cengkeh juga memiliki sejarah panjang sebagai rempah berharga dan bahan untuk minyak esensial. Dengan kombinasi aroma dan manfaat kesehatannya, cengkeh menjadi salah satu rempah yang sangat dihargai di dunia kuliner dan pengobatan tradisional.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245882/jszdfavz2xbmgzseln7c.jpg'),
(24, 'Cabai', 'Capsicum annuum', 'Cabai adalah rempah yang berasal dari tanaman Capsicum annuum atau Capsicum frutescens. Rempah ini memiliki rasa pedas yang khas dan sering digunakan untuk memberikan kehangatan dan kepedasan pada berbagai masakan di seluruh dunia. Cabai mengandung senyawa capsaicin yang bertanggung jawab atas sensasi pedasnya. Selain sebagai bumbu penyedap, cabai juga diketahui memiliki beberapa khasiat kesehatan. Senyawa capsaicin dalam cabai dapat merangsang metabolisme tubuh, membantu mengurangi rasa sakit, dan memiliki sifat antiinflamasi. Konsumsi cabai juga dikaitkan dengan peningkatan sirkulasi darah dan meningkatkan sistem kekebalan tubuh. Meskipun memberikan rasa pedas yang intens, cabai memiliki nilai kuliner dan kesehatan yang tinggi.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245881/urer1rn4loklw55l2yuh.jpg'),
(25, 'Lada', 'Piper nigrum', 'Lada, atau Piper nigrum, adalah rempah yang diperoleh dari buah tanaman lada. Rempah ini dikenal karena rasa pedasnya yang khas dan kemampuannya untuk memberikan sentuhan bumbu pada berbagai hidangan. Terdapat beberapa jenis lada, seperti lada hitam, lada putih, dan lada hijau, yang semuanya berasal dari buah yang sama, namun diproses secara berbeda. Lada hitam dihasilkan dari buah yang sudah matang dan direndam sebelum dikeringkan, sementara lada putih berasal dari biji lada yang dikupas kulitnya. Lada hijau, di sisi lain, adalah buah lada yang masih muda dan belum matang. Selain sebagai penyedap rasa, lada juga dikenal memiliki khasiat kesehatan. Senyawa aktif dalam lada, seperti piperin, memiliki sifat antiinflamasi, antioksidan, dan dapat meningkatkan penyerapan nutrisi. Lada telah lama menjadi bagian penting dari dapur dan pengobatan tradisional di berbagai belahan dunia.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245879/c1xloxwfnwfitxlhdddb.png'),
(26, 'Bawang Putih', 'Allium sativum', 'Bawang Putih adalah rempah dengan bentuk bulat dan kulit luar berwarna putih. Memiliki rasa yang kuat dan aroma yang khas, bawang putih sering digunakan dalam berbagai masakan untuk memberikan cita rasa yang kaya dan menggugah selera. Selain menjadi bumbu penyedap yang populer, bawang putih juga terkenal karena khasiat kesehatannya. Rempah ini mengandung senyawa allicin yang memiliki sifat antibiotik dan antioksidan, membantu meningkatkan sistem kekebalan tubuh, dan melawan infeksi. Bawang putih juga dikaitkan dengan manfaat kesehatan jantung, menurunkan tekanan darah, dan mendukung kesehatan sistem pernapasan. Sebagai rempah serbaguna, bawang putih bukan hanya memberi rasa lezat pada masakan, tetapi juga memberikan kontribusi positif pada kesehatan.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245879/vcmfcxuywufpvyglk9m2.jpg'),
(27, 'Kunyit', 'Curcuma longa', 'Kunyit, atau Curcuma longa, adalah sejenis rempah yang memiliki akar berwarna kuning oranye dan sering digunakan dalam masakan Asia Tenggara. Kunyit memberikan warna kuning yang mencolok pada hidangan dan memiliki rasa pahit serta aroma harum yang khas. Di samping peranannya sebagai bumbu dapur, kunyit juga terkenal karena khasiat kesehatannya. Senyawa utama dalam kunyit yang disebut kurkumin dikenal memiliki sifat antiinflamasi dan antioksidan. Kunyit sering digunakan dalam pengobatan tradisional untuk meredakan peradangan, membantu pencernaan, dan sebagai suplemen yang mendukung sistem kekebalan tubuh. Beberapa penelitian juga menunjukkan potensi kurkumin dalam melawan penyakit kronis dan memiliki efek positif pada kesehatan otak. Sebagai rempah yang kaya akan manfaat, kunyit terus menjadi bagian integral dari kuliner dan pengobatan tradisional di berbagai budaya', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245877/pj3joqffhfmo8lqvsfrg.jpg'),
(28, 'Bawang Merah', 'Allium cepa', 'Bawang Merah adalah rempah yang memiliki bentuk bulat dan warna cokelat kemerahan. Dengan rasa yang sedikit manis dan aroma yang khas, bawang merah sering digunakan dalam masakan untuk memberikan cita rasa yang lezat. Selain memberikan karakteristik rasa, bawang merah juga dikenal memiliki sejumlah manfaat kesehatan. Rempah ini mengandung senyawa allicin yang memiliki sifat antioksidan dan antiinflamasi, mendukung sistem kekebalan tubuh, dan membantu menjaga kesehatan jantung. Bawang merah juga diyakini memiliki efek antimikroba dan antikanker. Dengan sifat-sifat ini, bawang merah bukan hanya sebagai bumbu penyedap, tetapi juga sebagai bahan makanan yang menyehatkan.', 'https://res.cloudinary.com/dohsfgda5/image/upload/v1705245877/wyfepgculu99d0qpsemd.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `nama`, `password`) VALUES
(4, 'annurriyadhus17@gmail.com', 'Annur', 'pbkdf2:sha256:600000$hDfbWnAdgLS8nroK$8f845ba86631eee8e39f4f43753f7eb89fec0965809794295b5dc1eb5afd49d8'),
(5, 'aji@gmail.com', 'Aji', 'pbkdf2:sha256:600000$nhQPUpkuaOxRIY5F$728922a376ec69476f878b4de8a793954fe51712ab8ec5acc4e239e1ac0d3587');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rempah`
--
ALTER TABLE `rempah`
  ADD PRIMARY KEY (`rempah_id`),
  ADD UNIQUE KEY `nama_rempah` (`nama_rempah`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `rempah`
--
ALTER TABLE `rempah`
  MODIFY `rempah_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
