import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tugas_akhir/fetch_api.dart';
import 'package:tugas_akhir/firestore_page.dart';
import 'package:tugas_akhir/listview_page.dart';
import 'login_page.dart';
import 'stateful_page.dart';
import 'utils/fire_auth.dart';

class ProfilePage extends StatefulWidget { //class profil, digunakan untuk menampilkan profil user yang login, dan untuk meletakan tombol tombol dari satiap halaman
  final User user;

  const ProfilePage({required this.user});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isSendingVerification = false;
  bool _isSigningOut = false;

  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'NAME: ${_currentUser.displayName}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 5.0),
              Text(
                'EMAIL: ${_currentUser.email}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 5.0),
              _currentUser.emailVerified
                  ? Text(
                'Email verified',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.green),
              )
                  : Text(
                'Email not verified',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.red),
              ),
              SizedBox(height: 16.0),
              _isSendingVerification
                  ? CircularProgressIndicator()
                  : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isSendingVerification = true;
                      });
                      await _currentUser.sendEmailVerification();
                      setState(() {
                        _isSendingVerification = false;
                      });
                    },
                    child: Text('Verify email'),
                  ),
                  SizedBox(width: 8.0),
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () async {
                      User? user = await FireAuth.refreshUser(_currentUser);

                      if (user != null) {
                        setState(() {
                          _currentUser = user;
                        });
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              _isSigningOut
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () async {
                  setState(() {
                    _isSigningOut = true;
                  });
                  await FirebaseAuth.instance.signOut();
                  setState(() {
                    _isSigningOut = false;
                  });
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Text('Sign out'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text("BARIS", style: TextStyle(fontSize: 20),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, //untuk mengatur row di posisi tengah
                children: [
                  Container(
                    color: Colors.orange, //untuk membuat warna menjadi kuning
                    child: FlutterLogo(
                      size: 60.0,
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    child: FlutterLogo(
                      size: 60.0,
                    ),
                  ),
                  Container(
                    color: Colors.purple,
                    child: FlutterLogo(
                      size: 60.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Text("KOLOM", style: TextStyle(fontSize: 20),),
              Column( //widget column untuk membuat kolom
                children: [
                  Container(
                    color: Colors.orange,
                    child: FlutterLogo(
                      size: 50.0,
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                    child: FlutterLogo(
                      size: 50.0,
                    ),
                  ),
                  Container(
                    color: Colors.purple,
                    child: FlutterLogo(
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white, // foreground
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const StatefulPage()), //unutk navigasi menuju ke halaman statefulpage
                  );
                },
                child: Text('Ke Stateful Widget'),
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white, // foreground
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ListViewPage()), //unutk navigasi menuju ke halaman statefulpage
                  );
                },
                child: Text('Ke ListView'),
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white, // foreground
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FetchApiPage()), //unutk navigasi menuju ke halaman statefulpage
                  );
                },
                child: Text('Ke Fetch Data API'),
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white, // foreground
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FireStorePage()), //unutk navigasi menuju ke halaman statefulpage
                  );
                },
                child: Text('Ke FireStore'),
              )
            ],
          ),
        ),
      ),
    );
  }
}