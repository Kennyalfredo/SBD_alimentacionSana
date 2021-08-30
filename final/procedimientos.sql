- Tablero semanal 
-- Insertar un tablero semanal
drop procedure if exists INSERT_TABLERO_SEMANAL;
DELIMITER //
CREATE PROCEDURE INSERT_TABLERO_SEMANAL(IN ID_TABL INT , IN FECHA_INI DATE, IN FECHA_FI DATE, IN FRANJA_HORAR CHAR(15), IN ID_USUAR INT)
BEGIN 
	INSERT INTO TABLERO_SEMANAL(ID_TABLERO,FECHA_INICIO,FECHA_FIN,FRANJA_HORARIA,ID_USUARIO) 
    VALUES(ID_TABL, FECHA_INI, FECHA_FI, FRANJA_HORAR, ID_USUAR);
END //
DELIMITER ;

-- CALL INSERT_TABLERO_SEMANAL(51,'2021-07-04', '2021-07-11',"DESAYUNO",35);

-- Actualizar un tablero semanal
drop procedure if exists UPDATE_TABLERO_SEMANAL;
DELIMITER //
CREATE PROCEDURE UPDATE_TABLERO_SEMANAL(IN FRANJA_NEW CHAR(15), IN ID_TABLE_NEW INT)
BEGIN
    UPDATE TABLERO_SEMANAL SET FRANJA_HORARIA=FRANJA_NEW WHERE ID_TABLERO=ID_TABLE_NEW; 
END //
DELIMITER ;
CALL UPDATE_TABLERO_SEMANAL("ALMUERZO",51);

-- Eleminar un tablero semanal
drop procedure if exists DELETE_TABLERO_SEMANAL;
DELIMITER //
CREATE PROCEDURE DELETE_TABLERO_SEMANAL(IN ID_USUAR_NEW INT)
BEGIN
    DELETE FROM TABLERO_SEMANAL WHERE ID_TABLERO=ID_USUAR_NEW;
END //
DELIMITER ;

CALL DELETE_TABLERO_SEMANAL(51);


-- META
-- 1
-- INSERT_META permite ingresar una nueva meta a la tabla meta, ingresando los respectivos valores
drop procedure if exists INSERT_META;
DELIMITER //
CREATE PROCEDURE INSERT_META(IN ID_META_NEW INT , IN META_CUMPLIDA_NEW BOOL, IN FECHA_INICIO_NEW DATE,IN FECHA_FIN_NEW DATE ,IN NUMERO_RESUMEN_NEW INT)
BEGIN 
	INSERT INTO META(ID_META,META_CUMPLIDA,FECHA_INICIO_M,FECHA_FIN_M,NUMERO_RESUMEN) 
    VALUES(ID_META_NEW, META_CUMPLIDA_NEW, FECHA_INICIO_NEW, FECHA_FIN_NEW, NUMERO_RESUMEN_NEW);
END //
DELIMITER ;
-- CALL INSERT_META(91,FALSE,'2023-10-07','2022-11-04',110);

-- 2
-- UPDATE_META permite actualizar algun campo de mi tabla, especificando el id
drop procedure if exists UPDATE_META;
DELIMITER //
CREATE PROCEDURE UPDATE_META(IN FECHA_INICI_NEW DATE,IN ID_META_NEW INT)
BEGIN
    UPDATE META SET FECHA_INICIO_M=FECHA_INICI_NEW WHERE ID_META=ID_META_NEW; 
END //
DELIMITER ;
CALL UPDATE_META('2023-10-07',70);

-- 3
-- DELETE_META permite eleminar informacion apartir del id que se el ingrese
drop procedure if exists DELETE_META;
DELIMITER //
CREATE PROCEDURE DELETE_META(IN ID_META_NEW INT)
BEGIN
    DELETE FROM META WHERE ID_META=ID_META_NEW;
END //
DELIMITER ;
CALL DELETE_META(90);


-- MENSAJE
-- 1 
-- INSERT_MENSAJE permite ingresar una nueva meta a la tabla meta, ingresando los respectivos valores

DROP PROCEDURE IF EXISTS INSERT_MENSAJE;
DELIMITER //
CREATE PROCEDURE INSERT_MENSAJE(IN ID_MENSAJE_NEW INT , IN MENSAJE_MOTIVACIONAL_NEW CHAR(25), IN MENSAJE_FELICITACION_NEW CHAR(25),IN ID_META_NEW INT)
BEGIN 
	INSERT INTO MENSAJE(ID_MENSAJE,MENSAJE_MOTIVACIONAL,MENSAJE_FELICITACION,ID_META) 
    VALUES(ID_MENSAJE_NEW, MENSAJE_MOTIVACIONAL_NEW, MENSAJE_FELICITACION_NEW, ID_META_NEW);
END //
DELIMITER ;
-- CALL INSERT_MENSAJE(91,"Tu puedes","Lo lograsteee",80);

-- 2 
-- UPDATE_MENSAJE permite actualizar algun campo de mi tabla, especificando el id 
DROP PROCEDURE IF EXISTS UPDATE_MENSAJE;
DELIMITER //
CREATE PROCEDURE UPDATE_MENSAJE(IN MENSAJE_MOTIVACIONAL_NEW CHAR(25),IN ID_MENSAJE_NEW INT)
BEGIN
    UPDATE MENSAJE SET MENSAJE_MOTIVACIONAL=MENSAJE_MOTIVACIONAL_NEW WHERE ID_MENSAJE=ID_MENSAJE_NEW; 
END //
DELIMITER ;
CALL UPDATE_MENSAJE("Tu puedes, adelante",73);

-- 3
-- DELETE_MENSAJE permite eleminar informacion apartir del id que se el ingrese
DROP PROCEDURE IF EXISTS DELETE_MENSAJE;
DELIMITER //
CREATE PROCEDURE DELETE_MENSAJE(IN ID_MENSAJE_NEW INT)
BEGIN
    DELETE FROM MENSAJE WHERE ID_MENSAJE=ID_MENSAJE_NEW;
END //
DELIMITER ;
CALL DELETE_MENSAJE(0109);


-- RESUMEN_SEMANAL
-- 1
-- INSERT_RESUMEN_SEMANAL permite ingresar una nueva meta a la tabla meta, ingresando los respectivos valores
DROP PROCEDURE IF EXISTS INSERT_RESUMEN_SEMANAL;
DELIMITER //
CREATE PROCEDURE INSERT_RESUMEN_SEMANAL(IN NUMERO_RESUMEN_NEW INT , IN CALORIAS_CONSUMIDAS_KCAL_NEW FLOAT, IN CALORIAS_REDUCIDAS_KCAL_NEW FLOAT, IN ID_USUARIO_NEW INT)
BEGIN 
	INSERT INTO RESUMEN_SEMANAL(NUMERO_RESUMEN,CALORIAS_CONSUMIDAS_KCAL,CALORIAS_REDUCIDAS_KCAL,ID_USUARIO) 
    VALUES(NUMERO_RESUMEN_NEW, CALORIAS_CONSUMIDAS_KCAL_NEW, CALORIAS_REDUCIDAS_KCAL_NEW, ID_USUARIO_NEW);
END //
DELIMITER ;
-- CALL INSERT_RESUMEN_SEMANAL(120,1400,1000,22);

-- 2
-- UPDATE_RESUMEN_SEMANAL permite actualizar algun campo de mi tabla, especificando el id
DROP PROCEDURE IF EXISTS UPDATE_RESUMEN_SEMANAL;
DELIMITER //
CREATE PROCEDURE UPDATE_RESUMEN_SEMANAL(IN CALORIAS_CONSUMIDAS_KCAL_NEW FLOAT,IN NUMERO_RESUMEN_NEW INT)
BEGIN
    UPDATE RESUMEN_SEMANAL SET CALORIAS_CONSUMIDAS_KCAL=CALORIAS_CONSUMIDAS_KCAL_NEW WHERE NUMERO_RESUMEN=NUMERO_RESUMEN_NEW; 
END //
DELIMITER ;
CALL UPDATE_RESUMEN_SEMANAL(1600,117);

-- 3
-- DELETE_RESUMEN_SEMANAL permite eleminar informacion apartir del id que se el ingrese
DROP PROCEDURE IF EXISTS DELETE_RESUMEN_SEMANAL;
DELIMITER //
CREATE PROCEDURE DELETE_RESUMEN_SEMANAL(IN NUMERO_RESUMEN_NEW INT)
BEGIN
    DELETE FROM RESUMEN_SEMANAL WHERE NUMERO_RESUMEN=NUMERO_RESUMEN_NEW;
END //
DELIMITER ;
CALL DELETE_RESUMEN_SEMANAL(120);


/* PROCEDIMIENTO PARA INSERTAR UN NUEVO USUARIO */
DROP PROCEDURE IF EXISTS INGRESAR_USUARIO;
DELIMITER //
CREATE PROCEDURE INGRESAR_USUARIO(IN USUARIO INT, IN EMAIL CHAR(40), IN NOMUSUARIO CHAR(20), 
IN APELLIDOUSU CHAR(20), IN CONTRA CHAR (30), IN PESO FLOAT, IN ESTATURA FLOAT, 
IN FECHADENACIMIENTO DATE, IN ENFERMEDAD CHAR(20), IN IMCUSUARIO FLOAT)
BEGIN 
INSERT INTO USUARIO VALUES (USUARIO, EMAIL, NOMUSUARIO, APELLIDOUSU, 
CONTRA, PESO, ESTATURA, FECHADENACIMIENTO, ENFERMEDAD, IMCUSUARIO );
END 
// DELIMITER ; 
-- CALL INGRESAR_USUARIO(41,"LaMissEsChevre@gmail.com","VANESSA","ECHEVERRIA","BaseDatos", 62 , 1.66 ,'2001-06-26' ,"sinusitis" ,22.5);

-- PROCEDIMIENTO DE UPDATE DE UN USUARIO
DROP PROCEDURE IF EXISTS UPDATE_USUARIO;
DELIMITER //
CREATE PROCEDURE UPDATE_USUARIO(IN USUARIO INT, IN EMAIL CHAR(40), IN NOMUSUARIO CHAR(20), 
IN APELLIDOUSU CHAR(20), IN CONTRA CHAR (30), IN PESO FLOAT, IN ESTATURA FLOAT, 
IN FECHADENACIMIENTO DATE, IN ENFERMEDAD CHAR(20), IN IMCUSUARIO FLOAT)
BEGIN 
UPDATE USUARIO 
SET CORREO= EMAIL, NOMBRE= NOMUSUARIO, APELLIDO=APELLIDOUSU, CONTRASENA=CONTRA,
USUARIO.PESO=PESO, USUARIO.ESTATURA=ESTATURA, FECHA_NACIMIENTO= FECHADENACIMIENTO, ENFERMEDADES=ENFERMEDAD,
IMC= IMCUSUARIO
WHERE USUARIO=ID_USUARIO;
END 
// DELIMITER ; 
CALL UPDATE_USUARIO(41,"100EnElProyecto@gmail.com","IVONNE","BARZOLA","APParaTodoElGrupo", 62 , 1.66 ,'2001-06-26' ,"sinusitis" ,22.5);

-- PROCEDIMIENTO DELETE USUARIO
DROP PROCEDURE IF EXISTS DELETE_USUARIO;
DELIMITER //
CREATE PROCEDURE DELETE_USUARIO(IN DUSUARIO INT)
BEGIN 
DELETE FROM USUARIO WHERE ID_USUARIO = DUSUARIO;
END // 
DELIMITER ; 
CALL DELETE_USUARIO(41);


-- PROCEDIMIENTO INSERT RECTA
DROP PROCEDURE IF EXISTS INGRESAR_RECETA;
DELIMITER //
CREATE PROCEDURE INGRESAR_RECETA(IN RECETA INT, IN DESCRIPCIONRECETA CHAR(100), IN INFO INT, 
IN RATERECETA INT, IN FECHAAGREGACION DATE, IN IDUSUARIO INT, IN FAV TINYINT)
BEGIN 
INSERT INTO RECETA VALUES (RECETA, DESCRIPCIONRECETA, INFO, RATERECETA, 
FECHAAGREGACION, IDUSUARIO, FAV);
END 
// DELIMITER ; 
CALL INGRESAR_RECETA(041, "Raviolis de pollo",300, 8.5, '2021-08-25',41, false);

-- UPDATE RECETA
DROP PROCEDURE IF EXISTS UPDATE_RECETA;
DELIMITER //
CREATE PROCEDURE UPDATE_RECETA(IN RECETA INT, IN DESCRIPCIONRECETA CHAR(100), IN INFO INT, 
IN RATERECETA INT, IN FECHAAGREGACION DATE, IN IDUSUARIO INT, IN FAV TINYINT)
BEGIN 
UPDATE RECETA
SET DESCRIPCION= DESCRIPCIONRECETA, INFORMACION_NUTRICIONAL=INFO, RATE=RATERECETA, 
FECHA_AGREGACION=FECHAAGREGACION, ID_USUARIO=IDUSUARIO, FAVORITO=FAV
WHERE RECETA=ID_RECETA;
END 
// DELIMITER ; 
CALL UPDATE_RECETA(041, "Empanada de carne",250, 9.5, '2021-08-25',41, true);

/* DELETE RECETA */
DROP PROCEDURE IF EXISTS DELETE_RECETA;
DELIMITER //
CREATE PROCEDURE DELETE_RECETA(IN RECETA INT)
BEGIN 
DELETE FROM RECETA 
WHERE ID_RECETA=RECETA;
END 
// DELIMITER ;
CALL DELETE_RECETA(041);

-- INSERT INGREDIENTE
DROP PROCEDURE IF EXISTS INGRESAR_INGREDIENTE;
DELIMITER //
CREATE PROCEDURE INGRESAR_INGREDIENTE(IN INGREDIENTE INT, IN GRUPO CHAR(15), IN CANTIDAD INT, 
IN CAL FLOAT, IN IDRECETA INT)
BEGIN 
INSERT INTO INGREDIENTE VALUES (INGREDIENTE,GRUPO,CANTIDAD,CAL,IDRECETA);
END 
// DELIMITER ;
CALL  INGRESAR_INGREDIENTE(79,"PROTEINAS", 1, 120,040);

-- UPDATE INGREDIENTE
DROP PROCEDURE IF EXISTS UPDATE_INGREDIENTE;
DELIMITER //
CREATE PROCEDURE UPDATE_INGREDIENTE(IN INGREDIENTE INT, IN GRUPO CHAR(15), IN CANTIDAD INT, 
IN CAL FLOAT, IN IDRECETA INT)
BEGIN 
UPDATE INGREDIENTE 
SET GRUPO_ALIMENTICIO= GRUPO, INGREDIENTE.CANTIDAD=CANTIDAD, CALORIAS=CAL, ID_RECETA=IDRECETA
WHERE ID_INGREDIENTE=INGREDIENTE;
END 
// DELIMITER ;
CALL UPDATE_INGREDIENTE(79,"CARBOHIDRATOS", 1, 110,040);

-- DELETE INGREDIENTE/
DROP PROCEDURE IF EXISTS DELETE_INGREDIENTE;
DELIMITER //
CREATE PROCEDURE DELETE_INGREDIENTE(IN INGREDIENTE INT)
BEGIN 
DELETE FROM INGREDIENTE
WHERE ID_INGREDIENTE=INGREDIENTE;
END 
// DELIMITER ;
CALL DELETE_INGREDIENTE(79);

-- Verificar meta 
-- Permite saber si un usuario en especifico logro completar la meta o no.
DROP PROCEDURE IF EXISTS VERFICAR_META;
DELIMITER //
CREATE PROCEDURE VERFICAR_META(IN ID_USUARIO_NEW INT)
BEGIN
SET @prueba = (SELECT META_CUMPLIDA FROM RESUMEN_SEMANAL R, META M WHERE R.NUMERO_RESUMEN=M.NUMERO_RESUMEN AND M.META_CUMPLIDA=TRUE AND ID_USUARIO=ID_USUARIO_NEW);
IF @prueba THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = "EL USUARIO COMPLETO LA META, FELICIDADES LO LOGRASTE";
ELSE
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = "EL USUARIO NO COMPLETO LA META, INTENTALO DE NUEVO";
END IF;
END //
DELIMITER ;
-- CALL VERFICAR_META(4);


-- MOSTRAR FAVORITOS
-- busca a un usaurio y muestra sus recetas marcadas como favoritas
DROP PROCEDURE IF EXISTS MOSTRAR_FAVORITA;
DELIMITER //
CREATE PROCEDURE MOSTRAR_FAVORITA(IN USUARIO INT)
BEGIN 
SELECT FAVORITO FROM RECETA WHERE ID_USUARIO=USUARIO;
END
// DELIMITER ;
call MOSTRAR_FAVORITA(7);


-- MOSTAR SIMILARES
-- busca recetasa por calorias 
DROP PROCEDURE IF EXISTS MOSTRAR_SIMILARES;
DELIMITER //
CREATE PROCEDURE MOSTRAR_SIMILARES(IN CALORIAS INT)
BEGIN 
SELECT ID_RECETA, DESCRIPCION FROM RECETA R WHERE 
R.INFORMACION_NUTRICIONAL=CALORIAS;
END
// DELIMITER ;
SELECT* FROM RECETA;
CALL MOSTRAR_SIMILARES(200);


-- CONSULTAR INFORMACION USUARIO
-- busca un usuario por su id y luego muestra toda su informacion
DROP PROCEDURE IF EXISTS CONSULTAR_INFORMACION_USUARIO;
DELIMITER //
CREATE PROCEDURE CONSULTAR_INFORMACION_USUARIO(IN ID INT)
BEGIN 
SELECT * FROM informacionUsuario WHERE ID_USUARIO = ID;
END
// DELIMITER ;

call CONSULTAR_INFORMACION_USUARIO(4);


-- CONSULTAR LISTA DE USARIOS
-- muestra a todos los usuarios registrado en la base por id, nombre y apellido
DROP PROCEDURE IF EXISTS CONSULTAR_LISTA_USUARIOS;
DELIMITER //
CREATE PROCEDURE CONSULTAR_LISTA_USUARIOS()
BEGIN 
SELECT * FROM ListaDeUsuarios;
END
// DELIMITER ;
call CONSULTAR_LISTA_USUARIOS;

-- Formular menu semanal
-- muetra el menu que tiene un usuario
DROP PROCEDURE IF EXISTS MENU_SEMANAL;
DELIMITER //
CREATE PROCEDURE MENU_SEMANAL(IN ID INT)
BEGIN 
SELECT * FROM MENUS
WHERE ID = ID_USUARIO;
END
// DELIMITER ;
call MENU_SEMANAL(1);

-- Agregar Rating
-- le agrega un rating a una receta de un usuario
DROP PROCEDURE IF EXISTS AGREGAR_RATING;
DELIMITER //
CREATE PROCEDURE AGREGAR_RATING(IN ID INT, IN NEW_RATE INT)
BEGIN 
UPDATE RECETA
SET RATE = NEW_RATE
WHERE ID_USUARIO = ID;
END
// DELIMITER ;
CALL AGREGAR_RATING(1, 8);

-- Generar Resumen semanal
-- Muestra el resumen semanal por usuario 
DROP PROCEDURE IF EXISTS GENERAR_RESUMEN_SEMANAL;
DELIMITER //
CREATE PROCEDURE GENERAR_RESUMEN_SEMANAL(IN ID INT)
BEGIN 
SELECT NUMERO_RESUMEN, CALORIAS_CONSUMIDAS_KCAL, CALORIAS_REDUCIDAS_KCAL, METAS_CUMPLIDAS
FROM ResumenSemanal
WHERE ID_USUARIO = ID;
END
// DELIMITER ;
CALL GENERAR_RESUMEN_SEMANAL(1);


