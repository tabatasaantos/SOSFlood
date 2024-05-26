import 'package:flutter/material.dart';
import 'package:sos_flood/presentation/pages/login_sos_page.dart';
import 'package:sos_flood/presentation/widgets/button_sos_widget.dart';
import 'package:sos_flood/presentation/widgets/textfield_password_sos_widget.dart';

class ForgetPasswordSosPage extends StatefulWidget {
  const ForgetPasswordSosPage({super.key});

  @override
  State<ForgetPasswordSosPage> createState() => _ForgetPasswordSosPageState();
}

class _ForgetPasswordSosPageState extends State<ForgetPasswordSosPage> {
  final passwordController = TextEditingController();

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
              const SizedBox(height: 250),
              TextFieldPasswordSOSWidget(
                controller: passwordController,
                hintText: 'Cadastrar nova senha',
                obscureText: true,
              ),
              const SizedBox(height: 300),
              ButtonSOSWidget(
                text: 'Cadastrar nova senha',
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginSOSPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
