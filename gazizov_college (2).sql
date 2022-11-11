-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Ноя 11 2022 г., 13:20
-- Версия сервера: 5.7.39
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `gazizov_college`
--

-- --------------------------------------------------------

--
-- Структура таблицы `gazizov_classroom`
--

CREATE TABLE `gazizov_classroom` (
  `classroom_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `gazizov_classroom`
--

INSERT INTO `gazizov_classroom` (`classroom_id`, `name`) VALUES
(1, '1 корпус'),
(2, '2 корпус'),
(3, '3 корпус');

-- --------------------------------------------------------

--
-- Структура таблицы `gazizov_course`
--

CREATE TABLE `gazizov_course` (
  `course_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `special_id` int(11) NOT NULL,
  `hours` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `gazizov_course`
--

INSERT INTO `gazizov_course` (`course_id`, `name`, `special_id`, `hours`) VALUES
(1, 'Основы алгоритмизации', 1, 90),
(2, 'Электротехника', 3, 106),
(3, 'Основы алгоритмизации', 5, 52),
(4, 'Мультимедиа технология', 1, 36),
(5, 'Техническая механика', 6, 96),
(6, 'Промышленная электротехника', 4, 108),
(7, 'Автоматизированные информационные системы', 1, 86);

-- --------------------------------------------------------

--
-- Структура таблицы `gazizov_day`
--

CREATE TABLE `gazizov_day` (
  `day_id` tinyint(4) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `gazizov_day`
--

INSERT INTO `gazizov_day` (`day_id`, `name`) VALUES
(1, 'Понедельник'),
(2, 'Вторник'),
(3, 'Среда'),
(4, 'Четверг'),
(5, 'Пятница'),
(6, 'Суббота'),
(7, 'Воскресенье');

-- --------------------------------------------------------

--
-- Структура таблицы `gazizov_gender`
--

CREATE TABLE `gazizov_gender` (
  `gender_id` tinyint(4) NOT NULL,
  `name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `gazizov_gender`
--

INSERT INTO `gazizov_gender` (`gender_id`, `name`) VALUES
(1, 'Мужской'),
(2, 'Женский');

-- --------------------------------------------------------

--
-- Структура таблицы `gazizov_graduate`
--

CREATE TABLE `gazizov_graduate` (
  `graduate_id` int(11) NOT NULL,
  `gruppa_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `gazizov_graduate`
--

INSERT INTO `gazizov_graduate` (`graduate_id`, `gruppa_id`, `course_id`, `user_id`) VALUES
(1, 1, 7, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 5, 4),
(5, 5, 6, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `gazizov_graduate_time`
--

CREATE TABLE `gazizov_graduate_time` (
  `graduate_time_id` int(11) NOT NULL,
  `graduate_id` int(11) NOT NULL,
  `day_id` tinyint(4) NOT NULL,
  `lesson_num_id` int(11) NOT NULL,
  `classroom_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `gazizov_graduate_time`
--

INSERT INTO `gazizov_graduate_time` (`graduate_time_id`, `graduate_id`, `day_id`, `lesson_num_id`, `classroom_id`) VALUES
(1, 1, 1, 1, 1),
(2, 2, 2, 2, 2),
(3, 3, 3, 3, 3),
(4, 4, 4, 4, 2),
(5, 5, 5, 5, 1),
(6, 2, 2, 4, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `gazizov_gruppa`
--

CREATE TABLE `gazizov_gruppa` (
  `gruppa_id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `special_id` int(11) NOT NULL,
  `date_begin` date NOT NULL,
  `date_end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `gazizov_gruppa`
--

INSERT INTO `gazizov_gruppa` (`gruppa_id`, `name`, `special_id`, `date_begin`, `date_end`) VALUES
(1, '101 ИС', 1, '2016-09-01', '2020-07-01'),
(2, '102 АС', 3, '2016-09-01', '2020-07-01'),
(3, '302 ИС', 1, '2014-09-01', '2018-07-01'),
(4, '302 АС', 3, '2014-09-01', '2018-07-01'),
(5, '202 С', 6, '2015-09-01', '2019-07-01'),
(6, '404 П', 5, '2014-09-01', '2017-07-01'),
(7, '303 ЭЛ', 4, '2014-09-01', '2018-07-01');

-- --------------------------------------------------------

--
-- Структура таблицы `gazizov_lesson_num`
--

CREATE TABLE `gazizov_lesson_num` (
  `lesson_num_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `time_lesson` time NOT NULL,
  `year_lesson` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `gazizov_lesson_num`
--

INSERT INTO `gazizov_lesson_num` (`lesson_num_id`, `name`, `time_lesson`, `year_lesson`) VALUES
(1, 'Информационные системы', '08:00:00', 2022),
(2, 'Технические специальности', '13:00:00', 2022),
(3, 'Основы алгоритмизации', '15:00:00', 2022),
(4, 'Электроснабжение', '17:30:00', 2022),
(5, 'Программное обеспечение ВТ и ПО', '19:30:00', 2022),
(6, 'Промышленная электротехника', '11:00:00', 2022);

-- --------------------------------------------------------

--
-- Структура таблицы `gazizov_otdel`
--

CREATE TABLE `gazizov_otdel` (
  `otdel_id` smallint(6) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `gazizov_otdel`
--

INSERT INTO `gazizov_otdel` (`otdel_id`, `name`) VALUES
(1, 'Информационные системы'),
(2, 'Технические специальности'),
(3, 'Автоматизация и управление');

-- --------------------------------------------------------

--
-- Структура таблицы `gazizov_special`
--

CREATE TABLE `gazizov_special` (
  `special_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `otdel_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `gazizov_special`
--

INSERT INTO `gazizov_special` (`special_id`, `name`, `otdel_id`) VALUES
(1, 'Информационные системы', 1),
(2, 'Нефтегазовое дело', 2),
(3, 'Автоматизация и управление', 3),
(4, 'Электроснабжение', 3),
(5, 'Программное обеспечение ВТ и ПО', 1),
(6, 'Строительство и эксплуатация зданий и сооружений', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `gazizov_student`
--

CREATE TABLE `gazizov_student` (
  `user_id` bigint(20) NOT NULL,
  `gruppa_id` int(11) NOT NULL,
  `num_zach` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `gazizov_student`
--

INSERT INTO `gazizov_student` (`user_id`, `gruppa_id`, `num_zach`) VALUES
(6, 1, 'К1020'),
(7, 2, 'А5292'),
(8, 2, 'В8578'),
(9, 5, 'Р5285'),
(10, 4, 'Ф5285'),
(11, 1, 'К7485'),
(12, 3, 'А2585');

-- --------------------------------------------------------

--
-- Структура таблицы `gazizov_teacher`
--

CREATE TABLE `gazizov_teacher` (
  `user_id` bigint(20) NOT NULL,
  `otdel_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `gazizov_teacher`
--

INSERT INTO `gazizov_teacher` (`user_id`, `otdel_id`) VALUES
(1, 1),
(2, 1),
(3, 2),
(5, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Структура таблицы `gazizov_user`
--

CREATE TABLE `gazizov_user` (
  `user_id` bigint(20) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `patronomic` varchar(50) NOT NULL,
  `login` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `gender_id` tinyint(4) NOT NULL,
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `gazizov_user`
--

INSERT INTO `gazizov_user` (`user_id`, `lastname`, `firstname`, `patronomic`, `login`, `pass`, `gender_id`, `birthday`) VALUES
(1, 'Иванов', 'Иван', 'Иванович', 'IIIone', 'zuzuzu', 1, '1975-05-25'),
(2, 'Петров', 'Петр', 'Петрович', 'PPPetr', 'asdfjkl', 1, '1980-10-06'),
(3, 'Козлов', 'Иван', 'Афанасьевич', 'qwerty', 'zxcvbn', 1, '1985-04-15'),
(4, 'Чурюмова', 'Кристина', 'Федоровна', 'kristina90', 'df5sd48ef65ds', 2, '1990-05-20'),
(5, 'Васильев', 'Феофан', 'Александрович', 'feofan', 'vasilev91', 1, '1991-01-13'),
(6, 'Федорова', 'Милана', 'Андреевна', 'milamilana', 'dsfsdewr323', 2, '1998-04-15'),
(7, 'Нуржанов', 'Нуржан', 'Нуржанович', 'NNN', 'sdflae324', 1, '1999-09-18'),
(8, 'Канатов', 'Канат', 'Канатович', 'ККК', 'dslfjseif32', 1, '1999-07-07'),
(9, 'Золотая', 'Ирина', 'Кайратовна', 'subzero', 'neangime', 2, '2000-09-14'),
(10, 'Серая', 'Арина', 'Радионовна', 'gray', 'sdfew3221354', 2, '2001-10-29'),
(11, 'Петухов', 'Виталий', 'Фадеевич', 'kokoko', 'dsfdsf234', 1, '2000-02-20'),
(12, 'Котова', 'Аурелия', 'Ароновна', 'MeowMeow', 'nyanya1234568789', 2, '2002-12-19');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `gazizov_classroom`
--
ALTER TABLE `gazizov_classroom`
  ADD PRIMARY KEY (`classroom_id`);

--
-- Индексы таблицы `gazizov_course`
--
ALTER TABLE `gazizov_course`
  ADD PRIMARY KEY (`course_id`),
  ADD KEY `special_id` (`special_id`);

--
-- Индексы таблицы `gazizov_day`
--
ALTER TABLE `gazizov_day`
  ADD PRIMARY KEY (`day_id`);

--
-- Индексы таблицы `gazizov_gender`
--
ALTER TABLE `gazizov_gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Индексы таблицы `gazizov_graduate`
--
ALTER TABLE `gazizov_graduate`
  ADD PRIMARY KEY (`graduate_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `gruppa_id` (`gruppa_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Индексы таблицы `gazizov_graduate_time`
--
ALTER TABLE `gazizov_graduate_time`
  ADD PRIMARY KEY (`graduate_time_id`),
  ADD KEY `classroom_id` (`classroom_id`),
  ADD KEY `day_id` (`day_id`),
  ADD KEY `graduate_id` (`graduate_id`),
  ADD KEY `lesson_num_id` (`lesson_num_id`);

--
-- Индексы таблицы `gazizov_gruppa`
--
ALTER TABLE `gazizov_gruppa`
  ADD PRIMARY KEY (`gruppa_id`),
  ADD KEY `special_id` (`special_id`);

--
-- Индексы таблицы `gazizov_lesson_num`
--
ALTER TABLE `gazizov_lesson_num`
  ADD PRIMARY KEY (`lesson_num_id`);

--
-- Индексы таблицы `gazizov_otdel`
--
ALTER TABLE `gazizov_otdel`
  ADD PRIMARY KEY (`otdel_id`);

--
-- Индексы таблицы `gazizov_special`
--
ALTER TABLE `gazizov_special`
  ADD PRIMARY KEY (`special_id`),
  ADD KEY `otdel_id` (`otdel_id`);

--
-- Индексы таблицы `gazizov_student`
--
ALTER TABLE `gazizov_student`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `gruppa_id` (`gruppa_id`);

--
-- Индексы таблицы `gazizov_teacher`
--
ALTER TABLE `gazizov_teacher`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `otdel_id` (`otdel_id`);

--
-- Индексы таблицы `gazizov_user`
--
ALTER TABLE `gazizov_user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `gender_id` (`gender_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `gazizov_classroom`
--
ALTER TABLE `gazizov_classroom`
  MODIFY `classroom_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `gazizov_course`
--
ALTER TABLE `gazizov_course`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `gazizov_day`
--
ALTER TABLE `gazizov_day`
  MODIFY `day_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `gazizov_gender`
--
ALTER TABLE `gazizov_gender`
  MODIFY `gender_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `gazizov_graduate`
--
ALTER TABLE `gazizov_graduate`
  MODIFY `graduate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `gazizov_graduate_time`
--
ALTER TABLE `gazizov_graduate_time`
  MODIFY `graduate_time_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `gazizov_gruppa`
--
ALTER TABLE `gazizov_gruppa`
  MODIFY `gruppa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `gazizov_lesson_num`
--
ALTER TABLE `gazizov_lesson_num`
  MODIFY `lesson_num_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `gazizov_otdel`
--
ALTER TABLE `gazizov_otdel`
  MODIFY `otdel_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `gazizov_special`
--
ALTER TABLE `gazizov_special`
  MODIFY `special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `gazizov_user`
--
ALTER TABLE `gazizov_user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `gazizov_course`
--
ALTER TABLE `gazizov_course`
  ADD CONSTRAINT `gazizov_course_ibfk_1` FOREIGN KEY (`special_id`) REFERENCES `gazizov_special` (`special_id`);

--
-- Ограничения внешнего ключа таблицы `gazizov_graduate`
--
ALTER TABLE `gazizov_graduate`
  ADD CONSTRAINT `gazizov_graduate_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `gazizov_course` (`course_id`),
  ADD CONSTRAINT `gazizov_graduate_ibfk_2` FOREIGN KEY (`gruppa_id`) REFERENCES `gazizov_gruppa` (`gruppa_id`),
  ADD CONSTRAINT `gazizov_graduate_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `gazizov_teacher` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `gazizov_graduate_time`
--
ALTER TABLE `gazizov_graduate_time`
  ADD CONSTRAINT `gazizov_graduate_time_ibfk_1` FOREIGN KEY (`classroom_id`) REFERENCES `gazizov_classroom` (`classroom_id`),
  ADD CONSTRAINT `gazizov_graduate_time_ibfk_2` FOREIGN KEY (`day_id`) REFERENCES `gazizov_day` (`day_id`),
  ADD CONSTRAINT `gazizov_graduate_time_ibfk_3` FOREIGN KEY (`graduate_id`) REFERENCES `gazizov_graduate` (`graduate_id`),
  ADD CONSTRAINT `gazizov_graduate_time_ibfk_4` FOREIGN KEY (`lesson_num_id`) REFERENCES `gazizov_lesson_num` (`lesson_num_id`);

--
-- Ограничения внешнего ключа таблицы `gazizov_gruppa`
--
ALTER TABLE `gazizov_gruppa`
  ADD CONSTRAINT `gazizov_gruppa_ibfk_1` FOREIGN KEY (`special_id`) REFERENCES `gazizov_special` (`special_id`);

--
-- Ограничения внешнего ключа таблицы `gazizov_special`
--
ALTER TABLE `gazizov_special`
  ADD CONSTRAINT `gazizov_special_ibfk_1` FOREIGN KEY (`otdel_id`) REFERENCES `gazizov_otdel` (`otdel_id`);

--
-- Ограничения внешнего ключа таблицы `gazizov_student`
--
ALTER TABLE `gazizov_student`
  ADD CONSTRAINT `gazizov_student_ibfk_1` FOREIGN KEY (`gruppa_id`) REFERENCES `gazizov_gruppa` (`gruppa_id`),
  ADD CONSTRAINT `gazizov_student_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `gazizov_user` (`user_id`);

--
-- Ограничения внешнего ключа таблицы `gazizov_teacher`
--
ALTER TABLE `gazizov_teacher`
  ADD CONSTRAINT `gazizov_teacher_ibfk_1` FOREIGN KEY (`otdel_id`) REFERENCES `gazizov_otdel` (`otdel_id`),
  ADD CONSTRAINT `gazizov_teacher_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `gazizov_user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `gazizov_user`
--
ALTER TABLE `gazizov_user`
  ADD CONSTRAINT `gazizov_user_ibfk_1` FOREIGN KEY (`gender_id`) REFERENCES `gazizov_gender` (`gender_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
