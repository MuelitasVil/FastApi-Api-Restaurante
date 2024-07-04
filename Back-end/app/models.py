class Libro:
    def __init__(self, codigo : int ,nombre : str, descripcion : str, tipo_libro : str, valor_prestamo_tardio : float,
                 categorias : list, autores : list):
        self.codigo = codigo 
        self.nombre = nombre
        self.descripcion = descripcion
        self.tipo_libro = tipo_libro
        self.valor_prestamo_tardio = valor_prestamo_tardio
        self.categorias = categorias
        self.autores = autores


class Biblioteca:
    libros = []

    def añadirLibro(self, libro : Libro):
        self.libros.append(libro)

    def eliminarLibro(self, codigo : int):
        for i in range(len(self.libros)):
            libro : Libro = self.libros[i]
            if libro.codigo == codigo:
                self.libros.pop(i)
                break

    def actualizarLibro(self, libron : Libro):
        for i in range(len(self.libros)):
            libro : Libro = self.libros[i]
            if libro.codigo == libron.codigo:
                self.libros[i] = libro
                break

