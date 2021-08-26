SELECT * FROM USUARIO;
SELECT ID_USUARIO FROM USUARIO;
SELECT NOMBRE,APELLIDO,IMC FROM USUARIO WHERE IMC<35;

SELECT * FROM RECETA;
SELECT ID_RECETA FROM RECETA;
SELECT ID_RECETA FROM RECETA WHERE RATE>5;

SELECT * FROM TABLERO_SEMANAL;
SELECT ID_TABLERO FROM TABLERO_SEMANAL;
SELECT ID_TABLERO,ID_USUARIO,FRANJA_HORARIA FROM TABLERO_SEMANAL WHERE FRANJA_HORARIA like "MERIENDA";

SELECT * FROM RESUMEN_SEMANAL;
SELECT NUMERO_RESUMEN FROM RESUMEN_SEMANAL;
SELECT NUMERO_RESUMEN,ID_USUARIO FROM RESUMEN_SEMANAL WHERE CALORIAS_CONSUMIDAS_KCAL>700;

SELECT * FROM META;
SELECT ID_META FROM META;
SELECT NUMERO_RESUMEN FROM META WHERE NUMERO_RESUMEN<110;

SELECT * FROM MENSAJE;
SELECT ID_MENSAJE FROM MENSAJE;
SELECT MENSAJE_MOTIVACIONAL FROM MENSAJE WHERE MENSAJE_MOTIVACIONAL like '%héroe%';

SELECT * FROM INGREDIENTE;
SELECT ID_INGREDIENTE FROM INGREDIENTE;
SELECT ID_INGREDIENTE,GRUPO_ALIMENTICIO FROM INGREDIENTE WHERE CALORIAS<150;

SELECT DESCRIPCION,CALORIAS,GRUPO_ALIMENTICIO FROM INGREDIENTE,RECETA WHERE INGREDIENTE.ID_RECETA = RECETA.ID_RECETA;

SELECT CALORIAS, META_CUMPLIDA, CALORIAS, MENSAJE_MOTIVACIONAL 
FROM INGREDIENTE,RECETA,USUARIO,RESUMEN_SEMANAL,META,MENSAJE 
WHERE INGREDIENTE.ID_RECETA = RECETA.ID_RECETA AND RECETA.ID_USUARIO = USUARIO.ID_USUARIO AND RESUMEN_SEMANAL.ID_USUARIO = USUARIO.ID_USUARIO AND META.NUMERO_RESUMEN = RESUMEN_SEMANAL.NUMERO_RESUMEN AND MENSAJE.ID_META = META.ID_META;

SELECT ID_USUARIO,NOMBRE,APELLIDO FROM USUARIO;

SELECT META_CUMPLIDA,FECHA_INICIO_M,FECHA_FIN_M FROM META;

SELECT ID_USUARIO FROM USUARIO, RESUMEN_SEMANAL WHERE RESUMEN_SEMANAL.ID_USUARIO = USUARIO.ID_USUARIO AND CALORIAS_CONSUMIDAS_KCAL > 1000;

