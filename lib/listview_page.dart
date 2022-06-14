import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget { // class listview digunakan untuk menampilkan listview
  const ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'List View';

    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: ListView(
          children: const <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Map'),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
            ),
            ListTile(
              leading: Icon(Icons.file_open),
              title: Text('File'),
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text('School'),
            ),
          ],
        ),
      ),
    );
  }
}
