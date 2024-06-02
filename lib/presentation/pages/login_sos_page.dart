import 'package:flutter/material.dart';
import 'package:sos_flood/presentation/pages/forget_password_sos_page.dart';
import 'package:sos_flood/presentation/pages/form_sos_page.dart';
import 'package:sos_flood/presentation/pages/register_sos_page.dart';

import '../widgets/button_sos_widget.dart';
import '../widgets/textfield_password_sos_widget.dart';
import '../widgets/textfield_phone_sos_widget.dart';
import '../widgets/tile_sos_widget.dart';

class LoginSOSPage extends StatelessWidget {
  LoginSOSPage({super.key});

  final cpfController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Icon(
              Icons.sos_outlined,
              size: 100,
              color: Color.fromARGB(255, 137, 41, 34),
            ),
            const Text(
              'Enchentes',
              style: TextStyle(
                color: Color.fromARGB(255, 137, 41, 34),
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            TextFieldPhoneSOSWidget(
              controller: cpfController,
              hintText: 'CPF',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            TextFieldPasswordSOSWidget(
              controller: passwordController,
              hintText: 'Senha',
              obscureText: true,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ForgetPasswordSosPage()));
                    },
                    child: Text(
                      'Esqueceu sua senha?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            ButtonSOSWidget(
              text: 'Entrar',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FormSOSPage()));
              },
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Ou acesse com',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                TileSOSWidget(imagePath: 'lib/images/google.png'),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Não tem cadastro?',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterSOSPage())),
                  child: const Text(
                    'Cadastre-se',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
