// Flutter imports:
import 'package:flutter/material.dart';

// --- Modelo de Dados ---
// Define a estrutura dos dados para uma coleta.
class ColetaCardData {
  final String tempoColeta;
  final String distanciaKm;
  final String nomeSolicitante;
  final String endereco;
  final String referencia;
  final String tipoMaterial;
  final String pesoEstimado;
  final String detalhesAdicionais;
  final String observacoes;

  const ColetaCardData({
    required this.tempoColeta,
    required this.distanciaKm,
    required this.nomeSolicitante,
    required this.endereco,
    required this.referencia,
    required this.tipoMaterial,
    required this.pesoEstimado,
    required this.detalhesAdicionais,
    required this.observacoes,
  });
}
// -----------------------

class DetalhesColetaCard extends StatefulWidget {
  final ColetaCardData data;
  final VoidCallback? onVisualizarFotoTap; 
  final VoidCallback? onAceitarColetaTap; 

  const DetalhesColetaCard({
    super.key,
    required this.data,
    this.onVisualizarFotoTap,
    this.onAceitarColetaTap,
  });

  @override
  State<DetalhesColetaCard> createState() => _DetalhesColetaCardState();
}

class _DetalhesColetaCardState extends State<DetalhesColetaCard> {
  // Controla se o card está expandido ou não
  bool _isExpanded = false;

  // Função auxiliar para criar as linhas de informação (rótulo: valor)
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16.0, color: Colors.black),
          children: <TextSpan>[
            // Rótulo em negrito (ex: Nome : )
            TextSpan(text: '$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
            // Valor (ex: Aydom)
            TextSpan(
              text: value,
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
  
  // Função auxiliar para criar cabeçalhos de seção
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Container principal com a borda preta/cinza
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15), // alterei aqui para adicionar sombra (Thomas)
            spreadRadius: 1,
            blurRadius: 6,   
            offset: const Offset(0, 3), 
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          
          // --- 1. Header Azul (Tempo de Coleta) ---
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: Colors.blue.shade600, // Cor de fundo azul forte
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(3.0),
                topRight: Radius.circular(3.0),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.access_time, color: Colors.white, size: 20),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    widget.data.tempoColeta,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.route_outlined, color: Colors.white, size: 20),
                const SizedBox(width: 4.0),
                Text(
                  widget.data.distanciaKm,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          
          // --- 2. Corpo do Card (Detalhes) ---
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // --- Visão Resumida ---
                _buildDetailRow('Nome', widget.data.nomeSolicitante),
                _buildDetailRow('Endereço', widget.data.endereco),
                _buildDetailRow('Material', widget.data.tipoMaterial),

                const SizedBox(height: 16),

                // --- Conteúdo Expansível ---
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(), // Vazio quando recolhido
                  secondChild: _buildExpandedContent(), // Conteúdo detalhado
                  crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300),
                ),

                const SizedBox(height: 16),

                // --- Botões de Ação ---
                Row(
                  children: [
                    // Botão para expandir/recolher
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _isExpanded = !_isExpanded;
                          });
                        },
                        child: Text(
                          _isExpanded ? 'Ver menos' : 'Ver detalhes',
                          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    // Botão para aceitar a coleta
                    Expanded(
                      flex: 2, // Ocupa mais espaço
                      child: ElevatedButton(
                        onPressed: widget.onAceitarColetaTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3493F2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                        child: const Text(
                          'Aceitar Coleta',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget que constrói a parte detalhada do card
  Widget _buildExpandedContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Mais Detalhes'),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: OutlinedButton(
                onPressed: widget.onVisualizarFotoTap,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.lightBlue,
                  side: const BorderSide(color: Colors.lightBlue, width: 1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                ),
                child: const Text('Ver foto', style: TextStyle(fontSize: 14)),
              ),
            ),
          ],
        ),
        _buildDetailRow('Ponto de Referência', widget.data.referencia),
        _buildDetailRow('Peso Estimado', widget.data.pesoEstimado),
        _buildDetailRow('Detalhes', widget.data.detalhesAdicionais),
        const SizedBox(height: 16),
        _buildSectionTitle('Observações'),
        Text(
          widget.data.observacoes,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
      
