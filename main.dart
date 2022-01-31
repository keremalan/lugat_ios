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
                    child: Text("Giriş yap", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
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
                    child: Text("Kayıt ol", textAlign: TextAlign.center,),
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
              var companyName = 'Lügat';
              var userTitle = 'Üye';
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
                    child: Text('Google ile giriş yap',
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
                        child: Text('Apple ile giriş yap',
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
                    child: Text("Kullanıcı Anlaşması - EULA"),
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
                  "Son Kullanıcı Lisans Anlaşması(EULA)",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 24),
                Text("Dikkatle okumanız, topluluğun işleyişi için önem arz etmektedir. Onayladığınızı ifade eden butona basmadan uygulamaya devam edemezsiniz."),
                SizedBox(height: 8),
                Text("Bu Son Kullanıcı Lisans Anlaşması('EULA') siz (birey veya şirket) ('İçerik üreticileri') ile Geight('Kerem Alan') arasında, bu Son Kullanıcı Lisans Anlaşmasına eşlik eden Geight ve onun iştirakçileri ve üçüncü şahıslar ile içerik sahiplerine ait olan, görsellere, metinlere yönelik yasal bir anlaşmadır."),
                SizedBox(height: 8),
                Text("Bu EULA'nın amaçları doğrultusunda 'Yazılım' belirli çalışmalar gerçekleştirmek iiçin bir işlemcinin kullandığı makine tarafından okunabilir talimatlar anlamına gelir. 'Tasarım' uygulama arayüzündeki özelleştirilmiş detayları kapsar. 'İçerik' ise kullanıcıların oluşturduğu terimler, başlıkları ve açıklamalarını içermektedir. Geight tarafından izin verilmedikçe herhangi bir içeriğin başka platformlara aktarılması kesinlikle yasaktır."),
                SizedBox(height: 8),
                Text("1. HAKLAR VE MÜLKİYETİN KORUNMASI, Geight tarafından sunulan bu yazılımı kullanmaya başlarken, son kullanıcı lisans anlaşmasını kabul etmiş sayılırsınız. Anlaşmaya aykırı durumlarda Geight, yasal yaptırımlara başvurma hakkını saklı tutmaktadır. 'İçerik Oluşturucu', Lügat içerisinde oluşturulan her bir terimin oluşturucusu, kendisine ait özel bir kod ile korunmaktadır. Terimin içeriğiyle ilgili düzenleme, kaldırma ve yayınlama haklarının tamamı Geight'e devredilmiştir. Geight, bu hakları içerik üreticisinin de yararına ve rızasına olacak biçimde kullanacağını tahattüt eder."),
                SizedBox(height: 8),
                Text("2. SORUMLULUK REDDİ, İçerik üreticileri tarafından oluşturulan içeriklerdeki ihlallerle ilgili oluşan problemlerin çözülmesinde, kullanıcıdan yana olacağını tahattüt eder ve topluluk ilkelerine aykırı olmayan her durumda kullanıcıyı yasal hakları çerçevesinde korur. Bilgilerini, yasalar çerçevesinde belirtilen zorunlu haller dışında, kamu kurumları dahil üçüncü kişilerle paylaşmaz. Bununla birlikte, içerik hakkındaki sorumluluk tamamen oluşturucuya ve düzenleyenlere aittir. Geight, bu konumda yalnızca bir moderatör rolündedir."),
                SizedBox(height: 8),
                Text("3. KULLANICI SORUMLULUKLARI, İçerik üreticilerinin oluşturduğu terimlerde herhangi bir çıplaklık öğesi, hakaret, tahrik, halkı kışkırtmaya yönelik ifade, hakaret vb. öğeler olması durumunda, içerik engellenir ve kullanıcı Geight şirketi bünyesinde bulunan ve son kullanıcılara hitap eden tüm hizmetlerden tekrar dahil edilmemek üzere uzaklaştırılır."),
                SizedBox(height: 8),
                Text("4. İHTİYADİ TEDBİR, İçerik üreticileri, oluşturdukları terimlerin kullanım haklarını Geight şirketine devreder. HAKLAR VE MÜLKİYETİN KORUNMASI maddesinde açıkça ifade edildiği üzere, bu haklar içerik üreticileriin de yararına olacak biçimde kullanılacaktır."),
                SizedBox(height: 8),
                Text("5, SONLANDIRMA, Bu son kullanıcı lisans anlaşması, sonlandırılana kadar yürürlülükte kalacaktır. Sözleşmenin koşullarının herhangi birine uymadığınız taktirde, bu anlaşma üzerindeki tüm haklarınız bildiirmde bulunmaksızın otomatik olarak sonlandırılır."),
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
