export const metadata = {
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
}