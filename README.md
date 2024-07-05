# Restaurante-Stevan

# Base de datos : 

Ver modelado en la imagen png de Vista de datos. 

## Consulta Sql :

SELECT
    Libros.titulo AS TituloLibro,
    GroupCategorias.nombre_categoria AS Categoria
FROM
    Libros
JOIN
    GrupAutores ON Libros.id_GroupAutores = GrupAutores.id_GroupAutores
JOIN
    Autores ON GrupAutores.id_autor = Autores.id_autor
JOIN
    GroupCategorias ON Libros.id_GroupCategorias = GroupCategorias.GroupCategorias
JOIN
    Categorias ON GroupCategorias.id_categoria = Categorias.id_categoria
WHERE
    Autores.nombre = 'Nombre del Autor' AND Categorias.nombre = "Categoria";

## Optimizacion :

- Podria implementar inidices en la base de datos, de tal forma que las consultas sean mas rapidas.
- Si la cantidad de datos es enorme se podrian generar una tabla que contenga la misma informacion de los libros pero una tabla segmente un rango y la otra tabla segmente otro rango.
- Se podria implementar un escalado horizontal en la base de datos de tipo maestro esclavo con fin de que esta consukta al ser unicamente de lectura sea llamada desde la base de datos esclava.

