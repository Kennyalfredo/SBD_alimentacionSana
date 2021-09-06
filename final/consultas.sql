/*1.Recetas con más de 200 calorías. */
SELECT DESCRIPCION, INFORMACION_NUTRICIONAL FROM RECETA WHERE INFORMACION_NUTRICIONAL>200;

/*2.Mostrar datos del usuario*/
SELECT * FROM USUARIO;

/*3.Mostrar metas cumplidas. */
SELECT ID_META, FECHA_INICIO_M, FECHA_FIN_M FROM META WHERE  META_CUMPLIDA=TRUE ;

/*4.Mostrar resumen semanal.*/
SELECT RE.CALORIAS_CONSUMIDAS_KCAL, RE.CALORIAS_REDUCIDAS_KCAL, U.NOMBRE, U.APELLIDO
FROM RESUMEN_SEMANAL RE,USUARIO U WHERE U.ID_USUARIO=RE.ID_USUARIO;

/*5.Mostrar un registro calorías consumidas mayor a 800. */

SELECT U.ID_USUARIO, U.NOMBRE, U.APELLIDO, RE.CALORIAS_CONSUMIDAS_KCAL 
FROM USUARIO U , RESUMEN_SEMANAL RE WHERE U.ID_USUARIO=RE.ID_USUARIO AND RE.CALORIAS_CONSUMIDAS_KCAL>800;

/*6.Mostrar un registro de los usuarios que consumieron 700 cal en la semana*/
SELECT NUMERO_RESUMEN,ID_USUARIO FROM RESUMEN_SEMANAL WHERE CALORIAS_CONSUMIDAS_KCAL=700;

/*7.Mostrar el grupo alimenticio de los ingredientes que no superen las 150 calorías.*/
SELECT ID_INGREDIENTE,GRUPO_ALIMENTICIO FROM INGREDIENTE WHERE CALORIAS<150;

/*8. Mostrar tablero semanal*/
SELECT * FROM TABLERO_SEMANAL;

/*9.Mostrar ingredientes de una receta con menos de 450 calorías.*/
SELECT I.ID_INGREDIENTE, R.DESCRIPCION FROM INGREDIENTE I, RECETA R
WHERE I.ID_RECETA=R.ID_RECETA AND R.INFORMACION_NUTRICIONAL<450;

/*10.Mostrar el ID de los usuarios que han consumido más de 10000 calorías semanalmente.*/
SELECT U.ID_USUARIO FROM USUARIO U, RESUMEN_SEMANAL RE
WHERE RE.ID_USUARIO = U.ID_USUARIO AND CALORIAS_CONSUMIDAS_KCAL > 1000;

/*11.Cantidad de metas cumplidas del usuario.*/
SELECT COUNT(M.ID_META) AS MetasCumplidas, U.NOMBRE FROM META M, USUARIO U, RESUMEN_SEMANAL RE
WHERE M.NUMERO_RESUMEN=RE.NUMERO_RESUMEN AND RE.ID_USUARIO=U.ID_USUARIO GROUP BY U.NOMBRE;
