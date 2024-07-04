import React, { useState } from 'react';
import axios from 'axios';

const LibrosTable = () => {
  const [libros, setLibros] = useState([]);
  const [loading, setLoading] = useState(false); 

  const handleConsultarClick = () => {
    console.log("Funciona ???????")
    setLoading(true); 
    axios.get('http://127.0.0.1:8000/libros/')
      .then(response => {
        setLibros(response.data.data);
        setLoading(false); 
      })
      .catch(error => {
        console.error('Error fetching data:', error);
        setLoading(false);
      });
      console.log("Funciona ???????")
  };

  return (
    <div>
      <h2>Listado de Libros</h2>
      <button onClick={handleConsultarClick} disabled={loading}>
        {loading ? 'Cargando...' : 'Consultar Libros'}
      </button>
      <table>
        <thead>
          <tr>
            <th>Código</th>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Tipo de Libro</th>
            <th>Valor de Préstamo Tardío</th>
            <th>Categorías</th>
            <th>Autores</th>
          </tr>
        </thead>
        <tbody>
          {libros.map(libro => (
            <tr key={libro.codigo}>
              <td>{libro.codigo}</td>
              <td>{libro.nombre}</td>
              <td>{libro.descripcion}</td>
              <td>{libro.tipo_libro}</td>
              <td>{libro.valor_prestamo_tardio}</td>
              <td>{libro.categorias.join(', ')}</td>
              <td>{libro.autores.join(', ')}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default LibrosTable;