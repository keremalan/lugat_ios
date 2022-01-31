import 'package:flutter/material.dart';
import 'package:lugat_ios/main.dart';
import 'package:lugat_ios/pages/home.dart';
import 'package:lugat_ios/pages/register.dart';
import 'package:lugat_ios/utilities/auth_helper.dart';

class Sign extends StatefulWidget {
  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late AuthService _authService;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _authService = AuthService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 120),
              const Text(
                "Giriş Yap",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.w700),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 36),

                    //Eposta
                    const Text("E-Posta",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    _buildEmail(),
                    const SizedBox(height: 24),

                    //Password
                    const Text("Şifre",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    _buildPassword(),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              //Giriş yap
              _buildSignIn(context),

              //Henüz hesabım yok
              const SizedBox(height: 40),
              _buildDontHaveAccount(context),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildDontHaveAccount(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => RegisterPage(), fullscreenDialog: true));
            },
            child: const Text("Henüz bir hesabım yok")),
        const SizedBox(height: 16),
        const Text("Yardım merkezi"),
      ],
    );
  }

  Container _buildSignIn(BuildContext context) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: SizedBox(
        height: 40,
        child: TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _authService
                  .signIn(_emailController.text, _passwordController.text)
                  .then((value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Index(),
                ),
              ));
            }
          },
          child: const Text(
            "Giriş yap",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  SizedBox _buildPassword() {
    return SizedBox(
      height: 40,
      child: TextFormField(
        controller: _passwordController,
        obscureText: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Lütfen şifrenizi giriniz';
          }
          return null;
        },
        decoration: const InputDecoration(hintText: 'Şifrenizi girin'),
      ),
    );
  }

  TextFormField _buildEmail() {
    return TextFormField(
      controller: _emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Lütfen e-mail adresinizi giriniz';
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return 'Lütfen geçerli bir e-mail adresi giriniz.';
        }
        return null;
      },
      decoration: const InputDecoration(hintText: 'E-Posta adresinizi girin'),
    );
  }
}