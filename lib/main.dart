import 'package:flutter/material.dart';

// importação das Paginas do App Recicla
import 'pages/loginUsuario.dart';

// função principal responsavel por execulta o app
void main() {
  runApp(const MyApp());
}

// Classe principal do App Recicla
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
    );
  }
}
