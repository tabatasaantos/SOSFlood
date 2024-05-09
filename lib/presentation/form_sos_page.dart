import 'package:flutter/material.dart';

import '../widgets/button_sos_widget.dart';
import '../widgets/textfield_password_sos_widget.dart';
import '../widgets/textfield_phone_sos_widget.dart';

class FormSOSPage extends StatefulWidget {
  const FormSOSPage({super.key});

  @override
  State<FormSOSPage> createState() => _FormSOSPageState();
}

class _FormSOSPageState extends State<FormSOSPage> {
  var localizationController = TextEditingController();
  var addressController = TextEditingController();
  var complementController = TextEditingController();

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
              const SizedBox(height: 50),
              const Text(
                'Pedir ajuda',
                style: TextStyle(
                  color: Color.fromARGB(255, 137, 41, 34),
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 100),
              TextFieldPhoneSOSWidget(
                controller: addressController,
                hintText: 'Rua com número da casa/apto',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              TextFieldPhoneSOSWidget(
                controller: localizationController,
                hintText: 'Bairro',
                obscureText: false,
              ),
               const SizedBox(height: 10),
              TextFieldPhoneSOSWidget(
                controller: complementController,
                hintText: 'Complemento',
                obscureText: false,
              ),
            
              
              const SizedBox(height: 240),
              ButtonSOSWidget(
                text: 'Pedir ajuda',
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
