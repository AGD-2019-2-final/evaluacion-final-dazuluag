-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
--fs -put -f data.tsv;
data = LOAD 'data.tsv' USING PigStorage()
    AS (
        letter:CHARARRAY,
        date:CHARARRAY,
        number:INT
    );
grouped = GROUP data BY letter;
counted = FOREACH grouped GENERATE group AS letter, COUNT(data) AS count;
STORE counted INTO 'output';
--fs -get -f output/ .;