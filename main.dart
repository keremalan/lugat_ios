import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lugat_ios/pages/explore.dart';
import 'package:lugat_ios/pages/home.dart';
import 'package:lugat_ios/pages/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lugat_ios/utilities/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(const Lugat());
}

class Lugat extends StatelessWidget {
  const Lugat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFirebaseInitialized = false;
  @override
  void initState() {
    super.initState();
    initializeFirebase();
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
    setState(() {
      isFirebaseInitialized = true;
    });
    if (FirebaseAuth.instance.currentUser != null) {
      goHome();
    }
    // goHome();
  }

  void goHome() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const Index()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Image.network('https://www.upload.ee/image/13759867/Large_Title.png'),
            ),
            Center(child: isFirebaseInitialized
                ? TextButton(onPressed: () async {
              await signInWithGoogle();
              var uid = FirebaseAuth.instance.currentUser!.uid;
              await FirebaseFirestore.instance.collection('users').doc(uid).set(
                {
                  'isLogged': true,
                  'lastLogInDate': FieldValue.serverTimestamp(),
                },
                SetOptions(merge: true),
              );
              goHome();
            }, child: Container(
              width: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png',
                      height: 16,
                      width: 16,),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Google ile giriş yap',
                        style: TextStyle(
                            color: Colors.black
                        )),
                  ),
                ],
              ),
            ))
                : const CircularProgressIndicator())
          ],
        ));
  }
}



class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Home(

    ),
    Explore(

    ),
    Profile(

    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const<BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Ana sayfa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Keşfet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black.withOpacity(0.3),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
