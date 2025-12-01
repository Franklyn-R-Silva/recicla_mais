import 'package:flutter/material.dart';
import '../components/card_colector.dart';

class ColetasDisponiveisPage extends StatefulWidget {
  const ColetasDisponiveisPage({super.key});

  @override
  State<ColetasDisponiveisPage> createState() => _ColetasDisponiveisPageState();
}

class _ColetasDisponiveisPageState extends State<ColetasDisponiveisPage> {
  // Lista de dados de exemplo para teste.
  // Em um app real, isso viria de um banco de dados ou API.
  static final List<ColetaCardData> _coletasMock = [
    ColetaCardData(
      tempoColeta: 'Hoje, 13:10 - 15:10',
      distanciaKm: '2.5 km',
      nomeSolicitante: 'Aydom',
      endereco: 'R. Jardim Esperança, 123',
      referencia: 'Casa com portão verde',
      tipoMaterial: 'Plástico',
      pesoEstimado: '7kg',
      detalhesAdicionais: 'Garrafas PET e embalagens limpas.',
      observacoes: 'Favor trazer sacos resistentes.',
    ),
    ColetaCardData(
      tempoColeta: 'Hoje, 15:30 - 17:00',
      distanciaKm: '5.1 km',
      nomeSolicitante: 'Maria Silva',
      endereco: 'Av. Paulista, 1000',
      referencia: 'Apto 52, Bloco B',
      tipoMaterial: 'Papelão e Vidro',
      pesoEstimado: '12kg',
      detalhesAdicionais: 'Caixas de papelão desmontadas e garrafas de vidro.',
      observacoes: 'Cuidado com os cacos de vidro.',
    ),
    ColetaCardData(
      tempoColeta: 'Amanhã, 09:00 - 11:00',
      distanciaKm: '8.0 km',
      nomeSolicitante: 'Carlos Souza',
      endereco: 'Praça da Sé, S/N',
      referencia: 'Em frente à catedral',
      tipoMaterial: 'Metal',
      pesoEstimado: '25kg',
      detalhesAdicionais: 'Latas de alumínio e panelas velhas.',
      observacoes: 'Verificar se há itens enferrujados.',
    ),
    ColetaCardData(
      tempoColeta: 'Amanhã, 09:00 - 11:00',
      distanciaKm: '10.2 km',
      nomeSolicitante: 'Jhon Corno',
      endereco: 'Praça da Sé, S/N',
      referencia: 'Ao lado do orelhão',
      tipoMaterial: 'Metal',
      pesoEstimado: '25kg de chifre',
      detalhesAdicionais: 'Material de origem duvidosa.',
      observacoes: 'Cuidado com os chifres afiados.',
    ),
  ];

  // A lista de coletas agora faz parte do estado do widget.
  late List<ColetaCardData> _coletasDisponiveis;

  @override
  void initState() {
    super.initState();
    _coletasDisponiveis = List.from(_coletasMock);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coletas Disponíveis'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: _coletasDisponiveis.isEmpty
          ? const Center(
              child: Text(
                'Nenhuma coleta disponível no momento.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: _coletasDisponiveis.length,
              itemBuilder: (context, index) {
                final coleta = _coletasDisponiveis[index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: DetalhesColetaCard(
                    data: coleta,
                    onVisualizarFotoTap: () {},
                    onAceitarColetaTap: () {
                      setState(() {
                        _coletasDisponiveis.removeAt(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Coleta de ${coleta.nomeSolicitante} aceita!'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}