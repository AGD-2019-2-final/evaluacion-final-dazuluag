-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname 
--    FROM 
--        u 
--    WHERE 
--        SUBSTRING(firstname, 0, 1) >= 'm';
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
selected = FOREACH data GENERATE firstname;
filtered = FILTER selected BY LOWER(SUBSTRING(firstname, 0, 1)) >= 'm';
STORE filtered INTO 'output' USING PigStorage();
--fs -get -f output/ .;