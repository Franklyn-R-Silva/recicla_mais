import 'package:flutter/material.dart';

// importação da pagina de registro
import 'interface/pages/register.dart'; 

// importação das Paginas do App Recicla
import 'interface/pages/login_usuario.dart';

// função principal responsavel por execulta o app
void main() {
  runApp(const MyApp());
}

// Classe principal do App Recicla
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Construção do Widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false, // daqui alterei para adicionar rotas
      title: 'Recicla Mais',

      // Tela inicial do app (mantenha '/login' para testar login primeiro)
      initialRoute: '/login',

      // Mapa de rotas (adicione aqui todas as telas que precisar navegar por nome)
      routes: {
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        // '/home': (context) => const HomePage(), // exemplo
      },
    );
  }
}