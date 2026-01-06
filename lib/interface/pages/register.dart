// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../components/inputs/custom_input.dart';
import '../components/inputs/photo_uploader.dart';
import '../components/inputs/section_label.dart';

// IMPORTS DOS COMPONENTES (se estiverem em outro lugar, me avise)

enum RegistrationType { usuario, coletor }

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: const Text(
          'Criar conta',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        bottom: TabBar(
          controller: controller,
          labelColor: Colors.green,
          unselectedLabelColor: Colors.black54,
          indicatorColor: Colors.green,
          tabs: const [
            Tab(text: 'Usuário'),
            Tab(text: 'Coletor'),
          ],
        ),
      ),

      body: TabBarView(
        controller: controller,
        children: const [
          RegistrationForm(type: RegistrationType.usuario),
          RegistrationForm(type: RegistrationType.coletor),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// FORMULÁRIO DO FIGMA — USUÁRIO COMUM E COLETOR
// ---------------------------------------------------------------------------

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({required this.type, super.key});

  final RegistrationType type;

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController nome = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController telefone = TextEditingController();
  final TextEditingController nascimento = TextEditingController();
  final TextEditingController genero = TextEditingController();
  final TextEditingController cidadeEstado = TextEditingController();
  final TextEditingController endereco = TextEditingController();
  final TextEditingController senha = TextEditingController();
  final TextEditingController confirmarSenha = TextEditingController();

  bool agreeTerms = false;
  String? fotoBase64;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Preencha seus dados para concluir o cadastro.',
              style: TextStyle(fontSize: 14),
            ),
          ),

          const SizedBox(height: 24),

          const SectionLabel('Nome completo'),
          CustomInput(controller: nome, hint: 'Seu Nome Completo'),
          const SizedBox(height: 20),

          const SectionLabel('Email'),
          CustomInput(
            controller: email,
            hint: 'Digite o seu Email',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 20),

          const SectionLabel('Telefone'),
          CustomInput(
            controller: telefone,
            hint: 'Digite o seu Número',
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 20),

          const SectionLabel('Data de nascimento'),
          CustomInput(
            controller: nascimento,
            hint: 'dd/mm/aaaa',
            keyboardType: TextInputType.datetime,
          ),
          const SizedBox(height: 20),

          const SectionLabel('Gênero'),
          CustomInput(
            controller: genero,
            hint: 'Selecione',
            readOnly: true,
            onTap: _abrirGenero,
          ),
          const SizedBox(height: 20),

          const SectionLabel('Cidade - Estado'),
          CustomInput(controller: cidadeEstado, hint: 'Cidade - UF'),
          const SizedBox(height: 20),

          const SectionLabel('Endereço, Nº'),
          CustomInput(controller: endereco, hint: 'Rua, Número, Complemento'),
          const SizedBox(height: 20),

          const SectionLabel('Senha'),
          CustomInput(controller: senha, obscure: true, hint: 'Crie uma senha'),
          const SizedBox(height: 20),

          const SectionLabel('Confirmar senha'),
          CustomInput(
            controller: confirmarSenha,
            obscure: true,
            hint: 'Digite a senha novamente',
          ),

          const SizedBox(height: 28),

          // Foto
          PhotoUploader(
            requiredField: true,
            onImageSelected: (img) => setState(() => fotoBase64 = img),
          ),

          const SizedBox(height: 20),

          // Termos
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: agreeTerms,
                onChanged: (v) => setState(() => agreeTerms = v!),
                activeColor: Colors.green,
              ),
              const Expanded(
                child: Text(
                  'Concordo com os Termos de Uso e Política de Privacidade.',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Botão criar conta
          SizedBox(
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF3ABF43), Color(0xFF1D8C24)],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Criar Conta',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 26),
          const Divider(),
          const SizedBox(height: 10),

          Center(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Já é cadastrado?  '),
                  Text(
                    'Fazer Login',
                    style: TextStyle(
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  void _abrirGenero() {
    showModalBottomSheet<void>(
      context: context,
      builder: (_) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Masculino'),
            onTap: () {
              genero.text = 'Masculino';
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Feminino'),
            onTap: () {
              genero.text = 'Feminino';
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Outro'),
            onTap: () {
              genero.text = 'Outro';
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
