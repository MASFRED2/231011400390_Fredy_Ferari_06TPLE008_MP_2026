import 'package:flutter/material.dart';

void main() {
  runApp(const WorkshopApp());
}

class WorkshopApp extends StatelessWidget {
  const WorkshopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portal Workshop',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: const HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  String filterPilihan = 'Semua';

  final List<Map<String, dynamic>> dataWorkshop = [
    {
      'judul': 'Workshop Keamanan Jaringan: Protect Your System',
      'tanggal': 'Senin, 18 Mei 2026',
      'waktu': '09:00 - 12:00 WIB',
      'lokasi': 'Lab Komputer A',
      'kuota': 'Tersedia 15 Kursi',
      'isPenuh': false,
    },
    {
      'judul': 'UI/UX Design untuk Developer: Meningkatkan Pengalaman Pengguna',
      'tanggal': 'Selasa, 19 Mei 2026',
      'waktu': '13:00 - 15:30 WIB',
      'lokasi': 'Ruang Seminar Fasilkom',
      'kuota': 'Kuota Penuh',
      'isPenuh': true,
    },
    {
      'judul': 'Integrated Technology Workshop: AI, Web, dan Cyber Security',
      'tanggal': 'Rabu, 20 Mei 2026',
      'waktu': '08:00 - 11:30 WIB',
      'lokasi': 'Auditorium Utama',
      'kuota': 'Tersedia 5 Kursi',
      'isPenuh': false,
    },
    {
      'judul': 'Digital Innovation Workshop: Dari Ide ke Produk Teknologi',
      'tanggal': 'Kamis, 21 Mei 2026',
      'waktu': '10:00 - 14:00 WIB',
      'lokasi': 'Lab Komputer B',
      'kuota': 'Tersedia 20 Kursi',
      'isPenuh': false,
    },
    {
      'judul': 'Tech Ecosystem Workshop: Memahami Seluruh Alur Sistem Informatika',
      'tanggal': 'Jumat, 22 Mei 2026',
      'waktu': '13:30 - 16:00 WIB',
      'lokasi': 'Ruang Teater Kampus',
      'kuota': 'Kuota Penuh',
      'isPenuh': true,
    },
    {
      'judul': 'Unified IT Skills Workshop: Coding, Data, dan Infrastruktur',
      'tanggal': 'Sabtu, 23 Mei 2026',
      'waktu': '09:00 - 15:00 WIB',
      'lokasi': 'Lab Multimedia',
      'kuota': 'Tersedia 8 Kursi',
      'isPenuh': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    int totalSemua = dataWorkshop.length;
    int totalTersedia = dataWorkshop.where((w) => !w['isPenuh']).length;
    int totalPenuh = dataWorkshop.where((w) => w['isPenuh']).length;

    List<Map<String, dynamic>> workshopDitampilkan = dataWorkshop.where((w) {
      if (filterPilihan == 'Tersedia') return !w['isPenuh'];
      if (filterPilihan == 'Penuh') return w['isPenuh'];
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        title: const Text(
          'Workshop Kampus Kita',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'Fredy Ferari',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                '231011400390 | Mahasiswa',
                style: TextStyle(
                  fontSize: 11,
                  color: Colors.indigo.shade100,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            radius: 18,
            backgroundColor: Colors.indigo.shade50,
            child: const Text(
              'FF',
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  offset: const Offset(0, 4),
                  blurRadius: 6,
                ),
              ],
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ChoiceChip(
                    label: Text('Semua ($totalSemua)'),
                    selected: filterPilihan == 'Semua',
                    onSelected: (bool selected) {
                      setState(() {
                        filterPilihan = 'Semua';
                      });
                    },
                    selectedColor: Colors.indigo.shade100,
                    labelStyle: TextStyle(
                      color: filterPilihan == 'Semua' ? Colors.indigo.shade800 : Colors.black87,
                      fontWeight: filterPilihan == 'Semua' ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: Text('Tersedia ($totalTersedia)'),
                    selected: filterPilihan == 'Tersedia',
                    onSelected: (bool selected) {
                      setState(() {
                        filterPilihan = 'Tersedia';
                      });
                    },
                    selectedColor: Colors.green.shade100,
                    labelStyle: TextStyle(
                      color: filterPilihan == 'Tersedia' ? Colors.green.shade800 : Colors.black87,
                      fontWeight: filterPilihan == 'Tersedia' ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                  const SizedBox(width: 8),
                  ChoiceChip(
                    label: Text('Penuh ($totalPenuh)'),
                    selected: filterPilihan == 'Penuh',
                    onSelected: (bool selected) {
                      setState(() {
                        filterPilihan = 'Penuh';
                      });
                    },
                    selectedColor: Colors.red.shade100,
                    labelStyle: TextStyle(
                      color: filterPilihan == 'Penuh' ? Colors.red.shade800 : Colors.black87,
                      fontWeight: filterPilihan == 'Penuh' ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
              itemCount: workshopDitampilkan.length,
              itemBuilder: (context, index) {
                final item = workshopDitampilkan[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14.0),
                  child: KartuWorkshop(
                    judul: item['judul'],
                    tanggal: item['tanggal'],
                    waktu: item['waktu'],
                    lokasi: item['lokasi'],
                    kuota: item['kuota'],
                    isPenuh: item['isPenuh'],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class KartuWorkshop extends StatelessWidget {
  final String judul;
  final String tanggal;
  final String waktu;
  final String lokasi;
  final String kuota;
  final bool isPenuh;

  const KartuWorkshop({
    super.key,
    required this.judul,
    required this.tanggal,
    required this.waktu,
    required this.lokasi,
    required this.kuota,
    required this.isPenuh,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              judul,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                const Icon(Icons.calendar_today_rounded, color: Colors.black54, size: 18),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '$tanggal  •  $waktu',
                    style: const TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.location_on_rounded, color: Colors.black54, size: 18),
                const SizedBox(width: 10),
                Text(
                  lokasi,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 18),
            const Divider(color: Color(0xFFEAEAEA), thickness: 1, height: 1),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: isPenuh ? Colors.red.shade50 : Colors.green.shade50,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: isPenuh ? Colors.red.shade100 : Colors.green.shade100,
                    ),
                  ),
                  child: Text(
                    kuota,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: isPenuh ? Colors.red.shade700 : Colors.green.shade700,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: isPenuh ? null : () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Daftar',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}