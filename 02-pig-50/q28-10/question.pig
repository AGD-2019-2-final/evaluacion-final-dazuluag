-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        birthday, 
--        DATE_FORMAT(birthday, "yyyy"),
--        DATE_FORMAT(birthday, "yy"),
--    FROM 
--        persons
--    LIMIT
--        5;
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
selected = FOREACH data GENERATE ToDate(birthday, 'yyyy-MM-dd') AS birthday_date;
selected_1 = FOREACH selected GENERATE ToString(birthday_date, 'yyyy'), ToString(birthday_date, 'yy');
STORE selected_1 INTO 'output' USING PigStorage(',');
--fs -get -f output/ .;