import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //giriş yap fonksiyonu
  Future<User?> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return user.user;
  }

  //çıkış yap fonksiyonu
  signOut() async {
    return await _auth.signOut();
  }

  //kayıt ol fonksiyonu
  Future<User?> createPerson(String email, String password, String userName) async {
    var user = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    await _firestore
        .collection("users")
        .doc(user.user!.uid)
        .set({
          'email': email,
          'userName': userName,
          'uid': FirebaseAuth.instance.currentUser!.uid,
          'companyName': 'Lügat',
          'userTitle': 'Üye',
          'lastLogInDate': FieldValue.serverTimestamp(),
          'authorPhotoUrl': 'https://media-exp1.licdn.com/dms/image/C560BAQFtcz8hmAOKXA/company-logo_200_200/0/1643079735077?e=1651104000&v=beta&t=bTw9K84Piu2KdcvVlbiwQZQ7PkZFOuuZeKhWl69ADfM',
    });

    return user.user;
  }
}