import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KartuNama extends StatelessWidget {
  const KartuNama({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kartu Nama Digital',
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/spiderman.jpg'),
                radius: 100.0,
              ),

              SizedBox(height: 10.0),
              Text(
                'Alamat Media Sosial',
                style: GoogleFonts.aladin(
                  fontSize: 30.0,
                  color: const Color.fromARGB(255, 1, 13, 4),
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                'Alfi Arifki',
                style: GoogleFonts.aladin(
                  fontSize: 20.0,
                  color: const Color.fromARGB(255, 1, 13, 4),
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(
                height: 10.0,
                width: 300.0,
                child: Divider(color: Colors.white),
              ),

              //card-1
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.white, width: 1.0),
                ),
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.phone,
                    color: Color.fromARGB(255, 43, 218, 8),
                  ),
                  title: Text(
                    '+62 85890531341',
                    style: GoogleFonts.aladin(
                      fontSize: 20.0,
                      color: const Color.fromARGB(255, 10, 220, 41),
                    ),
                  ),
                ),
              ),

              //card-2
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.white, width: 1.0),
                ),
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 219, 223, 139),
                  ),
                  title: Text(
                    'alfialfi@gmail.com',
                    style: GoogleFonts.aladin(
                      fontSize: 20.0,
                      color: const Color.fromARGB(255, 219, 223, 139),
                    ),
                  ),
                ),
              ),

              //card-3
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.white, width: 1.0),
                ),
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: const FaIcon(
                    FontAwesomeIcons.instagram,
                    color: const Color.fromARGB(255, 232, 10, 147),
                  ),
                  title: Text(
                    '@alfi_IG',
                    style: GoogleFonts.aladin(
                      fontSize: 20.0,
                      color: const Color.fromARGB(255, 232, 10, 147),
                    ),
                  ),
                ),
              ),

              //card-4
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.white, width: 1.0),
                ),
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: const FaIcon(
                    FontAwesomeIcons.tiktok,
                    color: Color.fromARGB(255, 21, 10, 6),
                  ),
                  title: Text(
                    '@alfi_TT',
                    style: GoogleFonts.aladin(
                      fontSize: 20.0,
                      color: Color.fromARGB(255, 21, 10, 6),
                    ),
                  ),
                ),
              ),

              //card-4
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.white, width: 1.0),
                ),
                color: Colors.white,
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 25.0,
                ),
                child: ListTile(
                  leading: const FaIcon(
                    FontAwesomeIcons.youtube,
                    color: const Color.fromARGB(255, 200, 13, 13),
                  ),
                  title: Text(
                    'alfi_YT',
                    style: GoogleFonts.aladin(
                      fontSize: 20.0,
                      color: const Color.fromARGB(255, 200, 13, 13),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
