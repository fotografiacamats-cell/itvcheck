export function generateStaticParams() {
  return [
    { slug: 'itv-madrid-alcorcon' },
    { slug: 'itv-madrid-villaverde' },
    { slug: 'itv-barcelona-zona-franca' },
  ];
}

export default function EstacionPage({ params }) {
  const { slug } = params;
  return (
    <div className="max-w-4xl mx-auto px-4 py-12">
      <h1 className="text-4xl font-bold mb-4">
        ITV en {slug.replace(/-/g, ' ')}
      </h1>
      <div className="bg-white p-6 rounded-lg shadow">
        <p className="text-gray-600 mb-4">
          Dirección: C/ Ejemplo, 123
        </p>
        <p className="text-gray-600 mb-4">
          Teléfono: 912 345 678
        </p>
        <div className="prose max-w-none">
          <p>Artículo generado por IA sobre esta estación ITV...</p>
        </div>
      </div>
    </div>
  );
}
