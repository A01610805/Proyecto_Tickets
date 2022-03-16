-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-03-2022 a las 03:25:17
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10
 
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
 
 
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
 
--
-- Base de datos: `zebrands_tickets`
--
 
-- --------------------------------------------------------
 
--
-- Estructura de tabla para la tabla `categoria`
--
 
CREATE TABLE `categoria` (
  `ID_categoria` int(20) NOT NULL,
  `nombre_categoria` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `tiempo_estimado` int(5) NOT NULL COMMENT 'Días'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
 
-- --------------------------------------------------------
 
--
-- Estructura de tabla para la tabla `comentario`
--
 
CREATE TABLE `comentario` (
  `ID_comentario` int(20) NOT NULL,
  `texto_comentario` varchar(1000) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
 
-- --------------------------------------------------------
 
--
-- Estructura de tabla para la tabla `estado`
--
 
CREATE TABLE `estado` (
  `ID_estado` int(20) NOT NULL,
  `nombre_estado` varchar(40) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
 
-- --------------------------------------------------------
 
--
-- Estructura de tabla para la tabla `funcion`
--
 
CREATE TABLE `funcion` (
  `ID_funcion` int(20) NOT NULL,
  `ID_rol` int(20) NOT NULL,
  `nombre_funcion` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
 
-- --------------------------------------------------------
 
--
-- Estructura de tabla para la tabla `genera_ticket`
--
 
CREATE TABLE `genera_ticket` (
  `ID_ticket` int(20) NOT NULL,
  `ID_usuario` int(20) NOT NULL,
  `fecha_emision` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
 
-- --------------------------------------------------------
 
--
-- Estructura de tabla para la tabla `pregunta`
--
 
CREATE TABLE `pregunta` (
  `ID_pregunta` int(20) NOT NULL,
  `texto_pregunta` varchar(500) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
 
-- --------------------------------------------------------
 
--
-- Estructura de tabla para la tabla `prioridad`
--
 
CREATE TABLE `prioridad` (
  `ID_prioridad` int(20) NOT NULL,
  `nombre_prioridad` varchar(40) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
 
-- --------------------------------------------------------
 
--
-- Estructura de tabla para la tabla `respuesta`
--
 
CREATE TABLE `respuesta` (
  `ID_respuesta` int(20) NOT NULL,
  `ID_pregunta` int(20) NOT NULL,
  `texto_respuesta` varchar(1000) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
 
-- --------------------------------------------------------
 
--
-- Estructura de tabla para la tabla `resuelve_ticket`
--
 
CREATE TABLE `resuelve_ticket` (
  `ID_ticket` int(20) NOT NULL,
  `ID_usuario` int(20) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `comentarios_solucion` varchar(1000) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
 
-- --------------------------------------------------------
 
--
-- Estructura de tabla para la tabla `rol`
--
 
CREATE TABLE `rol` (
  `ID_rol` int(20) NOT NULL,
  `nombre_rol` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
 
-- --------------------------------------------------------
 
--
-- Estructura de tabla para la tabla `ticket`
--
 
CREATE TABLE `ticket` (
  `ID_ticket` int(20) NOT NULL,
  `ID_categoria` int(20) NOT NULL,
  `ID_respuesta` int(20) NOT NULL,
  `ID_estado` int(20) NOT NULL,
  `ID_prioridad` int(20) NOT NULL,
  `titulo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(400) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
 
-- --------------------------------------------------------
 
--
-- Estructura de tabla para la tabla `usuario`
--
 
CREATE TABLE `usuario` (
  `ID_usuario` int(20) NOT NULL,
  `ID_rol` int(20) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido_paterno` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido_materno` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
 
-- --------------------------------------------------------
 
--
-- Estructura de tabla para la tabla `usuario_comentario_ticket`
--
 
CREATE TABLE `usuario_comentario_ticket` (
  `ID_usuario` int(20) NOT NULL,
  `ID_comentario` int(20) NOT NULL,
  `ID_ticket` int(20) NOT NULL,
  `fecha_comentario` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
 
--
-- Volcado de datos para las tabla categoria.
--
 insert into categoria (ID_categoria, nombre_categoria, tiempo_estimado) values ('59779-058', 'system-worthy', '43961');
insert into categoria (ID_categoria, nombre_categoria, tiempo_estimado) values ('36987-2824', 'Expanded', '53');
insert into categoria (ID_categoria, nombre_categoria, tiempo_estimado) values ('61919-139', 'Profit-focused', '8966');
insert into categoria (ID_categoria, nombre_categoria, tiempo_estimado) values ('16590-276', 'internet solution', '51');
insert into categoria (ID_categoria, nombre_categoria, tiempo_estimado) values ('52125-507', 'customer loyalty', '9857');
insert into categoria (ID_categoria, nombre_categoria, tiempo_estimado) values ('62175-570', 'Persevering', '3');
insert into categoria (ID_categoria, nombre_categoria, tiempo_estimado) values ('0338-1133', 'functionalities', '26948');
insert into categoria (ID_categoria, nombre_categoria, tiempo_estimado) values ('64980-503', 'definition', '97');
insert into categoria (ID_categoria, nombre_categoria, tiempo_estimado) values ('60512-6006', 'Automated', '08743');
insert into categoria (ID_categoria, nombre_categoria, tiempo_estimado) values ('0071-0525', 'projection', '0787');

--
-- Volcado de datos para las tabla comentario.
--
insert into comentario (ID_comentario, texto_comentario) values ('13709-231', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('50742-209', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('64942-1052', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('0264-2201', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('11084-148', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('0173-0842', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('33342-048', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('68788-9203', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('51335-001', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('49221-0030', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('57664-275', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('53208-494', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('12753-930', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('49288-0165', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('68788-9176', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('24385-201', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('49035-026', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('687-0141', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('0126-0139', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('0071-0401', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('51452-010', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('49967-513', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('0078-0331', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('36987-3068', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('55312-381', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('53943-553', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('43406-0034', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('36987-2177', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('53247-330', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('79596-099', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('61715-038', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('76426-011', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('10096-0293', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('62742-4047', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('65224-802', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('0299-6100', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('66467-2000', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('0338-5003', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('52685-378', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('63304-460', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('16590-274', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('35356-187', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('0944-4351', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('21695-559', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('65224-545', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('59779-062', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('67046-268', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('49999-218', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('24909-106', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');
insert into comentario (ID_comentario, texto_comentario) values ('37808-238', 'Comentarios críticos. Aquellos que abordan un objeto o situación desde un punto de vista analítico, comprensivo, como parte de una exposición general mucho más grande.');

--
-- Volcado de datos para las tabla estado.
--
insert into estado (ID_estado, nombre_estado) values ('66116-419', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('21695-309', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('27293-030', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('16590-659', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('98132-667', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('61722-005', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('49999-815', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('0113-0994', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('0363-0198', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('66538-501', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('10812-441', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('10191-1826', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('44567-801', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('36987-1494', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('55711-064', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('50007-2000', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('0409-4203', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('0378-3110', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('60681-1075', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('49035-082', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('55648-762', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('60429-097', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('52125-796', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('33342-067', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('55154-3488', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('0406-0485', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('49349-983', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('42747-235', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('0078-0360', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('47335-151', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('55154-0082', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('52125-758', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('15127-001', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('55289-798', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('52410-3035', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('51672-4048', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('63868-143', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('55045-2092', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('54868-5534', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('0456-0679', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('0409-9302', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('63717-334', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('0078-0618', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('49371-040', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('61941-0032', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('49349-213', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('43853-0007', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('64679-742', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('0944-8402', 'Terminado.');
insert into estado (ID_estado, nombre_estado) values ('49288-0924', 'Terminado.');

--
-- Volcado de datos para las tabla funcion.
--
insert into funcion (ID_funcion, ID_rol, nombre_funcion) values ('65841-737', '48951-4011', 'Iniciar sesion en Plataforma');
insert into funcion (ID_funcion, ID_rol, nombre_funcion) values ('54575-081', '0088-2220', 'Iniciar sesion en Plataforma');
insert into funcion (ID_funcion, ID_rol, nombre_funcion) values ('68151-1602', '0904-5180', 'Iniciar sesion en Plataforma');
insert into funcion (ID_funcion, ID_rol, nombre_funcion) values ('0555-0658', '52125-534', 'Iniciar sesion en Plataforma');
insert into funcion (ID_funcion, ID_rol, nombre_funcion) values ('68196-194', '58281-563', 'Iniciar sesion en Plataforma');
insert into funcion (ID_funcion, ID_rol, nombre_funcion) values ('59623-001', '12634-465', 'Iniciar sesion en Plataforma');
insert into funcion (ID_funcion, ID_rol, nombre_funcion) values ('47993-200', '0781-9408', 'Iniciar sesion en Plataforma');
insert into funcion (ID_funcion, ID_rol, nombre_funcion) values ('57520-0051', '59535-9001', 'Iniciar sesion en Plataforma');
insert into funcion (ID_funcion, ID_rol, nombre_funcion) values ('68788-9834', '37000-061', 'Iniciar sesion en Plataforma');
insert into funcion (ID_funcion, ID_rol, nombre_funcion) values ('51285-126', '63868-047', 'Iniciar sesion en Plataforma');
insert into funcion (ID_funcion, ID_rol, nombre_funcion) values ('54868-1591', '68462-331', 'Iniciar sesion en Plataforma');
insert into funcion (ID_funcion, ID_rol, nombre_funcion) values ('10006-005', '0268-0898', 'Iniciar sesion en Plataforma');
insert into funcion (ID_funcion, ID_rol, nombre_funcion) values ('44911-0067', '31722-331', 'Iniciar sesion en Plataforma');
insert into funcion (ID_funcion, ID_rol, nombre_funcion) values ('58668-5371', '54272-103', 'Iniciar sesion en Plataforma');
insert into funcion (ID_funcion, ID_rol, nombre_funcion) values ('63868-252', '50742-123', 'Iniciar sesion en Plataforma');
insert into funcion (ID_funcion, ID_rol, nombre_funcion) values ('65055-501', '75835-268', 'Iniciar sesion en Plataforma');
insert into funcion (ID_funcion, ID_rol, nombre_funcion) values ('69191-500', '54632-004', 'Iniciar sesion en Plataforma');
insert into funcion (ID_funcion, ID_rol, nombre_funcion) values ('53113-218', '21220-122', 'Iniciar sesion en Plataforma');
insert into funcion (ID_funcion, ID_rol, nombre_funcion) values ('55154-7302', '67777-174', 'Iniciar sesion en Plataforma');
insert into funcion (ID_funcion, ID_rol, nombre_funcion) values ('68788-9713', '10056-704', 'Iniciar sesion en Plataforma');
--
-- Volcado de datos para las tabla genera_tickets.
--
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('51876395', '17287682', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('52390120', '09027442', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('73486668', '57701162', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('68811458', '62175083', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('66181393', '65749243', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('17763988', '14177934', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('81349365', '10224597', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('98143370', '16167496', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('58104328', '96321291', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('49835070', '50912435', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('47533289', '73962111', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('39361782', '29986860', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('80556582', '58149990', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('12633001', '60615281', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('92461245', '42747004', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('01727935', '58767015', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('33144699', '79465447', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('60970935', '39841419', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('03983717', '16747302', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('67105858', '55340725', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('76973878', '79492285', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('56037973', '73680533', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('00107835', '40947852', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('10818843', '07081707', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('17991055', '46012652', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('13560079', '10102420', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('58543244', '17803782', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('97053704', '14055034', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('33654640', '95433115', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('24230606', '79307595', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('13833727', '17833207', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('90247679', '84886188', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('34355387', '79080857', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('05467494', '88419948', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('39211725', '14293597', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('28835311', '39506121', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('23800850', '44887369', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('60051303', '42909026', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('35290093', '75482249', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('74076686', '70181813', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('97994608', '66105958', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('60637080', '63922032', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('84782492', '31212174', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('85370468', '15749129', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('06392721', '01521624', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('11745390', '07514688', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('51673046', '88845444', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('66369492', '22887629', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('34219592', '32970387', '09/09/99');
insert into genera_ticket (ID_ticket, ID_usuario, fecha_emision) values ('59941265', '67341932', '09/09/99');
--
-- Volcado de datos para las tabla pregunta.
--
insert into pregunta (ID_pregunta, texto_pregunta) values ('06256900', 'Cual es el ID de su pedido?');
insert into pregunta (ID_pregunta, texto_pregunta) values ('42256570', 'Cual es el ID de su pedido?');
insert into pregunta (ID_pregunta, texto_pregunta) values ('97328931', 'Cual es el ID de su pedido?');
insert into pregunta (ID_pregunta, texto_pregunta) values ('95255260', 'Cual es el ID de su pedido?');
insert into pregunta (ID_pregunta, texto_pregunta) values ('22175476', 'Cual es el ID de su pedido?');
insert into pregunta (ID_pregunta, texto_pregunta) values ('80559108', 'Cual es el ID de su pedido?');
insert into pregunta (ID_pregunta, texto_pregunta) values ('69730051', 'Cual es el ID de su pedido?');
insert into pregunta (ID_pregunta, texto_pregunta) values ('92218358', 'Cual es el ID de su pedido?');
insert into pregunta (ID_pregunta, texto_pregunta) values ('85767933', 'Cual es el ID de su pedido?');
insert into pregunta (ID_pregunta, texto_pregunta) values ('00072603', 'Cual es el ID de su pedido?');
insert into pregunta (ID_pregunta, texto_pregunta) values ('83252383', 'Cual es el ID de su pedido?');
insert into pregunta (ID_pregunta, texto_pregunta) values ('10129775', 'Cual es el ID de su pedido?');
insert into pregunta (ID_pregunta, texto_pregunta) values ('29686178', 'Cual es el ID de su pedido?');
insert into pregunta (ID_pregunta, texto_pregunta) values ('07920239', 'Cual es el ID de su pedido?');
insert into pregunta (ID_pregunta, texto_pregunta) values ('21744732', 'Cual es el ID de su pedido?');
insert into pregunta (ID_pregunta, texto_pregunta) values ('78043655', 'Cual es el ID de su pedido?');
insert into pregunta (ID_pregunta, texto_pregunta) values ('09787446', 'Cual es el ID de su pedido?');
insert into pregunta (ID_pregunta, texto_pregunta) values ('76984588', 'Cual es el ID de su pedido?');
insert into pregunta (ID_pregunta, texto_pregunta) values ('48674670', 'Cual es el ID de su pedido?');
insert into pregunta (ID_pregunta, texto_pregunta) values ('92321400', 'Cual es el ID de su pedido?');

--
-- Volcado de datos para las tabla prioridad.
--
insert into prioridad (ID_prioridad, nombre_prioridad) values ('95911251', 'Urgente');
insert into prioridad (ID_prioridad, nombre_prioridad) values ('37583978', 'Alto');
insert into prioridad (ID_prioridad, nombre_prioridad) values ('53936116', 'Medio');
insert into prioridad (ID_prioridad, nombre_prioridad) values ('62977252', 'Bajo');

--
-- Volcado de datos para las tabla respuesta.
--
insert into respuesta (ID_respuesta, ID_pregunta, texto_respuesta) values ('77809857', '69453285', 'El ID de mi pedido es 12839295');
insert into respuesta (ID_respuesta, ID_pregunta, texto_respuesta) values ('34322398', '68618738', 'El ID de mi pedido es 12839295');
insert into respuesta (ID_respuesta, ID_pregunta, texto_respuesta) values ('93926811', '25694199', 'El ID de mi pedido es 12839295');
insert into respuesta (ID_respuesta, ID_pregunta, texto_respuesta) values ('54328498', '37109690', 'El ID de mi pedido es 12839295');
insert into respuesta (ID_respuesta, ID_pregunta, texto_respuesta) values ('38322770', '35520441', 'El ID de mi pedido es 12839295');
insert into respuesta (ID_respuesta, ID_pregunta, texto_respuesta) values ('42435506', '76099668', 'El ID de mi pedido es 12839295');
insert into respuesta (ID_respuesta, ID_pregunta, texto_respuesta) values ('39282161', '48227867', 'El ID de mi pedido es 12839295');
insert into respuesta (ID_respuesta, ID_pregunta, texto_respuesta) values ('62562848', '06375272', 'El ID de mi pedido es 12839295');
insert into respuesta (ID_respuesta, ID_pregunta, texto_respuesta) values ('80325291', '66507286', 'El ID de mi pedido es 12839295');
insert into respuesta (ID_respuesta, ID_pregunta, texto_respuesta) values ('71413424', '23675492', 'El ID de mi pedido es 12839295');
insert into respuesta (ID_respuesta, ID_pregunta, texto_respuesta) values ('83680502', '36223929', 'El ID de mi pedido es 12839295');
insert into respuesta (ID_respuesta, ID_pregunta, texto_respuesta) values ('33158354', '42653023', 'El ID de mi pedido es 12839295');
insert into respuesta (ID_respuesta, ID_pregunta, texto_respuesta) values ('32181520', '51164580', 'El ID de mi pedido es 12839295');
insert into respuesta (ID_respuesta, ID_pregunta, texto_respuesta) values ('89546505', '51270796', 'El ID de mi pedido es 12839295');
insert into respuesta (ID_respuesta, ID_pregunta, texto_respuesta) values ('28542122', '78651902', 'El ID de mi pedido es 12839295');
insert into respuesta (ID_respuesta, ID_pregunta, texto_respuesta) values ('61780542', '50202335', 'El ID de mi pedido es 12839295');
insert into respuesta (ID_respuesta, ID_pregunta, texto_respuesta) values ('68025140', '01871682', 'El ID de mi pedido es 12839295');
insert into respuesta (ID_respuesta, ID_pregunta, texto_respuesta) values ('58053358', '33072825', 'El ID de mi pedido es 12839295');
insert into respuesta (ID_respuesta, ID_pregunta, texto_respuesta) values ('36455056', '20178901', 'El ID de mi pedido es 12839295');
insert into respuesta (ID_respuesta, ID_pregunta, texto_respuesta) values ('67531988', '05325902', 'El ID de mi pedido es 12839295');

--
-- Volcado de datos para las tabla resuelve_ticket.
--
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('14388836', '45490699', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('44696714', '68586844', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('92970579', '57048100', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('42179903', '06088916', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('94921791', '22169205', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('37182102', '03232491', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('97962691', '55157144', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('48831739', '76687916', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('84393308', '19759733', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('21545126', '77422736', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('10834250', '56784176', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('55588522', '61243884', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('52840598', '19661643', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('21054576', '63902739', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('22903445', '45843905', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('67302709', '70832784', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('38941078', '40551117', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('29633785', '99034584', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('16986840', '26801828', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('78187633', '24081369', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('74437891', '01355354', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('66085462', '27712377', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('23318111', '50515581', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('49044038', '63140717', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('56355782', '27207678', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('60970101', '02968955', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('04719982', '84089878', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('26063978', '40778079', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('06293471', '14547165', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('29015901', '34306305', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('90038636', '07201047', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('33249408', '55121292', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('05722758', '38029259', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('72547553', '98618076', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('64136038', '19587679', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('49126099', '79637822', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('37437260', '40595099', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('31157273', '64618218', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('28381802', '70994242', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('05494253', '16075445', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('99808346', '02157302', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('44312382', '50388936', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('73940548', '51241774', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('10903407', '44645718', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('62410327', '26630103', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('55026888', '11522665', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('33894292', '01408980', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('00278519', '05704024', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('99639319', '11276850', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');
insert into resuelve_ticket (ID_ticket, ID_usuario, fecha_inicio, fecha_fin, comentarios_solucion) values ('62879558', '79841984', '09/09/99', '09/10/99', 'No hubo problemas al resolver este ticket');

--
-- Volcado de datos para las tabla rol.
--
insert into rol (ID_rol, nombre_rol) values ('99561174', 'Administrador');
insert into rol (ID_rol, nombre_rol) values ('56004268', 'Soporte');
insert into rol (ID_rol, nombre_rol) values ('38932072', 'Empleado');

--
-- Volcado de datos para las tabla ticket.
--
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('40502169', '28709029', '76129828', '68503452', '62256447', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('91908800', '06026398', '82170475', '45966741', '21884024', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('00879914', '54787519', '67559839', '15478517', '61281190', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('79633964', '13521520', '91517609', '70330039', '51254981', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('89572926', '87410988', '36279519', '63041047', '52246982', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('04816167', '50426318', '79759550', '86055540', '28697708', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('63563918', '54037692', '44275728', '34706074', '77047055', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('69258591', '16419065', '22925698', '41149611', '64087660', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('45278723', '54719850', '88673096', '26014902', '09073341', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('92507422', '02311396', '59791709', '94389431', '09980438', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('86694017', '56991063', '57283952', '63032080', '73061441', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('97699910', '67785579', '13184722', '71269282', '96028492', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('11766325', '91604681', '29006561', '85135813', '07658838', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('72348502', '92027070', '66778161', '39540473', '99164358', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('72495669', '52460339', '90742640', '58657393', '67857626', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('66990574', '63887374', '70766254', '64563969', '66454910', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('03109562', '86791507', '17274690', '20412043', '29749363', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('75542867', '89270242', '65267714', '61346805', '72883689', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('86953133', '21248479', '97450460', '87974293', '12487162', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('53727692', '99063991', '14669533', '87666955', '85694399', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('80031207', '90669456', '02622265', '11792936', '42518359', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('64474027', '18245329', '77874346', '13650422', '73169370', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('97572673', '87213617', '71986799', '08431245', '51306077', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('31115868', '91072025', '14370663', '74017288', '37385116', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('18331062', '09550605', '03771518', '11202378', '48463563', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('08055524', '70638210', '76904423', '27501114', '19509672', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('22528600', '02801401', '18588759', '65829690', '12213633', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('33145663', '51157812', '85226374', '94201309', '24585173', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('84520488', '16794966', '42136007', '51695893', '48931625', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('48155823', '04370655', '90987546', '72994608', '28573235', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('14160430', '47621815', '66733613', '02230452', '50794863', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('12297009', '79765021', '00267909', '91653674', '89243783', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('35271180', '57472357', '32686267', '40876451', '77203963', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('66515988', '13596517', '28977981', '38925652', '45113905', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('12163362', '97744941', '73510053', '92833737', '81836848', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('95248753', '67558278', '82639604', '20697651', '03289888', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('71337312', '93972886', '91316935', '76131609', '51955111', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('09779997', '73833768', '80379506', '41298338', '65383061', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('17854276', '28000567', '71031458', '04696547', '12617921', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('65079724', '11234746', '53535887', '03199315', '88662651', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('18122518', '12457768', '30986102', '90754479', '46646839', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('66805970', '02454503', '08866904', '71839564', '95378917', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('27560486', '69056307', '05379565', '52445262', '95744014', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('70370919', '28311686', '61688255', '47464735', '98802750', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('92496014', '77405649', '58917728', '13187769', '09243036', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('47773702', '27367961', '27089707', '68072091', '52943297', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('78516509', '17534860', '45646286', '49272684', '91519337', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('12195552', '24836439', '16823983', '16445441', '40435703', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('78645694', '49877946', '04285626', '37888182', '42526195', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');
insert into ticket (ID_ticket, ID_categoria, ID_respuesta, ID_estado, ID_prioridad, titulo, descripcion) values ('36598457', '77087875', '60490172', '15706461', '13418557', 'Problemas en su interfaz', 'Tuve varios problemas con el envio ya que se esta tardando mas de lo normal');

--
-- Volcado de datos para las tabla usuario.
--
insert into usuario (ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) values ('89982150', '07957147', 'Granger', 'Fenimore', 'Taylerson', 'gtaylerson0@geocities.jp', '52m40g0z2');
insert into usuario (ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) values ('50883586', '61958487', 'Tallia', 'Beckson', 'Severwright', 'tseverwright1@soundcloud.com', '74s66u4n2');
insert into usuario (ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) values ('99680547', '68627504', 'Royal', 'Pynner', 'Speck', 'rspeck2@arstechnica.com', '94l35v5p0');
insert into usuario (ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) values ('52937954', '65115572', 'Mariquilla', 'Stansfield', 'Ivel', 'mivel3@1688.com', '54i12z5i2');
insert into usuario (ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) values ('18173126', '95376186', 'Kipp', 'Gricewood', 'Clancy', 'kclancy4@paypal.com', '81k97t9n1');
insert into usuario (ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) values ('03360800', '34301603', 'Tyrone', 'Markey', 'Larwood', 'tlarwood5@simplemachines.org', '64q84k0s3');
insert into usuario (ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) values ('21802875', '90565677', 'Consolata', 'Warham', 'Tremblay', 'ctremblay6@elpais.com', '57g02d0b8');
insert into usuario (ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) values ('25706537', '92672204', 'Ellyn', 'Scullion', 'Raylton', 'eraylton7@topsy.com', '34a78f5g2');
insert into usuario (ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) values ('95953548', '24021083', 'Fannie', 'Mycock', 'Grogor', 'fgrogor8@over-blog.com', '03q92u3b2');
insert into usuario (ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) values ('31166580', '16022899', 'Maridel', 'Pickance', 'Barosch', 'mbarosch9@icq.com', '45m91v4s1');
insert into usuario (ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) values ('16348084', '70058529', 'Trista', 'Plunkett', 'Teresia', 'tteresiaa@statcounter.com', '76m33x7s2');
insert into usuario (ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) values ('38630777', '54574255', 'Violetta', 'Wieprecht', 'Bummfrey', 'vbummfreyb@tinyurl.com', '55q12h1g7');
insert into usuario (ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) values ('64771182', '00818503', 'Johnny', 'Exton', 'McCarly', 'jmccarlyc@ezinearticles.com', '94x43k2c4');
insert into usuario (ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) values ('99312815', '26365279', 'Granthem', 'Petigrew', 'Emilien', 'gemiliend@fotki.com', '71o39b1g1');
insert into usuario (ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) values ('28509622', '14747375', 'Leif', 'Skeermer', 'Knolles-Green', 'lknollesgreene@archive.org', '17d27d3q7');
insert into usuario (ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) values ('29184795', '08789973', 'Catherine', 'Wilbraham', 'Stubs', 'cstubsf@google.es', '49z43i5l7');
insert into usuario (ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) values ('61699827', '09339898', 'Karissa', 'Raiston', 'Leveritt', 'kleverittg@slate.com', '60a46s8r3');
insert into usuario (ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) values ('41938455', '17576723', 'Maggie', 'Braunter', 'Recher', 'mrecherh@pagesperso-orange.fr', '35r28q9p2');
insert into usuario (ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) values ('26046247', '80949684', 'Mikel', 'Consadine', 'Reidie', 'mreidiei@oracle.com', '02e44d1g6');
insert into usuario (ID_usuario, ID_rol, nombre, apellido_paterno, apellido_materno, correo, password) values ('44439332', '83681000', 'Lynette', 'Baxstare', 'Maxweell', 'lmaxweellj@businessweek.com', '10b08x7p9');

--
-- Volcado de datos para las tabla usuario_comenta_tickets.
--

insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('53603874', '51142898', '05145407', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('41839108', '91806616', '25093197', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('03282146', '28262789', '19251005', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('22605893', '98294561', '03499823', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('43364991', '24904611', '68956633', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('78355360', '27077961', '58374554', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('86630793', '11814411', '33572887', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('53142526', '59065612', '23312490', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('66693069', '54206860', '92505063', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('56915948', '10358690', '91272351', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('60714012', '40023381', '96124067', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('21678173', '98477718', '94303335', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('19050339', '35037737', '42713314', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('37319523', '15032528', '78983870', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('55550728', '42303134', '74978613', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('81186692', '70165794', '17435460', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('36212459', '68146604', '68107824', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('61870131', '11561532', '69782857', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('11198502', '52873549', '48235451', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('96458299', '93534146', '65324305', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('74408267', '02118773', '25798149', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('61799810', '23284697', '15201435', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('13281070', '37141739', '75544240', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('31716417', '55205151', '49226654', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('59816856', '41635444', '95953621', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('03670980', '16387471', '14557711', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('01391901', '15219704', '64765932', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('05616949', '17023958', '80081960', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('74006116', '06552638', '39585543', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('33054683', '76957023', '58288537', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('03332115', '00417481', '25790557', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('40899152', '50243004', '74418342', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('04647058', '75366065', '17298297', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('31214068', '62496170', '92234231', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('84507306', '69869635', '14547656', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('74188870', '47941244', '33321864', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('34011561', '50759897', '01615532', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('16933509', '26078889', '93369280', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('17674858', '16751072', '20756254', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('96224906', '33455292', '98134095', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('60160822', '35880075', '35698664', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('74971043', '44303000', '94534296', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('65086746', '69074995', '37183237', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('19210019', '15101968', '17743509', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('28321483', '07663009', '27296176', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('23323581', '65095596', '48809962', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('34771253', '23976455', '95390732', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('14403685', '67768719', '06427628', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('27843833', '66700559', '63520816', '09/09/99');
insert into usuario_comentario_ticket (ID_usuario, ID_comentario, ID_ticket, fecha_comentario) values ('56174705', '46845351', '36313280', '09/09/99');


--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`ID_categoria`);
 
--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`ID_comentario`);
 
--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`ID_estado`);
 
--
-- Indices de la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD PRIMARY KEY (`ID_funcion`),
  ADD KEY `ID_rol` (`ID_rol`);
 
--
-- Indices de la tabla `genera_ticket`
--
ALTER TABLE `genera_ticket`
  ADD PRIMARY KEY (`ID_ticket`,`ID_usuario`) USING BTREE,
  ADD KEY `ID_usuario_2` (`ID_usuario`),
  ADD KEY `ID_ticket` (`ID_ticket`);
 
--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`ID_pregunta`);
 
--
-- Indices de la tabla `prioridad`
--
ALTER TABLE `prioridad`
  ADD PRIMARY KEY (`ID_prioridad`);
 
--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`ID_respuesta`),
  ADD KEY `ID_pregunta` (`ID_pregunta`);
 
--
-- Indices de la tabla `resuelve_ticket`
--
ALTER TABLE `resuelve_ticket`
  ADD PRIMARY KEY (`ID_ticket`,`ID_usuario`) USING BTREE,
  ADD KEY `ID_usuario` (`ID_usuario`),
  ADD KEY `ID_ticket` (`ID_ticket`);
 
--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`ID_rol`);
 
--
-- Indices de la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ID_ticket`),
  ADD KEY `ID_categoria` (`ID_categoria`),
  ADD KEY `ID_respuesta` (`ID_respuesta`),
  ADD KEY `ID_estado` (`ID_estado`),
  ADD KEY `ID_prioridad` (`ID_prioridad`);
 
--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_usuario`),
  ADD KEY `ID_rol` (`ID_rol`);
 
--
-- Indices de la tabla `usuario_comentario_ticket`
--
ALTER TABLE `usuario_comentario_ticket`
  ADD PRIMARY KEY (`ID_usuario`,`ID_comentario`,`ID_ticket`),
  ADD KEY `ID_ticket` (`ID_ticket`),
  ADD KEY `ID_comentario` (`ID_comentario`),
  ADD KEY `ID_usuario` (`ID_usuario`);
 
--
-- AUTO_INCREMENT de las tablas volcadas
--
 
--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `ID_categoria` int(20) NOT NULL AUTO_INCREMENT;
 
--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `ID_comentario` int(20) NOT NULL AUTO_INCREMENT;
 
--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `ID_estado` int(20) NOT NULL AUTO_INCREMENT;
 
--
-- AUTO_INCREMENT de la tabla `funcion`
--
ALTER TABLE `funcion`
  MODIFY `ID_funcion` int(20) NOT NULL AUTO_INCREMENT;
 
--
-- AUTO_INCREMENT de la tabla `genera_ticket`
--
ALTER TABLE `genera_ticket`
  MODIFY `ID_ticket` int(20) NOT NULL AUTO_INCREMENT;
 
--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `ID_pregunta` int(20) NOT NULL AUTO_INCREMENT;
 
--
-- AUTO_INCREMENT de la tabla `prioridad`
--
ALTER TABLE `prioridad`
  MODIFY `ID_prioridad` int(20) NOT NULL AUTO_INCREMENT;
 
--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `ID_respuesta` int(20) NOT NULL AUTO_INCREMENT;
 
--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `ID_rol` int(20) NOT NULL AUTO_INCREMENT;
 
--
-- AUTO_INCREMENT de la tabla `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ID_ticket` int(20) NOT NULL AUTO_INCREMENT;
 
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_usuario` int(20) NOT NULL AUTO_INCREMENT;
 
--
-- Restricciones para tablas volcadas
--
 
--
-- Filtros para la tabla `funcion`
--
ALTER TABLE `funcion`
  ADD CONSTRAINT `funcion_ibfk_1` FOREIGN KEY (`ID_rol`) REFERENCES `rol` (`ID_rol`) ON UPDATE CASCADE;
 
--
-- Filtros para la tabla `genera_ticket`
--
ALTER TABLE `genera_ticket`
  ADD CONSTRAINT `genera_ticket_ibfk_1` FOREIGN KEY (`ID_ticket`) REFERENCES `ticket` (`ID_ticket`) ON UPDATE CASCADE,
  ADD CONSTRAINT `genera_ticket_ibfk_2` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`) ON UPDATE CASCADE;
 
--
-- Filtros para la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD CONSTRAINT `respuesta_ibfk_1` FOREIGN KEY (`ID_pregunta`) REFERENCES `pregunta` (`ID_pregunta`) ON UPDATE CASCADE;
 
--
-- Filtros para la tabla `resuelve_ticket`
--
ALTER TABLE `resuelve_ticket`
  ADD CONSTRAINT `resuelve_ticket_ibfk_1` FOREIGN KEY (`ID_ticket`) REFERENCES `ticket` (`ID_ticket`) ON UPDATE CASCADE,
  ADD CONSTRAINT `resuelve_ticket_ibfk_2` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`) ON UPDATE CASCADE;
 
--
-- Filtros para la tabla `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`ID_categoria`) REFERENCES `categoria` (`ID_categoria`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`ID_respuesta`) REFERENCES `respuesta` (`ID_respuesta`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_3` FOREIGN KEY (`ID_estado`) REFERENCES `estado` (`ID_estado`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ticket_ibfk_4` FOREIGN KEY (`ID_prioridad`) REFERENCES `prioridad` (`ID_prioridad`) ON UPDATE CASCADE;
 
--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`ID_rol`) REFERENCES `rol` (`ID_rol`) ON UPDATE CASCADE;
 
--
-- Filtros para la tabla `usuario_comentario_ticket`
--
ALTER TABLE `usuario_comentario_ticket`
  ADD CONSTRAINT `usuario_comentario_ticket_ibfk_1` FOREIGN KEY (`ID_ticket`) REFERENCES `ticket` (`ID_ticket`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_comentario_ticket_ibfk_2` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`) ON UPDATE CASCADE,
  ADD CONSTRAINT `usuario_comentario_ticket_ibfk_3` FOREIGN KEY (`ID_comentario`) REFERENCES `comentario` (`ID_comentario`) ON UPDATE CASCADE;
COMMIT;
 
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
