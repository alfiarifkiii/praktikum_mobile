import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => BMIScreenState();
}

class BMIScreenState extends State<BMIScreen> {
  final _bbController = TextEditingController();
  final _tbController = TextEditingController();

  double? _hasilBMI;
  String _keterangan = "Masukan Data Anda";
  String _jenisKelamin = "Laki-laki"; // State untuk jenis kelamin

  void _hitungBMI() {
    final double bb = double.tryParse(_bbController.text) ?? 0;
    final double tbCm = double.tryParse(_tbController.text) ?? 0;

    setState(() {
      if (bb > 0 && tbCm > 0) {
        final double tbM = tbCm / 100;
        final double bmi = bb / (tbM * tbM);
        _hasilBMI = bmi;

        // Logika dipisah berdasarkan jenis kelamin
        if (_jenisKelamin == 'Laki-laki') {
          if (bmi < 18.5) {
            _keterangan = "Kurus (Kekurangan berat badan)";
          } else if (bmi < 25) {
            _keterangan = "Normal (Berat badan ideal)";
          } else if (bmi < 30) {
            _keterangan = "Gemuk (Berat badan berlebih)";
          } else {
            _keterangan = "OBESITAS";
          }
        } else {
          if (bmi < 18.5) {
            _keterangan = "Kurus (Kebanyakan diet)";
          } else if (bmi < 23) {
            // Batas atas ideal lebih rendah
            _keterangan = "Ideal (Standar Alfi)";
          } else if (bmi < 28) {
            _keterangan = "Gendut (Olaharaga Bos)";
          } else {
            _keterangan = "OBESITAS";
          }
        }
      } else {
        _hasilBMI = null;
        _keterangan = "Masukan Data Yang Valid";
      }
    });
  }

  void _reset() {
    setState(() {
      _bbController.clear();
      _tbController.clear();
      _hasilBMI = null;
      _keterangan = "Masukan Data Anda";
      _jenisKelamin = "Laki-laki"; // Reset ke default
    });
  }

  @override
  void dispose() {
    _bbController.dispose();
    _tbController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 54, 197, 118),
        title: Text(
          'Kalkulator BMI',
          style: TextStyle(color: Colors.white, letterSpacing: 5),
        ),
        leading: Icon(Icons.calculate, color: Colors.white),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              // Pilihan Jenis Kelamin
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<String>(
                    value: 'Laki-laki',
                    groupValue: _jenisKelamin,
                    onChanged: (value) {
                      setState(() {
                        _jenisKelamin = value!;
                      });
                    },
                  ),
                  Text('Laki-laki'),
                  SizedBox(width: 20),
                  Radio<String>(
                    value: 'Perempuan',
                    groupValue: _jenisKelamin,
                    onChanged: (value) {
                      setState(() {
                        _jenisKelamin = value!;
                      });
                    },
                  ),
                  Text('Perempuan'),
                ],
              ),
              SizedBox(height: 20),

              TextField(
                controller: _bbController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  icon: Icon(Icons.line_weight_outlined),
                  labelText: 'Berat Badan (kg)',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _tbController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  icon: Icon(Icons.height),
                  labelText: 'Tinggi Badan (cm)',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _hitungBMI,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                ),
                child: Icon(
                  Icons.calculate,
                  size: 30,
                  color: Color.fromARGB(255, 54, 197, 118),
                ),
              ),
              SizedBox(height: 30),
              Text('Hasil', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(30),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 54, 197, 118),
                ),
                child: Column(
                  children: [
                    Text(
                      _hasilBMI?.toStringAsFixed(1) ?? "--",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      _keterangan,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _reset,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                ),
                child: Icon(
                  Icons.refresh,
                  size: 30,
                  color: Color.fromARGB(255, 54, 197, 118),
                ),
              ),
              SizedBox(height: 10),
              Text('Reset'),
            ],
          ),
        ),
      ),
    );
  }
}
