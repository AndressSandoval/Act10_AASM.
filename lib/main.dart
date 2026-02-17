import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const InstrumentosScreen(),
    );
  }
}

class InstrumentosScreen extends StatelessWidget {
  const InstrumentosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // 1. Barra superior Azul Turquesa
      appBar: AppBar(
        backgroundColor: const Color(0xFF40E0D0), // Turquesa
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.white), // Menú hamburguesa
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'INSTRUMENTOS',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.music_note, color: Colors.white, size: 20),
            const Icon(Icons.music_video, color: Colors.white, size: 20),
          ],
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              const Icon(Icons.shopping_cart_outlined, color: Colors.white),
              Positioned(
                bottom: 5,
                child: const Text("225 \$", style: TextStyle(color: Colors.white, fontSize: 10)),
              )
            ],
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // 2. Barra de búsqueda
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Buscar...',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.apps),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              // 3. Título "MÁS VENDIDOS" con subrayado
              Column(
                children: [
                  const Text(
                    'MÁS VENDIDOS',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                  ),
                  Container(
                    height: 4,
                    width: 150,
                    color: const Color(0xFF40E0D0),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // 4. Grid de productos (Estructura de la foto)
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.65,
                children: [
                  _buildProductCard('Les Paul', '76,699 \$', 'https://raw.githubusercontent.com/AndressSandoval/imagenes/refs/heads/main/13301316_800.jpg'),
                  _buildProductCard('Kit de Batería', '10,999 \$', 'https://raw.githubusercontent.com/AndressSandoval/imagenes/refs/heads/main/bateria.jpg'), 
                  _buildProductCard('Capo traste', '799.99 \$', 'https://raw.githubusercontent.com/AndressSandoval/imagenes/refs/heads/main/capo.webp'),
                  _buildProductCard('Bajo eléctrico', '6,449.80 \$', 'https://raw.githubusercontent.com/AndressSandoval/imagenes/refs/heads/main/bajo.jpg'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget auxiliar para las tarjetas de producto
  Widget _buildProductCard(String name, String price, String imageUrl) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black54),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.network(imageUrl, fit: BoxFit.cover),
          ),
          const SizedBox(height: 10),
          Text(name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
          Text(
            price,
            style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 5),
          const Text(
            'ver más',
            style: TextStyle(decoration: TextDecoration.underline, fontSize: 12),
          ),
        ],
      ),
    );
  }
}