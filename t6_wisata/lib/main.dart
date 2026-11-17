import 'package:flutter/material.dart';
import 'package:t6_wisata/homepage.dart';

void main() {
  runApp(const MyApp());
}

final List<Map<String, String>> travelData = [
  {
    'nama': 'Raja Ampat',
    'gambar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmyqBdGvQe7oF2X7jWvTraaz0Sf1hC3AnzKWh8a1UWfw&s',
    'lokasi': 'Papua',
  },
  {
    'nama': 'Candi Borobudur',
    'gambar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTm_bveJG60qNEkR3wLtDkc1Nj6Sbs7O5qsRYJByLYBBg&s=10',
    'lokasi': 'Jawa Tengah - Magelang',
  },
  {
    'nama': 'Rumah Alfi Arifki',
    'gambar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCj6jQo7X-C4-tHo75HmyGOcUzQRLjvMQHPycwDirA3A&s',
    'lokasi': 'Ciseureuh City',
  },
  {
    'nama': 'Rumah AAM',
    'gambar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPGDPQWLJVHUOzBLPH088HdwqeVVwnKFjeJHteBzs3Bw&s=10',
    'lokasi': 'Colibah City',
  },
  {
    'nama': 'Alun Alun Cianjur',
    'gambar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbij03Of1UnV6hZNoGxQK_XN4ELPKsaOWlaBN2F78zyQ&s=10',
    'lokasi': 'Cianjur City',
  },
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Katalog Wisata',
      home: HomePage(travelData: travelData),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
    );
  }
}
