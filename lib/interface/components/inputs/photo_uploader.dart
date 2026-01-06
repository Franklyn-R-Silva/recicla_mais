// Flutter imports:
import 'package:flutter/material.dart';

/// Componente para upload de foto.
/// Caixa com borda, ícone de câmera e texto centralizado.
class PhotoUploader extends StatelessWidget {
  final VoidCallback? onTap;
  final void Function(String base64)? onImageSelected;
  final bool requiredField;

  const PhotoUploader({
    super.key,
    this.onTap,
    this.onImageSelected,
    this.requiredField = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black54, width: 1),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt, size: 40, color: Colors.grey),
            SizedBox(height: 6),
            Text('Adicionar uma foto', style: TextStyle(color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}
