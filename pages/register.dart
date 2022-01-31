import 'package:flutter/material.dart';
import 'package:lugat_ios/main.dart';
import 'package:lugat_ios/pages/home.dart';
import 'package:lugat_ios/pages/sign.dart';
import 'package:lugat_ios/utilities/auth_helper.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _userNameController;

  late AuthService _authService;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _userNameController = TextEditingController();

    _authService = AuthService();
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
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
                "Hesap Oluştur",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.w700),
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 36),

                    //userName
                    const Text("İsim",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    _buildUserName(),
                    const SizedBox(height: 24),

                    //Email
                    const Text("E-Posta",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    _buildEmail(),
                    const SizedBox(height: 24),

                    //Password
                    const Text("Şifre",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: 40,
                      child: _buildPassword(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              //Hesap oluştur butonu
              _buildSignIn(context),

              //Hesabım var
              const SizedBox(height: 40),
              _buildHaveAccount(context),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildHaveAccount(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => Sign(), fullscreenDialog: true));
            },
            child: const Text("Zaten bir hesabım var")),
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
                  .createPerson(_emailController.text, _passwordController.text,
                  _userNameController.text)
                  .then((value) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => Index(), fullscreenDialog: true));
              });
            }
          },
          child: const Text(
            "Hesap oluştur",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  TextFormField _buildPassword() {
    return TextFormField(
      obscureText: true,
      controller: _passwordController,
      decoration: const InputDecoration(
        hintText: 'Şifrenizi girin',
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Lütfen şifrenizi giriniz';
        }
        return null;
      },
    );
  }

  SizedBox _buildEmail() {
    return SizedBox(
      height: 40,
      child: TextFormField(
        controller: _emailController,
        decoration: const InputDecoration(
          hintText: 'E-Posta adresinizi girin',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please a Enter';
          }
          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
              .hasMatch(value)) {
            return 'Lütfen geçerli bir e-mail adresi giriniz.';
          }
          return null;
        },
      ),
    );
  }

  SizedBox _buildUserName() {
    return SizedBox(
      height: 40,
      child: TextFormField(
        controller: _userNameController,
        decoration: const InputDecoration(
          hintText: 'İsminizi girin ',
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Lütfen isminizi giriniz';
          }
          return null;
        },
      ),
    );
  }
}