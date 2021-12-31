import 'package:flutter/material.dart';
import 'package:mobile/screens/jadwal-belajar-bareng/models/jadwal_model.dart';
import 'package:provider/provider.dart';
import 'package:mobile/screens/jadwal-belajar-bareng/providers/jadwal_provider.dart';
import 'package:mobile/screens/jadwal-belajar-bareng/screens/jadwal_home.dart';
import 'page_tambah.dart';

class FormAdd extends StatefulWidget {
  const FormAdd({ Key? key }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return FormAddState();
  }
}

class FormAddState extends State<FormAdd> {
  final _prioritas = TextEditingController();
  final _matkul = TextEditingController();
  final _waktu = TextEditingController();
  final _topik = TextEditingController();
  final _info = TextEditingController();
  final _situs = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void onAdd() {
    final String tambahPrioritas = _prioritas.text;
    final String tambahMatkul = _matkul.text;
    final String tambahWaktu = _waktu.text;
    final String tambahTopik = _topik.text;
    final String tambahInfo = _info.text;
    final String tambahSitus = _situs.text;

    if(tambahPrioritas.isNotEmpty && tambahMatkul.isNotEmpty && tambahWaktu.isNotEmpty && tambahTopik.isNotEmpty && tambahInfo.isNotEmpty && tambahSitus.isNotEmpty){
      final JadwalBelajarModel _jadwal = JadwalBelajarModel(prioritas: tambahPrioritas, matkul: tambahMatkul, waktu: tambahWaktu, topik: tambahTopik, info: tambahInfo, link: tambahSitus);
      Provider.of<JadwalBelajarProvider>(context, listen: false).tambahJadwal(_jadwal);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TambahPage()),
      );
    }
  }

  Widget _buildPrioritas() {
    return TextFormField(
      controller: _prioritas,
      decoration: InputDecoration(
        hintText: "Tentukan prioritas Jadwal Belajar Bareng.",
        labelText: "Prioritas",
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Prioritas tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _buildMatkul() {
    return TextFormField(
      controller: _matkul,
      decoration: InputDecoration(
        hintText: "Tentukan mata kuliah Jadwal Belajar Bareng.",
        labelText: "Mata Kuliah",
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Mata kuliah tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _buildWaktu() {
    return TextFormField(
      controller: _waktu,
      decoration: InputDecoration(
        hintText: "Tentukan waktu pelaksanaan Jadwal Belajar Bareng.",
        labelText: "Waktu",
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Waktu tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _buildTopik() {
    return TextFormField(
      controller: _topik,
      decoration: InputDecoration(
        hintText: "Masukkan topik pembelajaran.",
        labelText: "Topik",
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Topik tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _buildInfo() {
    return TextFormField(
      controller: _info,
      decoration: InputDecoration(
        hintText: "Masukkan informasi tambahan.",
        labelText: "Informasi",
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Informasi tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _buildSitus() {
    return TextFormField(
      controller: _situs,
      decoration: InputDecoration(
        hintText: "Masukkan situs pertemuan daring.",
        labelText: "Situs",
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      keyboardType: TextInputType.text,
      validator: (value) {
        String pattern = r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
        RegExp regExp = RegExp(pattern);
        if (value!.isEmpty) {
          return 'Situs tidak boleh kosong';
        } else if (!regExp.hasMatch(value)) {
          return 'Mohon hanya isi dengan URL yang valid';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            _buildPrioritas(),
            const SizedBox(height: 30),
            _buildMatkul(),
            const SizedBox(height: 30),
            _buildWaktu(),
            const SizedBox(height: 30),
            _buildTopik(),
            const SizedBox(height: 30),
            _buildInfo(),
            const SizedBox(height: 30),
            _buildSitus(),
            const SizedBox(height: 30),
            
            ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  child: const Text("Batal"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                      primary: Colors.red,
                      side: const BorderSide(
                        color: Colors.red, width: 1),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                      padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 16)
                  ),  
              ),
              MaterialButton(
                color: const Color.fromARGB(255, 11, 94, 215),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Text(
                  'Buat Jadwal',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                onPressed: (){
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Jadwal berhasil ditambahkan.')),
                    );
                    onAdd();
                  }
                }
              ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
