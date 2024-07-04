from pydantic import BaseModel
from typing import List, Union

class Libro(BaseModel):
    codigo: int
    nombre: str
    descripcion: str
    tipo_libro: str
    valor_prestamo_tardio: float
    categorias: List[str]
    autores: List[str]

    class Config:
        orm_mode = True

class LibroResponse(BaseModel):
    data: Union[Libro, List[Libro], None]
    detail: str
    response: bool