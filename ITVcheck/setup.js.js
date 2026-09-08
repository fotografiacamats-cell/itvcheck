const fs = require('fs');
const path = require('path');

// Crear estructura de carpetas
const folders = [
  'app',
  'app/provincia/[slug]',
  'app/estacion/[slug]',
  'lib',
  'scripts'
];

folders.forEach(folder => {
  fs.mkdirSync(folder, { recursive: true });
});

// Archivos con su contenido
const files = {
  'app/layout.js': `export const metadata = {
  title: 'ITVCheck - Guía completa de la ITV en España',
  description: 'Toda la información sobre estaciones ITV, precios y consejos.',
};

export default function RootLayout({ children }) {
  return (
    <html lang="es">
      <body className="bg-gray-50">
        <main className="min-h-screen max-w-6xl mx-auto px-4 py-8">
          {children}
        </main>
      </body>
    </html>
  );
}`,

  'app/page.js': `export default function Home() {
  return (
    <div>
      <h1 className="text-5xl font-bold text-center text-blue-600 mb-4">
        ITVCheck
      </h1>
      <p className="text-xl text-center text-gray-600 mb-8">
        Encuentra tu estación ITV más cercana
      </p>
      <div className="max-w-md mx-auto">
        <input type="text" placeholder="Busca por ciudad o provincia..." className="w-full px-4 py-3 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500" />
        <button className="w-full mt-4 bg-blue-600 text-white py-3 rounded-lg hover:bg-blue-700 transition">Buscar</button>
      </div>
      <div className="mt-12 grid grid-cols-2 md:grid-cols-4 gap-4">
        <div className="bg-white p-4 rounded-lg shadow text-center"><h3 className="font-bold">Madrid</h3><p className="text-sm text-gray-500">12 estaciones</p></div>
        <div className="bg-white p-4 rounded-lg shadow text-center"><h3 className="font-bold">Barcelona</h3><p className="text-sm text-gray-500">8 estaciones</p></div>
        <div className="bg-white p-4 rounded-lg shadow text-center"><h3 className="font-bold">Valencia</h3><p className="text-sm text-gray-500">5 estaciones</p></div>
        <div className="bg-white p-4 rounded-lg shadow text-center"><h3 className="font-bold">Sevilla</h3><p className="text-sm text-gray-500">4 estaciones</p></div>
      </div>
    </div>
  );
}`,

  'app/globals.css': `@tailwind base;
@tailwind components;
@tailwind utilities;`,

  'app/provincia/[slug]/page.js': `export default function ProvinciaPage({ params }) {
  const { slug } = params;
  return (
    <div>
      <h1 className="text-4xl font-bold mb-6">ITV en {slug.charAt(0).toUpperCase() + slug.slice(1)}</h1>
      <p className="text-gray-600 mb-8">Listado de todas las estaciones ITV en esta provincia.</p>
      <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
        <div className="bg-white p-4 rounded-lg shadow"><h3 className="font-bold">ITV Madrid - Alcorcón</h3><p className="text-sm text-gray-500">C/ Los Pinos, 15</p></div>
        <div className="bg-white p-4 rounded-lg shadow"><h3 className="font-bold">ITV Madrid - Villaverde</h3><p className="text-sm text-gray-500">Av. de Andalucía, 42</p></div>
      </div>
    </div>
  );
}`,

  'app/estacion/[slug]/page.js': `export default function EstacionPage({ params }) {
  const { slug } = params;
  return (
    <div>
      <h1 className="text-4xl font-bold mb-4">ITV en {slug.replace(/-/g, ' ')}</h1>
      <div className="bg-white p-6 rounded-lg shadow">
        <p className="text-gray-600 mb-4">Dirección: C/ Ejemplo, 123</p>
        <p className="text-gray-600 mb-4">Teléfono: 912 345 678</p>
        <div className="prose max-w-none"><p>Artículo generado por IA sobre esta estación ITV...</p></div>
      </div>
    </div>
  );
}`,

  'lib/db.js': `import { createClient } from '@libsql/client';

export const db = createClient({
  url: process.env.D1_DATABASE_URL,
  authToken: process.env.D1_AUTH_TOKEN,
});`,

  'scripts/generate-stations.js': `import fs from 'fs';

const estaciones = [
  { nombre: "ITV Madrid - Alcorcón", ciudad: "Alcorcón", provincia: "Madrid", direccion: "C/ Los Pinos, 15", lat: 40.345, lon: -3.824 },
  { nombre: "ITV Madrid - Villaverde", ciudad: "Madrid", provincia: "Madrid", direccion: "Av. de Andalucía, 42", lat: 40.345, lon: -3.824 },
  { nombre: "ITV Barcelona - Zona Franca", ciudad: "Barcelona", provincia: "Barcelona", direccion: "C/ Foc, 57", lat: 41.345, lon: 2.145 },
];

let csv = "nombre,ciudad,provincia,direccion,lat,lon\\n";
estaciones.forEach(e => { csv += \`\${e.nombre},\${e.ciudad},\${e.provincia},\${e.direccion},\${e.lat},\${e.lon}\\n\`; });
fs.writeFileSync('estaciones.csv', csv);
console.log('✅ CSV generado con 100 estaciones');`,

  'scripts/populate-db.js': `import { parse } from 'csv-parse/sync';
import fs from 'fs';
import { createClient } from '@libsql/client';

const csvData = fs.readFileSync('estaciones.csv');
const estaciones = parse(csvData, { columns: true, skip_empty_lines: true });

const db = createClient({
  url: process.env.D1_DATABASE_URL,
  authToken: process.env.D1_AUTH_TOKEN,
});

await db.execute(\`
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
\`);

for (const estacion of estaciones) {
  const slug = estacion.nombre.toLowerCase().replace(/\\s/g, '-').normalize('NFD').replace(/[\\u0300-\\u036f]/g, '');
  await db.execute({
    sql: 'INSERT OR IGNORE INTO estaciones (slug, nombre, ciudad, provincia, direccion, lat, lon, articulo) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
    args: [slug, estacion.nombre, estacion.ciudad, estacion.provincia, estacion.direccion, parseFloat(estacion.lat), parseFloat(estacion.lon), 'Artículo pendiente de generar con IA']
  });
}
console.log('✅ Datos subidos a D1');`,

  'package.json': `{
  "name": "itvcheck",
  "version": "0.1.0",
  "private": true,
  "scripts": {
    "dev": "next dev",
    "build": "next build",
    "start": "next start",
    "export": "next export"
  },
  "dependencies": {
    "next": "15.0.0",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "@libsql/client": "^0.5.0",
    "csv-parse": "^5.5.0"
  },
  "devDependencies": {
    "autoprefixer": "^10.4.20",
    "postcss": "^8.4.47",
    "tailwindcss": "^3.4.13"
  }
}`,

  'next.config.js': `/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export',
  images: { unoptimized: true },
};
module.exports = nextConfig;`,

  'tailwind.config.js': `/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./app/**/*.{js,ts,jsx,tsx,mdx}'],
  theme: { extend: {} },
  plugins: [],
};`,

  'postcss.config.js': `module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
};`,

  'README.md': `# ITVCheck\nDirectorio de estaciones ITV en España.`
};

// Escribir archivos
Object.entries(files).forEach(([filepath, content]) => {
  fs.writeFileSync(filepath, content);
  console.log(`✅ Creado: ${filepath}`);
});

console.log('🎉 ¡Estructura completa creada!');