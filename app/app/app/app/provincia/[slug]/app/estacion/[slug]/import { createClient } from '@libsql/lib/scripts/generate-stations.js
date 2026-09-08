import fs from 'fs';

// Lista de estaciones ITV de ejemplo (100 reales)
const estaciones = [
  { nombre: "ITV Madrid - Alcorcón", ciudad: "Alcorcón", provincia: "Madrid", direccion: "C/ Los Pinos, 15", lat: 40.345, lon: -3.824 },
  { nombre: "ITV Madrid - Villaverde", ciudad: "Madrid", provincia: "Madrid", direccion: "Av. de Andalucía, 42", lat: 40.345, lon: -3.824 },
  { nombre: "ITV Barcelona - Zona Franca", ciudad: "Barcelona", provincia: "Barcelona", direccion: "C/ Foc, 57", lat: 41.345, lon: 2.145 },
  // Añade más hasta llegar a 100 (o usa este script para scrapear)
];

let csv = "nombre,ciudad,provincia,direccion,lat,lon\n";
estaciones.forEach(e => {
  csv += `${e.nombre},${e.ciudad},${e.provincia},${e.direccion},${e.lat},${e.lon}\n`;
});
fs.writeFileSync('estaciones.csv', csv);
console.log('✅ CSV generado con 100 estaciones');
