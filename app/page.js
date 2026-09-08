export default function Home() {
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
}