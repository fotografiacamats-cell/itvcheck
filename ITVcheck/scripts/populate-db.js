import { parse } from 'csv-parse/sync';
import fs from 'fs';
import { createClient } from '@libsql/client';

const csvData = fs.readFileSync('estaciones.csv');
const estaciones = parse(csvData, { columns: true, skip_empty_lines: true });

const db = createClient({
  url: process.env.D1_DATABASE_URL,
  authToken: process.env.D1_AUTH_TOKEN,
});

await db.execute(`
  CREATE TABLE IF NOT EXISTS estaciones (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    slug TEXT UNIQUE,
    nombre TEXT,
    ciudad TEXT,
    provincia TEXT,
    direccion TEXT,
    lat REAL,
    lon REAL,
    articulo TEXT
  )
`);

for (const estacion of estaciones) {
  const slug = estacion.nombre.toLowerCase().replace(/\s/g, '-').normalize('NFD').replace(/[\u0300-\u036f]/g, '');
  await db.execute({
    sql: 'INSERT OR IGNORE INTO estaciones (slug, nombre, ciudad, provincia, direccion, lat, lon, articulo) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
    args: [slug, estacion.nombre, estacion.ciudad, estacion.provincia, estacion.direccion, parseFloat(estacion.lat), parseFloat(estacion.lon), 'Artículo pendiente de generar con IA']
  });
}
console.log('✅ Datos subidos a D1');