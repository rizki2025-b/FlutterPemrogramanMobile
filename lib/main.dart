import 'package:flutter/material.dart';

void main() {
  runApp(const PraktikumApp());
}

class PraktikumApp extends StatelessWidget {
  const PraktikumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 2 Praktikum',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PraktikumPage(),
    );
  }
}

class PraktikumPage extends StatefulWidget {
  const PraktikumPage({super.key});

  @override
  State<PraktikumPage> createState() => _PraktikumPageState();
}

class _PraktikumPageState extends State<PraktikumPage> {
  bool _showImage = false; // state toggle gambar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Praktikum Tugas 2"),
      ),
      body: Column(
        children: [
          // Bagian teks panjang scrollable
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: const Text(
                "Gambar dibawah ini menampilkan seporsi mie kuah khas dari aceh. "
                "disajikan dengan tampilan yang sangat menggugah selera.\n"
                "Terlihat mie kuning tebal yang dilapisi kuah kental berwarna merah kecokelatan,\n"
                "mencerminkan bumbu rempah yang kaya dan kuat. Hidangan ini dilengkapi dengan berbagai topping seperti udang, "
                "potongan daging, serta seafood seperti cumi. Di sisi piring terdapat irisan bawang merah segar, "
                "potongan timun, dan jeruk nipis yang menambah kesegaran. "
                "disajikan di atas alas daun pisang yang memberikan kesan tradisional, "
                "sementara di sampingnya terdapat kerupuk sebagai pelengkap."
                "Secara keseluruhan, hidangan ini tampak gurih, pedas, "
                "dan kaya rasa, khas masakan Aceh yang terkenal.\n",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Bagian ImageView / Container
          Container(
            height: 200,
            width: double.infinity,
            color: _showImage ? Colors.transparent : Colors.grey[300],
            child: _showImage
                ? Image.asset(
                    'assets/mie_aceh.png', // pastikan ada di assets
                    fit: BoxFit.contain,
                  )
                : const Center(
                    child: Text(
                      "Warna Background",
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
          ),

          const SizedBox(height: 10),

          // Tombol-tombol (layout horizontal)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showImage = !_showImage; // toggle gambar ↔ warna
                  });
                },
                child: Text(
                  _showImage ? "Kembali ke Warna" : "Tampilkan Gambar",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Tombol lain ditekan!"),
                    ),
                  );
                },
                child: const Text("Tombol Lain"),
              ),
            ],
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}