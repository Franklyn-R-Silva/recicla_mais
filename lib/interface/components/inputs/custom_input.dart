// Flutter imports:
import 'package:flutter/material.dart';

/// Campo de entrada padrão do aplicativo.
/// Agora suporta: label opcional, sanitização, campos obrigatórios,
/// readOnly, onTap, e controle de teclado.
class CustomInput extends StatelessWidget {
  final String? label;               // agora opcional
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscure;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool requiredField;

  const CustomInput({
    super.key,
    this.label,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscure = false,
    this.readOnly = false,
    this.onTap,
    this.requiredField = false,
  });

  // Sanitizador básico
  String sanitize(String value) {
    return value.trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            requiredField ? '$label *' : label!,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),

        if (label != null) const SizedBox(height: 8),

        TextField(
          controller: controller,
          obscureText: obscure,
          readOnly: readOnly,
          keyboardType: keyboardType,
          onTap: onTap,
          onChanged: (v) => controller.text = sanitize(v),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Colors.black54),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1.3, color: Colors.green),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
