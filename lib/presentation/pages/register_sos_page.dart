import 'package:flutter/material.dart';
import 'package:sos_flood/presentation/pages/form_sos_page.dart';
import 'package:sos_flood/presentation/pages/login_sos_page.dart';

import '../widgets/button_sos_widget.dart';
import '../widgets/textfield_password_sos_widget.dart';
import '../widgets/textfield_phone_sos_widget.dart';

class RegisterSOSPage extends StatefulWidget {
  const RegisterSOSPage({super.key});

  @override
  State<RegisterSOSPage> createState() => _RegisterSOSPageState();
}

class _RegisterSOSPageState extends State<RegisterSOSPage> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Colors.grey[300],
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Cadastre-se!',
                style: TextStyle(
                  color: Color.fromARGB(255, 137, 41, 34),
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 100),
              TextFieldPhoneSOSWidget(
                controller: phoneController,
                hintText: 'Nome completo',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              TextFieldPhoneSOSWidget(
                controller: phoneController,
                hintText: 'CPF',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              TextFieldPhoneSOSWidget(
                controller: phoneController,
                hintText: 'Telefone',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              TextFieldPasswordSOSWidget(
                controller: passwordController,
                hintText: 'Senha',
                obscureText: true,
              ),
              const SizedBox(height: 240),
              ButtonSOSWidget(
                text: 'Cadastrar',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  LoginSOSPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
