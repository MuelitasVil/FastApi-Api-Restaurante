import React from 'react';
import './App.css';
import LibrosTable from './components/LibrosTable';

function App() {
  console.log("Funciona ???????")
  return (
    <div className="App">
      <header className="App-header">
        <h1>Proyecto de Libros</h1>
        <LibrosTable />
      </header>
    </div>
  );
}

export default App;