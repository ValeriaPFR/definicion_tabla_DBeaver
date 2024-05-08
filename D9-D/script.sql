-- Requerimientos

-- 1. Crear una base de datos llamada películas (1 Punto)
-- 2. Cargar ambos archivos a su tabla correspondiente (1 Punto)

-- 3. Obtener el ID de la película “Titanic” (1 Punto)

SELECT id, "Pelicula"
FROM public.peliculas
WHERE "Pelicula" = 'Titanic'

-- 4. Listar a todos los actores que aparecen en la película "Titanic" (1 Punto)

WITH a AS (
    SELECT p.id, p."Pelicula" as peli, r.actor
    FROM public.peliculas p
    LEFT JOIN public.reparto r ON p.id = r.id_pelicula
    WHERE p."Pelicula" = 'Titanic'
),

b AS (
	
)

SELECT * FROM a;


-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford (2 Puntos)

SELECT count(*)
FROM public.reparto
WHERE actor = 'Harrison Ford';


-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente (1 punto)

SELECT "Pelicula", "Año estreno"
FROM public.peliculas 
WHERE "Año estreno" >= 1990 and "Año estreno" < 1999
ORDER BY "Pelicula";

-- 7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo” (1 punto)

SELECT "Pelicula", LENGTH("Pelicula") AS longitud_titulo
FROM peliculas;

-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas (2 punto)

WITH LongitudMaxima AS (
    SELECT MAX(LENGTH("Pelicula")) AS max_length
    FROM peliculas
)
SELECT p."Pelicula", LENGTH(p."Pelicula") AS longitud_titulo
FROM peliculas p
WHERE LENGTH(p."Pelicula") = (SELECT max_length FROM LongitudMaxima);
