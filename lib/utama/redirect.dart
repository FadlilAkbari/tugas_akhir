import 'package:flutter/material.dart';
import 'package:projek/utama/welcome.dart';
import 'login.dart';

class Redirect extends StatefulWidget {
  const Redirect({Key? key}) : super(key: key);

  @override
  State<Redirect> createState() => _RedirectState();
}

class _RedirectState extends State<Redirect> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: const WelcomePage(),
    );
  }

}
