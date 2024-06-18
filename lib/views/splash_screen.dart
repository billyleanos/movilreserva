import 'dart:async';
import 'package:app_reservas/views/login_page.dart';
import 'package:flutter/material.dart';
import 'package:app_reservas/views/splash_screen.dart'; // Ajusta la importación según sea necesario

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome(); // Método para navegar a la pantalla principal después de un cierto tiempo
  }

  void _navigateToHome() {
    // Simula una carga o espera de 2 segundos antes de navegar a la pantalla principal
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LoginPage()), // Reemplaza con tu pantalla principal
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 100), // Puedes usar tu propio logo o imagen
            SizedBox(height: 20),
            Text(
              'Mi App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            CircularProgressIndicator(), // Indicador de carga
          ],
        ),
      ),
    );
  }
}
