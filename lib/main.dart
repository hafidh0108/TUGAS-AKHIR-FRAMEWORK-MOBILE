import 'package:flutter/material.dart';

import 'login_page.dart';

void main() {
  runApp(MyApp()); //class yang pertama kali dijalankan
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Authentication',
      debugShowCheckedModeBanner: false, //untuk menghilangkan banner
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        elevatedButtonTheme: ElevatedButtonThemeData( //membuat elevated button
          style: ElevatedButton.styleFrom( //membuat styleform
            textStyle: TextStyle( //mengatur style pada text
              fontSize: 24.0, //mengatur ukuran text
            ),
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 46.0,
            color: Colors.blue.shade700,
            fontWeight: FontWeight.w500,
          ),
          bodyText1: TextStyle(fontSize: 18.0),
        ),
      ),
      home: LoginPage(),
    );
  }
}