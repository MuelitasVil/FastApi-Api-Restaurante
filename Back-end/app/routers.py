from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from typing import List
from app.models import Libro, Biblioteca
from app.schemas import Libro as LibroSchema, LibroResponse

RouteLibro = APIRouter(
    prefix="/libros", tags=["Libros"]
)

# Crear objeto de Biblioteca y poblar con libros
biblioteca = Biblioteca()
biblioteca.añadirLibro(Libro(
    codigo=1,
    nombre="1984",
    descripcion="Una novela distópica de George Orwell.",
    tipo_libro="Ficción",
    valor_prestamo_tardio=1.5,
    categorias=["Distopía", "Política"],
    autores=["George Orwell"]
))
biblioteca.añadirLibro(Libro(
    codigo=2,
    nombre="To Kill a Mockingbird",
    descripcion="Una novela de Harper Lee.",
    tipo_libro="Ficción",
    valor_prestamo_tardio=1.0,
    categorias=["Clásico", "Derechos Civiles"],
    autores=["Harper Lee"]
))

@RouteLibro.get("/", response_model=LibroResponse, status_code=200)
async def get_libros():
    return LibroResponse(data=[LibroSchema(**libro.__dict__) for libro in biblioteca.libros], detail="Libros obtenidos exitosamente", response=True)

@RouteLibro.post("/", response_model=LibroResponse, status_code=201)
async def add_libro(libro: LibroSchema):
    nuevo_libro = Libro(**libro.dict())
    biblioteca.añadirLibro(nuevo_libro)
    return LibroResponse(data=libro, detail="Libro añadido exitosamente", response=True)

@RouteLibro.put("/", response_model=LibroResponse, status_code=200)
async def update_libro(libro: LibroSchema):
    biblioteca.actualizarLibro(Libro(**libro.dict()))
    return LibroResponse(data=libro, detail="Libro actualizado exitosamente", response=True)

@RouteLibro.delete("/{codigo}", response_model=LibroResponse, status_code=200)
async def delete_libro(codigo: int):
    biblioteca.eliminarLibro(codigo)
    return LibroResponse(data=None, detail=f"Libro con código {codigo} eliminado exitosamente", response=True)