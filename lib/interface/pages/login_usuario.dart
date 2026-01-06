// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'login_coletor.dart';

// pagina de login do usuario coletor

// pagina de login do usuario comum
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // estrutura da pagina de login do usuario comum
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 80.0),
              ClipOval(
                child: Image.asset(
                  'assets/imagens/logo.png',
                  height: 250,
                  width: 250, // Controla a altura da imagem
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 48.0),
              const Text('Email', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8.0),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Digite o seu Email',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ), // Ajuste o padding interno
                ),
              ),

              const SizedBox(height: 24.0),

              const Text('Senha', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8.0),
              const TextField(
                obscureText: true, // Para esconder a senha
                decoration: InputDecoration(
                  hintText: 'Digite a sua senha',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                ),
              ),

              const SizedBox(height: 8.0),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Lógica para recuperar a senha
                  },
                  child: const Text(
                    'Esqueceu a senha ?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),

              const SizedBox(height: 16.0),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Lógica de login
                  },
                  style: ElevatedButton.styleFrom(
                    // Cor de fundo do botão (azul na imagem)
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30.0),

              const Row(
                children: <Widget>[
                  Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('ou', style: TextStyle(color: Colors.grey)),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ],
              ),

              const SizedBox(height: 30.0),

              SizedBox(
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => const LoginPageColetor(),
                      ),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    // Cor da borda
                    side: const BorderSide(color: Colors.black, width: 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: const Text(
                    'Usuário Coletor',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ),

              const SizedBox(height: 40.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Ainda não tem conta?'),
                  TextButton(
                    onPressed: () {
                      // Lógica para navegar para a tela de registro
                    },
                    child: const Text(
                      'Criar conta',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
