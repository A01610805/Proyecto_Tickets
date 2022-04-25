-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-04-2022 a las 17:57:01
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

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GenerarTicket` (IN `U_idcategoria` INT, IN `U_titulo` VARCHAR(100) CHARSET utf8, IN `U_descripcion` VARCHAR(400) CHARSET utf8)  NO SQL
INSERT INTO ticket VALUES (NULL, U_idcategoria, 1, 1, (U_titulo COLLATE utf8_spanish2_ci), (U_descripcion COLLATE utf8_spanish2_ci))$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistraFecha` (IN `U_correo` VARCHAR(100) CHARSET utf8)  NO SQL
INSERT INTO genera_ticket(ID_ticket, ID_usuario, fecha_emision) VALUES((SELECT ID_ticket FROM ticket ORDER BY ID_ticket DESC LIMIT 1),(SELECT ID_usuario from usuario WHERE correo = (U_correo COLLATE utf8_spanish2_ci)), CURRENT_TIMESTAMP)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `RegistraRespuesta` (IN `U_idpregunta` INT, IN `U_textorespuesta` VARCHAR(1000) CHARSET utf8)  NO SQL
INSERT INTO respuesta(ID_pregunta, ID_ticket, texto_respuesta) VALUES(U_idpregunta,(SELECT ID_ticket FROM ticket ORDER BY ID_ticket DESC LIMIT 1),U_textorespuesta)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UsuarioGeneraTicket` (IN `U_idusuario` INT)  NO SQL
INSERT INTO genera_ticket VALUES ((SELECT ID_ticket FROM ticket ORDER BY ID_ticket DESC LIMIT 1), U_idusuario, CURRENT_TIMESTAMP)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `ID_categoria` int(20) NOT NULL,
  `nombre_categoria` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `tiempo_estimado` int(5) NOT NULL COMMENT 'Días'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`ID_categoria`, `nombre_categoria`, `tiempo_estimado`) VALUES
(1, 'Orden no avanza de status', 10),
(2, 'Error en nota de Crédito', 5),
(3, 'Crear acceso', 1),
(4, 'Error de entrega', 11),
(5, 'Error en CRM', 3),
(6, 'Error en Pago', 2),
(7, 'Error de retorno', 7),
(8, 'Cambio de domicilio', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `ID_comentario` int(20) NOT NULL,
  `texto_comentario` varchar(1000) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`ID_comentario`, `texto_comentario`) VALUES
(1, 'Problema solucionado sin ningun problema'),
(2, 'Consultar base de datos de los pedidos realizados'),
(3, 'Actualizar información del cliente'),
(4, 'Revisar datos introducidos en la transacción'),
(5, 'Revisar la información introducida'),
(6, 'Llevar a cabo la actualización de datos necesarios'),
(7, 'Problema sin solución por el momento'),
(8, 'Solucionado sin ningun problema'),
(9, 'Ticket detenido por el momento'),
(10, 'Ticket en pausa, esperando confirmación por parte del cliente');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `conjuntoderespuestas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `conjuntoderespuestas` (
`ID_ticket` int(20)
,`ID_categoria` int(20)
,`nombre_categoria` varchar(100)
,`tiempo_estimado` int(5)
,`ID_pregunta` int(20)
,`texto_pregunta` varchar(500)
,`ID_respuesta` int(20)
,`texto_respuesta` varchar(1000)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `ID_estado` int(20) NOT NULL,
  `nombre_estado` varchar(40) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`ID_estado`, `nombre_estado`) VALUES
(1, 'Nuevo'),
(2, 'En Curso'),
(3, 'En Espera de Información'),
(4, 'En espera de Visto Bueno'),
(5, 'Cancelado'),
(6, 'Resuelto');

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

--
-- Volcado de datos para la tabla `genera_ticket`
--

INSERT INTO `genera_ticket` (`ID_ticket`, `ID_usuario`, `fecha_emision`) VALUES
(6, 2, '2022-03-30'),
(7, 3, '2022-03-31'),
(8, 4, '2022-03-31'),
(9, 5, '2022-03-31'),
(10, 2, '2022-03-31'),
(11, 3, '2022-03-31'),
(12, 4, '2022-03-31'),
(13, 5, '2022-03-31'),
(14, 2, '2022-03-31'),
(15, 3, '2022-03-31'),
(16, 4, '2022-03-31'),
(17, 5, '2022-03-31'),
(18, 2, '2022-03-31'),
(19, 3, '2022-03-31'),
(20, 4, '2022-03-31'),
(21, 5, '2022-03-31'),
(22, 2, '2022-03-31'),
(26, 2, '2022-04-15'),
(28, 2, '2022-04-15'),
(29, 2, '2022-04-15'),
(30, 2, '2022-04-15'),
(32, 2, '2022-04-15'),
(33, 2, '2022-04-15'),
(34, 2, '2022-04-15'),
(35, 2, '2022-04-15'),
(37, 2, '2022-04-15'),
(38, 2, '2022-04-15'),
(39, 2, '2022-04-15'),
(40, 2, '2022-04-15'),
(42, 2, '2022-04-23');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `info_tickets`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `info_tickets` (
`ID_categoria` int(20)
,`nombre_categoria` varchar(100)
,`tiempo_estimado` int(5)
,`ID_pregunta` int(20)
,`texto_pregunta` varchar(500)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `ID_pregunta` int(20) NOT NULL,
  `ID_categoria` int(20) NOT NULL,
  `texto_pregunta` varchar(500) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`ID_pregunta`, `ID_categoria`, `texto_pregunta`) VALUES
(7, 7, 'Cual es el código de confirmación de tu pedido?'),
(8, 7, 'Que paquetería te entregó el producto?'),
(9, 8, 'Cual es tu usuario?'),
(10, 8, 'Que problema te presenta el sistema?'),
(11, 8, 'El domicilio nuevo es dentro del mismo país que el actual?'),
(12, 6, 'En que parte del pago se presenta el error?'),
(13, 1, 'Cual es el ID de tu orden?'),
(14, 1, 'Hace cuanto no avanza de status?'),
(15, 2, 'En que momento en específico se presenta el error?'),
(16, 2, 'por favor, ingresa el texto del error que te aparece en pantalla'),
(17, 3, 'Que sucede al intentar crear acceso?'),
(18, 4, 'El cliente recibió un producto diferente a lo que solicitó?'),
(19, 4, 'El paquete llegó incompleto?'),
(20, 4, 'El cliente recibió un paquete de alguien más?'),
(21, 5, 'Podrías pegar el texto del error que te muestra la interfaz?');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prioridad`
--

CREATE TABLE `prioridad` (
  `ID_prioridad` int(20) NOT NULL,
  `nombre_prioridad` varchar(40) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `prioridad`
--

INSERT INTO `prioridad` (`ID_prioridad`, `nombre_prioridad`) VALUES
(1, 'Por Asignar'),
(2, 'Baja'),
(3, 'Media'),
(4, 'Alta'),
(5, 'Urgente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `ID_respuesta` int(20) NOT NULL,
  `ID_pregunta` int(20) NOT NULL,
  `ID_ticket` int(20) NOT NULL,
  `texto_respuesta` varchar(1000) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`ID_respuesta`, `ID_pregunta`, `ID_ticket`, `texto_respuesta`) VALUES
(16, 13, 6, '2893'),
(17, 14, 6, '7 dias'),
(18, 7, 7, '4995'),
(19, 8, 7, 'FedEx'),
(20, 17, 8, 'Manda Error'),
(21, 18, 9, 'Asi es'),
(22, 19, 9, 'si'),
(23, 20, 9, 'No sabria decirle'),
(24, 21, 10, 'Error 404'),
(25, 12, 11, 'en la parte bancaria'),
(26, 7, 12, '489384'),
(27, 8, 12, 'FedEx'),
(28, 9, 13, 'Flavio'),
(29, 10, 13, 'Me manda a la pagina principal'),
(30, 11, 13, 'si'),
(31, 13, 14, ' 48938'),
(32, 14, 14, '7 dias'),
(33, 15, 15, 'cuando intento loguear'),
(34, 16, 15, 'Error 404'),
(35, 17, 16, 'Me manda a una direccion diferente'),
(36, 18, 17, ' Efectivamente'),
(37, 19, 17, 'Efectivamete'),
(38, 20, 17, 'Si'),
(39, 21, 18, 'Error host not found'),
(40, 12, 19, 'en la comunicacion del portal y el banco'),
(41, 7, 20, ' 49930'),
(42, 8, 20, 'FedEx'),
(43, 9, 21, 'Flavios'),
(44, 10, 21, 'Me presenta que no encuentra el pedido'),
(45, 11, 21, 'No'),
(56, 13, 23, ''),
(57, 14, 23, ''),
(58, 12, 24, 'hdhdhdhdh'),
(59, 18, 25, 'no'),
(60, 20, 25, 'no'),
(61, 19, 25, 'no'),
(62, 16, 26, '\"la tarjeta de crédito ingresada no es válida\"'),
(63, 15, 26, 'al intentar pagar'),
(64, 21, 38, '\"error en la interfaz\"'),
(65, 12, 39, 'al introducir la tarjeta'),
(66, 7, 40, '14859'),
(67, 8, 40, 'FedEx'),
(68, 21, 42, 'Si');

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

--
-- Volcado de datos para la tabla `resuelve_ticket`
--

INSERT INTO `resuelve_ticket` (`ID_ticket`, `ID_usuario`, `fecha_inicio`, `fecha_fin`, `comentarios_solucion`) VALUES
(6, 2, '2022-03-30', '2022-04-14', 'En proceso de solución'),
(7, 3, '2022-03-30', '2022-04-07', 'En proceso de solución'),
(8, 3, '2022-03-30', '2022-03-31', 'En espera de confirmación'),
(9, 4, '2022-03-30', '2022-03-31', 'Esperando confirmación'),
(10, 3, '2022-03-30', '2022-03-31', 'Delegado por el momento'),
(11, 4, '2022-03-30', '2022-03-31', 'Esperando datos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `ID_rol` int(20) NOT NULL,
  `nombre_rol` varchar(100) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`ID_rol`, `nombre_rol`) VALUES
(1, 'Administrador'),
(2, 'Empleado de Soporte'),
(3, 'Empleado Zebrands');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ticket`
--

CREATE TABLE `ticket` (
  `ID_ticket` int(20) NOT NULL,
  `ID_categoria` int(20) NOT NULL,
  `ID_estado` int(20) NOT NULL,
  `ID_prioridad` int(20) NOT NULL,
  `titulo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(400) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `ticket`
--

INSERT INTO `ticket` (`ID_ticket`, `ID_categoria`, `ID_estado`, `ID_prioridad`, `titulo`, `descripcion`) VALUES
(6, 1, 5, 1, 'Orden no cambia de estado', 'Han pasado 5 días desde que no noto ningun cambio'),
(7, 2, 1, 2, 'Dato mal en la nota de credito', 'Hay un dato erroneo dentro de la nota de credito'),
(8, 3, 5, 3, 'Crear acceso', 'Debido a la condiciones que se presentaron solicito la creación de una acceso'),
(9, 4, 5, 4, 'Error de entrega', 'La entrega no se leva a cabo de manera adecuada'),
(10, 5, 3, 5, 'Problema con CRM', 'Los datos no parecen ser los correctos, se pide una actualización de los mismos'),
(11, 6, 3, 1, 'Pago no procede', 'El pago aparece como no aceptado en el sistio web a pesar de descuento en la tarjeta'),
(12, 7, 4, 2, 'Error de retorno', 'No se puede llevar a cabo el retorno de manera adecuada'),
(13, 8, 4, 3, 'Cambio de dirección', 'Mudanza reciente en los ultimos días'),
(14, 1, 5, 4, 'Orden sigue en el mismo estado', 'No se ha actualizado en unos cuantos días'),
(15, 2, 5, 5, 'Error en nota de credito', 'No se genero de manera adecuada a nota de credito'),
(16, 3, 6, 1, 'Solicitud de acceso', 'Recien me di cuenta de la necesidad de un acceso'),
(17, 4, 1, 2, 'Problema con la entrega', 'No se dio un dato de suma importancia para ala entrega'),
(18, 5, 2, 3, 'Error en CRM', 'Problemas con el directorio'),
(19, 6, 3, 4, 'Error en pago', 'El pago no es aceptado por la pagina web'),
(20, 7, 4, 5, 'No se puede hacer el retorno', 'No me aparece la opción de realizar un retorno dentro del menu'),
(21, 8, 5, 1, 'Actualización de dirección dentro del sistema', 'Han pasado 4 días sin que mi dirección se actualice'),
(22, 1, 1, 1, 'Aldo', 'Renato se quedó dormido'),
(23, 1, 1, 1, 'Prueba1', 'P1'),
(25, 4, 1, 1, 'Problemas con la entrega', 'No me ha llegado mi colchón'),
(26, 2, 1, 1, 'Problema con crédito', 'tengo un problema para pagar mi colchón con mi tarjeta'),
(27, 3, 1, 1, 'Fallo en registro de fechas', 'No se están almacenando las fechas de creación'),
(28, 3, 1, 1, 'Fallo en registro de fechas', 'No se están almacenando las fechas de creación'),
(29, 3, 1, 1, 'Fallo en registro de fechas', 'No se están almacenando las fechas de creación'),
(30, 1, 1, 1, 'Prueba', 'Esta es una prueba'),
(31, 1, 1, 1, 'Prueba', 'Esta es una prueba'),
(32, 2, 1, 1, 'Error', 'Prueba'),
(33, 2, 1, 1, 'Error', 'Prueba'),
(34, 2, 1, 1, 'Error', 'Prueba'),
(35, 5, 1, 1, 'Prueba', 'Esto es una prueba'),
(36, 5, 1, 1, 'Prueba', 'Esto es una prueba'),
(37, 5, 1, 1, 'Prueba', 'Esto es una prueba'),
(38, 5, 1, 1, 'Prueba', 'Esto es una prueba'),
(39, 6, 1, 1, 'Error en creación de ticket', 'Tengo un error al crear un ticket'),
(40, 7, 1, 1, 'Prueba', 'Registro de tickets'),
(41, 1, 1, 1, 'No avanza la orden', 'Necesito apoyo, se quedó trabada'),
(42, 5, 1, 1, 'CRM érroneo', 'Error desconocido en CRM');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ticketentero`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ticketentero` (
`ID_ticket` int(20)
,`Creador` int(20)
,`Nombre_creador` varchar(40)
,`apellido_P_creador` varchar(40)
,`Apellido_M_creador` varchar(40)
,`correo_creador` varchar(100)
,`Encargado` int(20)
,`Nombre_encargado` varchar(40)
,`Apellido_P_encargado` varchar(40)
,`Apellido_M_encargado` varchar(40)
,`Correo_encargado` varchar(100)
,`ID_categoria` int(20)
,`nombre_categoria` varchar(100)
,`ID_estado` int(20)
,`nombre_estado` varchar(40)
,`ID_prioridad` int(20)
,`nombre_prioridad` varchar(40)
,`titulo` varchar(100)
,`descripcion` varchar(400)
,`tiempo_estimado` int(5)
,`ID_pregunta` int(20)
,`texto_pregunta` varchar(500)
,`ID_respuesta` int(20)
,`texto_respuesta` varchar(1000)
,`fecha_emision` date
,`fecha_inicio` date
,`fecha_fin` date
,`comentarios_solucion` varchar(1000)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ticketsnuevos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ticketsnuevos` (
`ID_ticket` int(20)
,`ID_categoria` int(20)
,`ID_estado` int(20)
,`ID_prioridad` int(20)
,`titulo` varchar(100)
,`descripcion` varchar(400)
,`ID_usuario` int(20)
,`ID_rol` int(20)
,`nombre` varchar(40)
,`apellido_paterno` varchar(40)
,`apellido_materno` varchar(40)
,`correo` varchar(100)
,`fecha_emision` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `ticketstotal`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `ticketstotal` (
`ID_ticket` int(20)
,`ID_estado` int(20)
,`ID_prioridad` int(20)
,`titulo` varchar(100)
,`descripcion` varchar(400)
,`Creador` int(20)
,`Nombre_creador` varchar(40)
,`apellido_P_creador` varchar(40)
,`Apellido_M_creador` varchar(40)
,`correo_creador` varchar(100)
,`fecha_emision` date
,`Encargado` int(20)
,`Nombre_encargado` varchar(40)
,`Apellido_P_encargado` varchar(40)
,`Apellido_M_encargado` varchar(40)
,`Correo_encargado` varchar(100)
,`fecha_inicio` date
,`fecha_fin` date
,`comentarios_solucion` varchar(1000)
);

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

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_usuario`, `ID_rol`, `nombre`, `apellido_paterno`, `apellido_materno`, `correo`, `password`) VALUES
(1, 1, 'Aldo', 'Tena', 'García', 'A01275222@tec.mx', 'Aldo1234'),
(2, 1, 'Flavio', 'Martinez', 'Martinez', 'flavio@zeb.com', '$2a$12$Tv098Ph/HE/JoFRsi5NapuCnpBelF5Rww/hBw5DxUKv3px55.mRf6'),
(3, 2, 'José Antonio', 'López', 'Coulon', 'jose@zeb.com', '$2a$12$QYUR2hJgxW7rO/EBPcnvuuJMzGAiD24FCA4SBRTNw54BhfIxkujOO'),
(4, 2, 'Marco Antonio', 'Camalich', 'Pérez', 'marco@zeb.com', '$2a$12$hg6UAGc01HL/3/pxZzFBSea0Z3PpwLc5ZgJqqiOa1OxqXarqP.T3O'),
(5, 3, 'Renato Sebastián ', 'Ramírez ', 'Calva', 'renato@zeb.com', '$2a$12$6km8gdPmJ.y1cuPVQH1myehkTrovA.e4HIAdw8dKA9ZU95F9n4XeW'),
(6, 3, 'Jose', 'Lopez', 'Coulon', 'jose@zeb.mx', '$2a$12$5pq.2GR7/Vuump2FTeaQc.0zpE8vdslY9mwK3QTqGwfuxCJs7YsnO');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `usuarios_ticket`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `usuarios_ticket` (
`ID_ticket` int(20)
,`Creador` int(20)
,`Nombre_creador` varchar(40)
,`apellido_P_creador` varchar(40)
,`Apellido_M_creador` varchar(40)
,`correo_creador` varchar(100)
,`fecha_emision` date
,`Encargado` int(20)
,`Nombre_encargado` varchar(40)
,`Apellido_P_encargado` varchar(40)
,`Apellido_M_encargado` varchar(40)
,`Correo_encargado` varchar(100)
,`fecha_inicio` date
,`fecha_fin` date
,`comentarios_solucion` varchar(1000)
);

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
-- Volcado de datos para la tabla `usuario_comentario_ticket`
--

INSERT INTO `usuario_comentario_ticket` (`ID_usuario`, `ID_comentario`, `ID_ticket`, `fecha_comentario`) VALUES
(3, 1, 16, '2022-03-31'),
(3, 2, 21, '2022-03-31'),
(3, 6, 15, '2022-03-31'),
(3, 8, 19, '2022-03-31'),
(4, 3, 9, '2022-03-31'),
(4, 5, 14, '2022-03-31'),
(4, 7, 18, '2022-03-31'),
(4, 9, 20, '2022-03-31');

-- --------------------------------------------------------

--
-- Estructura para la vista `conjuntoderespuestas`
--
DROP TABLE IF EXISTS `conjuntoderespuestas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `conjuntoderespuestas`  AS   (select `respuesta`.`ID_ticket` AS `ID_ticket`,`categoria`.`ID_categoria` AS `ID_categoria`,`categoria`.`nombre_categoria` AS `nombre_categoria`,`categoria`.`tiempo_estimado` AS `tiempo_estimado`,`pregunta`.`ID_pregunta` AS `ID_pregunta`,`pregunta`.`texto_pregunta` AS `texto_pregunta`,`respuesta`.`ID_respuesta` AS `ID_respuesta`,`respuesta`.`texto_respuesta` AS `texto_respuesta` from ((`categoria` join `respuesta`) join `pregunta`) where `categoria`.`ID_categoria` = `pregunta`.`ID_categoria` and `respuesta`.`ID_pregunta` = `pregunta`.`ID_pregunta`)  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `info_tickets`
--
DROP TABLE IF EXISTS `info_tickets`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `info_tickets`  AS SELECT `c`.`ID_categoria` AS `ID_categoria`, `c`.`nombre_categoria` AS `nombre_categoria`, `c`.`tiempo_estimado` AS `tiempo_estimado`, `p`.`ID_pregunta` AS `ID_pregunta`, `p`.`texto_pregunta` AS `texto_pregunta` FROM (`categoria` `c` join `pregunta` `p` on(`c`.`ID_categoria` = `p`.`ID_categoria`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ticketentero`
--
DROP TABLE IF EXISTS `ticketentero`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ticketentero`  AS   (select `ticket`.`ID_ticket` AS `ID_ticket`,`usuarios_ticket`.`Creador` AS `Creador`,`usuarios_ticket`.`Nombre_creador` AS `Nombre_creador`,`usuarios_ticket`.`apellido_P_creador` AS `apellido_P_creador`,`usuarios_ticket`.`Apellido_M_creador` AS `Apellido_M_creador`,`usuarios_ticket`.`correo_creador` AS `correo_creador`,`usuarios_ticket`.`Encargado` AS `Encargado`,`usuarios_ticket`.`Nombre_encargado` AS `Nombre_encargado`,`usuarios_ticket`.`Apellido_P_encargado` AS `Apellido_P_encargado`,`usuarios_ticket`.`Apellido_M_encargado` AS `Apellido_M_encargado`,`usuarios_ticket`.`Correo_encargado` AS `Correo_encargado`,`ticket`.`ID_categoria` AS `ID_categoria`,`conjuntoderespuestas`.`nombre_categoria` AS `nombre_categoria`,`ticket`.`ID_estado` AS `ID_estado`,`estado`.`nombre_estado` AS `nombre_estado`,`ticket`.`ID_prioridad` AS `ID_prioridad`,`prioridad`.`nombre_prioridad` AS `nombre_prioridad`,`ticket`.`titulo` AS `titulo`,`ticket`.`descripcion` AS `descripcion`,`conjuntoderespuestas`.`tiempo_estimado` AS `tiempo_estimado`,`conjuntoderespuestas`.`ID_pregunta` AS `ID_pregunta`,`conjuntoderespuestas`.`texto_pregunta` AS `texto_pregunta`,`conjuntoderespuestas`.`ID_respuesta` AS `ID_respuesta`,`conjuntoderespuestas`.`texto_respuesta` AS `texto_respuesta`,`usuarios_ticket`.`fecha_emision` AS `fecha_emision`,`usuarios_ticket`.`fecha_inicio` AS `fecha_inicio`,`usuarios_ticket`.`fecha_fin` AS `fecha_fin`,`usuarios_ticket`.`comentarios_solucion` AS `comentarios_solucion` from ((((`ticket` join `usuarios_ticket`) join `conjuntoderespuestas`) join `estado`) join `prioridad`) where `ticket`.`ID_ticket` = `conjuntoderespuestas`.`ID_ticket` and `ticket`.`ID_ticket` = `usuarios_ticket`.`ID_ticket` and `ticket`.`ID_categoria` = `conjuntoderespuestas`.`ID_categoria` and `ticket`.`ID_prioridad` = `prioridad`.`ID_prioridad` and `ticket`.`ID_estado` = `estado`.`ID_estado`)  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ticketsnuevos`
--
DROP TABLE IF EXISTS `ticketsnuevos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ticketsnuevos`  AS   (select `ticket`.`ID_ticket` AS `ID_ticket`,`ticket`.`ID_categoria` AS `ID_categoria`,`ticket`.`ID_estado` AS `ID_estado`,`ticket`.`ID_prioridad` AS `ID_prioridad`,`ticket`.`titulo` AS `titulo`,`ticket`.`descripcion` AS `descripcion`,`genera_ticket`.`ID_usuario` AS `ID_usuario`,`usuario`.`ID_rol` AS `ID_rol`,`usuario`.`nombre` AS `nombre`,`usuario`.`apellido_paterno` AS `apellido_paterno`,`usuario`.`apellido_materno` AS `apellido_materno`,`usuario`.`correo` AS `correo`,`genera_ticket`.`fecha_emision` AS `fecha_emision` from ((`ticket` join `genera_ticket`) join `usuario`) where `genera_ticket`.`ID_ticket` = `ticket`.`ID_ticket` and `usuario`.`ID_usuario` = `genera_ticket`.`ID_usuario` and `ticket`.`ID_estado` = 1)  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `ticketstotal`
--
DROP TABLE IF EXISTS `ticketstotal`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ticketstotal`  AS   (select `ticket`.`ID_ticket` AS `ID_ticket`,`ticket`.`ID_estado` AS `ID_estado`,`ticket`.`ID_prioridad` AS `ID_prioridad`,`ticket`.`titulo` AS `titulo`,`ticket`.`descripcion` AS `descripcion`,`usuarios_ticket`.`Creador` AS `Creador`,`usuarios_ticket`.`Nombre_creador` AS `Nombre_creador`,`usuarios_ticket`.`apellido_P_creador` AS `apellido_P_creador`,`usuarios_ticket`.`Apellido_M_creador` AS `Apellido_M_creador`,`usuarios_ticket`.`correo_creador` AS `correo_creador`,`usuarios_ticket`.`fecha_emision` AS `fecha_emision`,`usuarios_ticket`.`Encargado` AS `Encargado`,`usuarios_ticket`.`Nombre_encargado` AS `Nombre_encargado`,`usuarios_ticket`.`Apellido_P_encargado` AS `Apellido_P_encargado`,`usuarios_ticket`.`Apellido_M_encargado` AS `Apellido_M_encargado`,`usuarios_ticket`.`Correo_encargado` AS `Correo_encargado`,`usuarios_ticket`.`fecha_inicio` AS `fecha_inicio`,`usuarios_ticket`.`fecha_fin` AS `fecha_fin`,`usuarios_ticket`.`comentarios_solucion` AS `comentarios_solucion` from (`ticket` join `usuarios_ticket`) where `ticket`.`ID_ticket` = `usuarios_ticket`.`ID_ticket`)  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `usuarios_ticket`
--
DROP TABLE IF EXISTS `usuarios_ticket`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usuarios_ticket`  AS   (select `resuelve_ticket`.`ID_ticket` AS `ID_ticket`,`genera_ticket`.`ID_usuario` AS `Creador`,`u1`.`nombre` AS `Nombre_creador`,`u1`.`apellido_paterno` AS `apellido_P_creador`,`u1`.`apellido_materno` AS `Apellido_M_creador`,`u1`.`correo` AS `correo_creador`,`genera_ticket`.`fecha_emision` AS `fecha_emision`,`resuelve_ticket`.`ID_usuario` AS `Encargado`,`u2`.`nombre` AS `Nombre_encargado`,`u2`.`apellido_paterno` AS `Apellido_P_encargado`,`u2`.`apellido_materno` AS `Apellido_M_encargado`,`u2`.`correo` AS `Correo_encargado`,`resuelve_ticket`.`fecha_inicio` AS `fecha_inicio`,`resuelve_ticket`.`fecha_fin` AS `fecha_fin`,`resuelve_ticket`.`comentarios_solucion` AS `comentarios_solucion` from (((`usuario` `u1` join `usuario` `u2`) join `resuelve_ticket`) join `genera_ticket`) where `resuelve_ticket`.`ID_ticket` = `genera_ticket`.`ID_ticket` and `u1`.`ID_usuario` = `genera_ticket`.`ID_usuario` and `u2`.`ID_usuario` = `resuelve_ticket`.`ID_usuario`)  ;

--
-- Índices para tablas volcadas
--

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
  ADD PRIMARY KEY (`ID_pregunta`),
  ADD KEY `ID_categoria` (`ID_categoria`);

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
  ADD KEY `ID_pregunta` (`ID_pregunta`),
  ADD KEY `ID_ticket` (`ID_ticket`);

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
  MODIFY `ID_categoria` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `ID_comentario` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `ID_estado` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `funcion`
--
ALTER TABLE `funcion`
  MODIFY `ID_funcion` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `ID_pregunta` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `prioridad`
--
ALTER TABLE `prioridad`
  MODIFY `ID_prioridad` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `ID_respuesta` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `ID_rol` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ID_ticket` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_usuario` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`ID_categoria`) REFERENCES `categoria` (`ID_categoria`) ON UPDATE CASCADE;

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
