# Restaurante-Stevan

# Api :

## Correr el proyecto entorno vitual de python : 
- Crear ambiente : py -m venv .venv
- Entrar al ambiente virtual : .venv\Scripts\activate
- Descargar los paquetes de pip : pip install -r .\requirements.txt
- Desplegar el proyecto en carpeta app : uvicorn main:app --reload

## Correr el proyecto con docker compose :
- docker compose up

# Descripcion api :

Ingrese al swageer que contiene la informacion donde puede consultar los endPoints 
http://127.0.0.1:8000/docs

- get : Sin parametros de entrada regresa todos los libros
- post : Se ingresa u Json la informacion del ibro y se añade a la biblioteca de schema.py
- put : Se ingresa el Json con la informacion a editar y se usa el metodo de la clase biblioteca de actualizar
- del : Se ingresa el codigo del libro que se desea eliminar 
