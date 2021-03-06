import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lugat_ios/pages/explore.dart';
import 'package:lugat_ios/pages/home.dart';
import 'package:lugat_ios/pages/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lugat_ios/pages/register.dart';
import 'package:lugat_ios/pages/sign.dart';
import 'package:lugat_ios/utilities/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';



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
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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
            Column(
              children: [
                GestureDetector(onTap:(){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => Sign(), fullscreenDialog: true));
                }, child: Container(
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Giri?? yap", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                  ),
                )),
                SizedBox(height: 16),
                GestureDetector(onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => RegisterPage(), fullscreenDialog: true));
                },child: Container(
                  width: 220,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Kay??t ol", textAlign: TextAlign.center,),
                  ),
                )),
              ],
            ),
            SizedBox(height: 8),
            Container(width: 220, child: Divider(color: Colors.grey.withOpacity(0.8),)),
            Center(child: isFirebaseInitialized
                ? TextButton(onPressed: () async {
              await signInWithGoogle();
              var uid = FirebaseAuth.instance.currentUser!.uid;
              var email = FirebaseAuth.instance.currentUser!.email;
              var companyName = 'L??gat';
              var userTitle = '??ye';
              var userName = FirebaseAuth.instance.currentUser!.displayName!;
              await FirebaseFirestore.instance.collection('users').doc(uid).set(
                {
                  'authorPhotoUrl': 'https://media-exp1.licdn.com/dms/image/C560BAQFtcz8hmAOKXA/company-logo_200_200/0/1643079735077?e=1651104000&v=beta&t=bTw9K84Piu2KdcvVlbiwQZQ7PkZFOuuZeKhWl69ADfM',
                  'uid': uid,
                  'userName': userName,
                  'companyName': companyName,
                  'userTitle': userTitle,
                  'email': email,
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
                    child: Text('Google ile giri?? yap',
                        style: TextStyle(
                            color: Colors.black
                        )),
                  ),
                ],
              ),
            ))
                : const CircularProgressIndicator()),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: TextButton(
                onPressed: () async {
                  final appleIdCredential = await SignInWithApple.getAppleIDCredential(
                    scopes: [
                      AppleIDAuthorizationScopes.email,
                      AppleIDAuthorizationScopes.fullName,
                    ],
                  );
                  final oAuthProvider = OAuthProvider("apple.com");
                  final credential = oAuthProvider.credential(
                    idToken: appleIdCredential.identityToken,
                    accessToken: appleIdCredential.authorizationCode,
                  );
                  await  auth.signInWithCredential(credential);
                  goHome();
                },
                child: Container(
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
                        child: Image.network('https://cdn.icon-icons.com/icons2/512/PNG/512/os-apple_icon-icons.com_50846.png',
                          height: 16,
                          width: 16,),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Apple ile giri?? yap',
                            style: TextStyle(
                                color: Colors.black
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 24),
            Container(
              child:
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => EULA(), fullscreenDialog: true));
                    },
                    child: Text("Kullan??c?? Anla??mas?? - EULA"),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class EULA extends StatelessWidget {
  const EULA({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const Text(
                  "Son Kullan??c?? Lisans Anla??mas??(EULA)",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 24),
                Text("Dikkatle okuman??z, toplulu??un i??leyi??i i??in ??nem arz etmektedir. Onaylad??????n??z?? ifade eden butona basmadan uygulamaya devam edemezsiniz."),
                SizedBox(height: 8),
                Text("Bu Son Kullan??c?? Lisans Anla??mas??('EULA') siz (birey veya ??irket) ('????erik ??reticileri') ile Geight('Kerem Alan') aras??nda, bu Son Kullan??c?? Lisans Anla??mas??na e??lik eden Geight ve onun i??tirak??ileri ve ??????nc?? ??ah??slar ile i??erik sahiplerine ait olan, g??rsellere, metinlere y??nelik yasal bir anla??mad??r."),
                SizedBox(height: 8),
                Text("Bu EULA'n??n ama??lar?? do??rultusunda 'Yaz??l??m' belirli ??al????malar ger??ekle??tirmek ii??in bir i??lemcinin kulland?????? makine taraf??ndan okunabilir talimatlar anlam??na gelir. 'Tasar??m' uygulama aray??z??ndeki ??zelle??tirilmi?? detaylar?? kapsar. '????erik' ise kullan??c??lar??n olu??turdu??u terimler, ba??l??klar?? ve a????klamalar??n?? i??ermektedir. Geight taraf??ndan izin verilmedik??e herhangi bir i??eri??in ba??ka platformlara aktar??lmas?? kesinlikle yasakt??r."),
                SizedBox(height: 8),
                Text("1. HAKLAR VE M??LK??YET??N KORUNMASI, Geight taraf??ndan sunulan bu yaz??l??m?? kullanmaya ba??larken, son kullan??c?? lisans anla??mas??n?? kabul etmi?? say??l??rs??n??z. Anla??maya ayk??r?? durumlarda Geight, yasal yapt??r??mlara ba??vurma hakk??n?? sakl?? tutmaktad??r. '????erik Olu??turucu', L??gat i??erisinde olu??turulan her bir terimin olu??turucusu, kendisine ait ??zel bir kod ile korunmaktad??r. Terimin i??eri??iyle ilgili d??zenleme, kald??rma ve yay??nlama haklar??n??n tamam?? Geight'e devredilmi??tir. Geight, bu haklar?? i??erik ??reticisinin de yarar??na ve r??zas??na olacak bi??imde kullanaca????n?? tahatt??t eder."),
                SizedBox(height: 8),
                Text("2. SORUMLULUK REDD??, ????erik ??reticileri taraf??ndan olu??turulan i??eriklerdeki ihlallerle ilgili olu??an problemlerin ????z??lmesinde, kullan??c??dan yana olaca????n?? tahatt??t eder ve topluluk ilkelerine ayk??r?? olmayan her durumda kullan??c??y?? yasal haklar?? ??er??evesinde korur. Bilgilerini, yasalar ??er??evesinde belirtilen zorunlu haller d??????nda, kamu kurumlar?? dahil ??????nc?? ki??ilerle payla??maz. Bununla birlikte, i??erik hakk??ndaki sorumluluk tamamen olu??turucuya ve d??zenleyenlere aittir. Geight, bu konumda yaln??zca bir moderat??r rol??ndedir."),
                SizedBox(height: 8),
                Text("3. KULLANICI SORUMLULUKLARI, ????erik ??reticilerinin olu??turdu??u terimlerde herhangi bir ????plakl??k ????esi, hakaret, tahrik, halk?? k????k??rtmaya y??nelik ifade, hakaret vb. ????eler olmas?? durumunda, i??erik engellenir ve kullan??c?? Geight ??irketi b??nyesinde bulunan ve son kullan??c??lara hitap eden t??m hizmetlerden tekrar dahil edilmemek ??zere uzakla??t??r??l??r."),
                SizedBox(height: 8),
                Text("4. ??HT??YAD?? TEDB??R, ????erik ??reticileri, olu??turduklar?? terimlerin kullan??m haklar??n?? Geight ??irketine devreder. HAKLAR VE M??LK??YET??N KORUNMASI maddesinde a????k??a ifade edildi??i ??zere, bu haklar i??erik ??reticileriin de yarar??na olacak bi??imde kullan??lacakt??r."),
                SizedBox(height: 8),
                Text("5, SONLANDIRMA, Bu son kullan??c?? lisans anla??mas??, sonland??r??lana kadar y??r??rl??l??kte kalacakt??r. S??zle??menin ko??ullar??n??n herhangi birine uymad??????n??z taktirde, bu anla??ma ??zerindeki t??m haklar??n??z bildiirmde bulunmaks??z??n otomatik olarak sonland??r??l??r."),
                SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
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
              label: 'Ke??fet',
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
