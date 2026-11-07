import 'package:flutter/material.dart';

void main() {
  runApp(const AplikasiUMKM());
}

class AplikasiUMKM extends StatefulWidget {
  const AplikasiUMKM({super.key});

  @override
  State<AplikasiUMKM> createState() => _AplikasiUMKMState();
}

class _AplikasiUMKMState extends State<AplikasiUMKM> {
  bool modeGelap = false;

  void ubahTema() {
    setState(() {
      modeGelap = !modeGelap;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dapur Melayu Medan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: modeGelap ? ThemeMode.dark : ThemeMode.light,
      home: HalamanUMKM(modeGelap: modeGelap, onUbahTema: ubahTema),
    );
  }
}

class HalamanUMKM extends StatelessWidget {
  final bool modeGelap;
  final VoidCallback onUbahTema;

  const HalamanUMKM({
    super.key,
    required this.modeGelap,
    required this.onUbahTema,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuliner Medan'),
        actions: [
          IconButton(
            tooltip: 'Ubah tema',
            onPressed: onUbahTema,
            icon: Icon(modeGelap ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderUMKM(),
              const SizedBox(height: 24),

              Text(
                'Informasi Usaha',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              const InfoKontak(),

              const SizedBox(height: 24),

              Text('Menu Kami', style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 12),

              const DaftarMenu(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderUMKM extends StatelessWidget {
  const HeaderUMKM({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            'https://images.unsplash.com/photo-1547592180-85f173990554?w=1000',
            height: 190,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 190,
                width: double.infinity,
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: const Icon(Icons.restaurant, size: 60),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Dapur Melayu Medan',
          style: Theme.of(context).textTheme.headlineSmall
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          'Nikmati kelezatan kuliner khas Medan dengan cita rasa '
          'tradisional yang hangat, lezat, dan menggugah selera.',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}

class InfoKontak extends StatelessWidget {
  const InfoKontak({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: const Column(
        children: [
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('Alamat'),
            subtitle: Text('Jl. Iskandar Muda, Medan'),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Telepon'),
            subtitle: Text('0812-3456-7890'),
          ),
          Divider(height: 1),
          ListTile(
            leading: Icon(Icons.access_time),
            title: Text('Jam Operasional'),
            subtitle: Text('Senin - Minggu, 09.00 - 21.00 WIB'),
          ),
        ],
      ),
    );
  }
}

class DaftarMenu extends StatelessWidget {
  const DaftarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final daftar = [
      {
        'nama': 'Soto Medan',
        'harga': 'Rp25.000',
        'kategori': 'Makanan',
        'ikon': Icons.soup_kitchen,
      },
      {
        'nama': 'Nasi Gurih',
        'harga': 'Rp18.000',
        'kategori': 'Makanan',
        'ikon': Icons.rice_bowl,
      },
      {
        'nama': 'Bihun Bebek',
        'harga': 'Rp30.000',
        'kategori': 'Makanan',
        'ikon': Icons.ramen_dining,
      },
      {
        'nama': 'Es Markisa',
        'harga': 'Rp10.000',
        'kategori': 'Minuman',
        'ikon': Icons.local_drink,
      },
    ];

    return Column(
      children: daftar.map((menu) {
        return KartuMenu(
          nama: menu['nama'] as String,
          harga: menu['harga'] as String,
          kategori: menu['kategori'] as String,
          ikon: menu['ikon'] as IconData,
        );
      }).toList(),
    );
  }
}

class KartuMenu extends StatelessWidget {
  final String nama;
  final String harga;
  final String kategori;
  final IconData ikon;

  const KartuMenu({
    super.key,
    required this.nama,
    required this.harga,
    required this.kategori,
    required this.ikon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(child: Icon(ikon)),
        title: Text(nama, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(harga),
              const SizedBox(height: 6),
              Chip(label: Text(kategori), visualDensity: VisualDensity.compact),
            ],
          ),
        ),
        trailing: TombolFavorit(namaMenu: nama),
      ),
    );
  }
}

class TombolFavorit extends StatefulWidget {
  final String namaMenu;

  const TombolFavorit({super.key, required this.namaMenu});

  @override
  State<TombolFavorit> createState() => _TombolFavoritState();
}

class _TombolFavoritState extends State<TombolFavorit> {
  bool favorit = false;

  void ubahFavorit() {
    setState(() {
      favorit = !favorit;
    });

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            favorit
                ? '${widget.namaMenu} ditambahkan ke favorit!'
                : '${widget.namaMenu} dihapus dari favorit.',
          ),
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: const Key('tombol_favorit'),
      tooltip: favorit ? 'Hapus favorit' : 'Tambah favorit',
      onPressed: ubahFavorit,
      icon: Icon(
        favorit ? Icons.favorite : Icons.favorite_border,
        color: favorit
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}
