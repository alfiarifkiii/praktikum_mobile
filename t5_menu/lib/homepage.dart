import 'package:flutter/material.dart';
import 'package:t5_menu/pagedetail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        'nama': 'Sate Ayam Madura',
        'harga': 'Rp 25.000',
        'deskripsi': 'Sate ayam empuk dengan siraman bumbu kacang legit, kecap manis, dan taburan bawang merah segar.',
        'gambar': 'https://images.unsplash.com/photo-1529563064382-5926344d1502?q=80&w=400',
      },
      {
        'nama': 'Sate Padang Pariaman',
        'harga': 'Rp 35.000',
        'deskripsi': 'Sate daging sapi dan lidah dengan kuah bumbu kuning kental yang pedas, gurih, dan kaya rempah.',
        'gambar': 'https://images.unsplash.com/photo-1621852004158-f3bc188ace2d?q=80&w=400',
      },
      {
        'nama': 'Sate Taichan Senayan',
        'harga': 'Rp 28.000',
        'deskripsi': 'Sate daging dada ayam putih tanpa bumbu kacang, disajikan dengan sambal rawit pedas dan perasan jeruk nipis.',
        'gambar': 'https://images.unsplash.com/photo-1598511757337-fe2cafc31ba0?q=80&w=400',
      },
      {
        'nama': 'Sate Lilit Bali',
        'harga': 'Rp 30.000',
        'deskripsi': 'Sate daging ikan atau ayam cincang berbumbu basa genep Bali yang dililitkan pada batang serai.',
        'gambar': 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=400',
      },
      {
        'nama': 'Sate Maranggi Purwakarta',
        'harga': 'Rp 40.000',
        'deskripsi': 'Sate daging sapi manis gurih tanpa saus kacang, disajikan dengan irisan tomat, cabai, dan bawang merah.',
        'gambar': 'https://images.unsplash.com/photo-1544025162-d76694265947?q=80&w=400',
      },
      {
        'nama': 'Sate Buntel Solo',
        'harga': 'Rp 45.000',
        'deskripsi': 'Sate daging kambing cincang yang dibungkus lemak tipis, dibakar hingga karamelisasinya sempurna.',
        'gambar': 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1?q=80&w=400',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        leading: const Icon(Icons.local_fire_department),
        title: const Text(
          'Kedai Sate Nusantara',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 0.5),
        ),
        backgroundColor: Colors.brown[800], // Coklat gelap khas sate
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(), // Animasi scroll lebih mulus
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      nama: product['nama']!,
                      harga: product['harga']!,
                      deskripsi: product['deskripsi']!,
                      gambar: product['gambar']!,
                    ),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gambar Produk
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        product['gambar']!,
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 90,
                            height: 90,
                            color: Colors.grey[200],
                            child: Icon(
                              Icons.fastfood,
                              color: Colors.grey[400],
                              size: 40,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Detail Produk
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['nama']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            product['harga']!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.orange[800],
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            product['deskripsi']!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                              height: 1.3,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Icon Panah Kanan
                    const Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey,
                        size: 16,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
