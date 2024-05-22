import 'package:flutter/material.dart';
import 'package:sos_flood/presentation/pages/location_sos_page.dart';

import '../widgets/button_sos_widget.dart';
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
              const SizedBox(height: 230),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Text(
                  'Ou compartilhe a sua localização',
                  style: TextStyle(color: Colors.grey[700], fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LocationSOSPage()));
                },
                child: const Icon(
                  Icons.location_on,
                  size: 200,
                  color: Color.fromARGB(255, 137, 41, 34),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
