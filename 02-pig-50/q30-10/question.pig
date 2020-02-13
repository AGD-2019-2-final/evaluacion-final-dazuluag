-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el codigo en Pig para manipulación de fechas que genere la siguiente
-- salida.
-- 
--    1971-07-08,08,8,jue,jueves
--    1974-05-23,23,23,jue,jueves
--    1973-04-22,22,22,dom,domingo
--    1975-01-29,29,29,mie,miercoles
--    1974-07-03,03,3,mie,miercoles
--    1974-10-18,18,18,vie,viernes
--    1970-10-05,05,5,lun,lunes
--    1969-02-24,24,24,lun,lunes
--    1974-10-17,17,17,jue,jueves
--    1975-02-28,28,28,vie,viernes
--    1969-12-07,07,7,dom,domingo
--    1973-12-24,24,24,lun,lunes
--    1970-08-27,27,27,jue,jueves
--    1972-12-12,12,12,mar,martes
--    1970-07-01,01,1,mie,miercoles
--    1974-02-11,11,11,lun,lunes
--    1973-04-01,01,1,dom,domingo
--    1973-04-29,29,29,dom,domingo
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
--fs -put -f data.csv;
data = LOAD 'data.csv' USING PigStorage(',')
    AS (
        id: INT,
        firstname: CHARARRAY,
        lastname: CHARARRAY,
        birthday: CHARARRAY,
        color: CHARARRAY,
        quantity: INT
    );
selected = FOREACH data GENERATE birthday, ToDate(birthday, 'yyyy-MM-dd') AS birthday_date;
selected_1 = FOREACH selected GENERATE birthday,
                ToString(birthday_date, 'dd'), 
                ToString(birthday_date, 'd'),
                (CASE ToString(birthday_date, 'EEE')
                    WHEN 'Sun' THEN 'dom'
                    WHEN 'Mon' THEN 'lun'
                    WHEN 'Tue' THEN 'mar'
                    WHEN 'Wed' THEN 'mie'
                    WHEN 'Thu' THEN 'jue'
                    WHEN 'Fri' THEN 'vie'
                    WHEN 'Sat' THEN 'sab'
                    ELSE '' END),
                (CASE ToString(birthday_date, 'EEEEE')
                    WHEN 'Sunday' THEN 'domingo'
                    WHEN 'Monday' THEN 'lunes'
                    WHEN 'Tuesday' THEN 'martes'
                    WHEN 'Wednesday' THEN 'miercoles'
                    WHEN 'Thursday' THEN 'jueves'
                    WHEN 'Friday' THEN 'viernes'
                    WHEN 'Saturday' THEN 'sabado'
                    ELSE '' END);
STORE selected_1 INTO 'output' USING PigStorage(',');
--fs -get -f output/ .;