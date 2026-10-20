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
  String _keterangan = "Silakan isi data Anda";
  String _jenisKelamin = "Laki-laki";

  final Color _primaryColor = const Color(0xFF36C576);

  void _hitungBMI() {
    FocusScope.of(context).unfocus();

    final double bb = double.tryParse(_bbController.text) ?? 0;
    final double tbCm = double.tryParse(_tbController.text) ?? 0;

    setState(() {
      if (bb > 0 && tbCm > 0) {
        final double tbM = tbCm / 100;
        final double bmi = bb / (tbM * tbM);
        _hasilBMI = bmi;

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
            _keterangan = "Ideal (Standar Alfi)";
          } else if (bmi < 28) {
            _keterangan = "Gendut (Olahraga Bos)";
          } else {
            _keterangan = "OBESITAS";
          }
        }
      } else {
        _hasilBMI = null;
        _keterangan = "Masukan Data Yang Valid!";
      }
    });
  }

  void _reset() {
    FocusScope.of(context).unfocus();
    setState(() {
      _bbController.clear();
      _tbController.clear();
      _hasilBMI = null;
      _keterangan = "Silakan isi data Anda";
      _jenisKelamin = "Laki-laki";
    });
  }

  @override
  void dispose() {
    _bbController.dispose();
    _tbController.dispose();
    super.dispose();
  }

  Widget _buildGenderCard(String title, IconData icon) {
    bool isSelected = _jenisKelamin == title;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _jenisKelamin = title;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: isSelected ? _primaryColor.withOpacity(0.2) : Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: isSelected ? _primaryColor : Colors.grey.shade300,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                size: 50,
                color: isSelected ? _primaryColor : Colors.grey,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isSelected ? _primaryColor : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: _primaryColor,
        title: const Text(
          'KALKULATOR BMI',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Pilihan Jenis Kelamin (Modern Cards)
              Row(
                children: [
                  _buildGenderCard('Laki-laki', Icons.male),
                  const SizedBox(width: 15),
                  _buildGenderCard('Perempuan', Icons.female),
                ],
              ),
              const SizedBox(height: 30),

              TextField(
                controller: _bbController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.monitor_weight_outlined,
                    color: _primaryColor,
                  ),
                  labelText: 'Berat Badan',
                  suffixText: 'kg',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _tbController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.height, color: _primaryColor),
                  labelText: 'Tinggi Badan',
                  suffixText: 'cm',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // 3. Tombol Hitung Full Width
              ElevatedButton(
                onPressed: _hitungBMI,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  'HITUNG BMI',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // 4. Area Hasil (Card dengan Shadow)
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [_primaryColor, Color(0xFF2B9D5E)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: _primaryColor.withOpacity(0.4),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'HASIL BMI ANDA',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _hasilBMI?.toStringAsFixed(1) ?? "0.0",
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _keterangan,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // 5. Tombol Reset Bentuk TextButton (Lebih rapi)
              TextButton.icon(
                onPressed: _reset,
                icon: const Icon(Icons.refresh, color: Colors.grey),
                label: const Text(
                  'Ulangi Perhitungan',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
