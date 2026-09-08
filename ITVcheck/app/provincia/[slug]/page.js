export default function ProvinciaPage({ params }) {
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
}