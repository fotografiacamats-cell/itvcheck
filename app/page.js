export default function Home() {
  return (
    <div className="min-h-screen bg-gradient-to-br from-blue-50 to-indigo-100">
      <div className="max-w-6xl mx-auto px-4 py-16">
        <div className="text-center">
          <h1 className="text-6xl font-extrabold text-transparent bg-clip-text bg-gradient-to-r from-blue-600 to-indigo-600 mb-4">
            ITVCheck
          </h1>
          <p className="text-xl text-gray-700 mb-8">
            Encuentra tu estación ITV más cercana y pasa la inspección sin problemas
          </p>
          <div className="max-w-md mx-auto flex gap-2">
            <input
              type="text"
              placeholder="Busca por ciudad o provincia..."
              className="flex-1 px-4 py-3 border border-gray-300 rounded-lg shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
            />
            <button className="px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition shadow-md">
              Buscar
            </button>
          </div>
        </div>

        <div className="mt-16 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-4 gap-6">
          {['Madrid', 'Barcelona', 'Valencia', 'Sevilla'].map((ciudad) => (
            <div key={ciudad} className="bg-white p-6 rounded-2xl shadow-lg hover:shadow-xl transition text-center border border-gray-100">
              <h3 className="text-2xl font-bold text-gray-800">{ciudad}</h3>
              <p className="text-gray-500 mt-1">12 estaciones</p>
              <a href={`/provincia/${ciudad.toLowerCase()}`} className="mt-4 inline-block text-blue-600 hover:text-blue-800 text-sm font-medium">
                Ver todas →
              </a>
            </div>
          ))}
        </div>

        <div className="mt-16 text-center text-gray-500 text-sm">
          <p>📋 Más de 500 estaciones ITV en toda España · Actualizado 2026</p>
        </div>
      </div>
    </div>
  );
}
