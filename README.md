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


# Api :

## Correr el proyecto (Back-End PYTHON) : 
- Crear ambiente : py -m venv .venv
- Entrar al ambiente virtual : .venv\Scripts\activate
- Descargar los paquetes de pip : pip install -r .\requirements.txt
- Desplegar el proyecto en carpeta app : uvicorn main:app --reload

# Descripcion api :

Ingrese al swageer que contiene la informacion donde puede consultar los endPoints 
http://127.0.0.1:8000/docs

- get : Sin parametros de entrada regresa todos los libros
- post : Se ingresa u Json la informacion del ibro y se añade a la biblioteca de schema.py
- put : Se ingresa el Json con la informacion a editar y se usa el metodo de la clase biblioteca de actualizar
- del : Se ingresa el codigo del libro que se desea eliminar 