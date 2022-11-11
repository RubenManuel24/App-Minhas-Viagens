import 'dart:async';

import 'package:flutter/material.dart';
import 'package:minhas_viagens/home.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  //Este metodo ele inicia mesmo antes do InitState ele é que vai nos permitir a abrir a tela inicial do App
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    Timer(Duration(seconds: 5), (){
      Navigator.pushReplacement(context, 
        MaterialPageRoute(builder: (_) => Home())  
      );
    }
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xff0066cc),
        padding: EdgeInsets.all(60),
        child: Center(
          child: Image.asset("imgens/logo.png"),
        )
      ),
    );
  }
}