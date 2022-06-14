import 'package:flutter/material.dart';

class StatefulPage extends StatefulWidget {
  const StatefulPage({Key? key}) : super(key: key);

  @override
  State<StatefulPage> createState() => _StatefulPageState();
}

class _StatefulPageState extends State<StatefulPage> { //class statefull digunakan untuk halaman statefull yang berisikan gambar dan edit text yang bisa disubmit
  final nama = TextEditingController(); //variabel edittext

  String textNama = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful Widget'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                  width: 200,
                  height: 200,
                  //widget image untuk menampilkan gambar
                  child: Image(image: NetworkImage('https://upload.wikimedia.org/wikipedia/id/5/5c/Spongebob-squarepants.png'))),
              SizedBox(height: 30,),
              Text('FORM', style: TextStyle(fontSize: 20),),
              SizedBox(height: 5,),
              Container(
                width: 300,
                child: TextField(
                  controller: nama,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Masukkan Nama',
                  ),
                ),
              ),
              ElevatedButton( //tombol untuk eksekusi form
                onPressed: () {
                  setState(() {
                    textNama = nama.text;
                  });
                },
                child: const Text('Submit Form'),
              ),
              SizedBox(height: 10,),
              Text("Nama Anda : " + textNama),
              SizedBox(height: 5,),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Kembali'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}