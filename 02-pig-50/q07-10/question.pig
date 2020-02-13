-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
--fs -put -f data.tsv;
data = LOAD 'data.tsv' USING PigStorage()
    AS (
        f1:CHARARRAY, 
        f2:BAG{t: TUPLE(p:CHARARRAY)}, 
        f3:MAP[]
    );
selected = FOREACH data GENERATE f1, SIZE(f2) AS f2_size, SIZE(f3) AS f3_size;
ordered = ORDER selected BY f1, f2_size, f3_size;
STORE ordered INTO 'output' USING PigStorage(',');
--fs -get -f output/ .;