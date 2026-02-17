import 'package:flutter/material.dart';

void main() {
  runApp(const PChopApp());
}

class PChopApp extends StatelessWidget {
  const PChopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const PantallaPChop(),
    );
  }
}

class PantallaPChop extends StatelessWidget {
  const PantallaPChop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB39DDB),
        title: const Text("PChop", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.black), onPressed: () {}),
          IconButton(icon: const Icon(Icons.menu, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("BIENVENIDO!!!", 
                  style: TextStyle(fontSize: 28,color: Color(0xFF5E35B1))),
                const Text("Productos destacados", 
                  style: TextStyle(fontSize: 16, color: Colors.black54)),
                const SizedBox(height: 25),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    children: [
                      // Estas URLs son infalibles para Web
                      _productoCard(
                        const Color(0xFFE1BEE7), 
                        "https://picsum.photos/id/1/400/400", // Representa Laptop/Tech
                        "\$1,500"
                      ),
                      _productoCard(
                        const Color(0xFFD1C4E9), 
                        "https://picsum.photos/id/160/400/400", // Representa Celular/Tech
                        "\$18,000"
                      ),
                      _productoCard(
                        const Color(0xFFCE93D8), 
                        "https://images.unsplash.com/photo-1587202372775-e229f172b9d7?w=400", 
                        "\$2,000"
                      ),
                      _productoCard(
                        const Color(0xFFB39DDB), 
                        "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400", 
                        "\$7,500"
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _productoCard(Color color, String url, String precio) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.zero,
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              url,
              width: double.infinity,
              fit: BoxFit.cover,
              // Esto ayuda a manejar la carga en Web
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(child: CircularProgressIndicator());
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(child: Icon(Icons.image_not_supported, size: 40));
              },
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.black, width: 2)),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              precio,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}