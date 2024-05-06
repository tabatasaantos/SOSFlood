import 'package:flutter/material.dart';
import 'package:sos_flood/presentation/login_sos_page.dart';


void main() {
  runApp(const SOSFlood());
}

class SOSFlood extends StatelessWidget {
  const SOSFlood({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginSOSPage(),
    );
  }
}