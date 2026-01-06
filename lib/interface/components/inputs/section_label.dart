// Flutter imports:
import 'package:flutter/material.dart';

class SectionLabel extends StatelessWidget {
  final String text;
  final bool requiredField;
  
  const SectionLabel(
    this.text, {
    super.key,
    this.requiredField = true, // deixa todos obrigatórios por padrão
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          if (requiredField)
            const TextSpan(
              text: ' *',
              style: TextStyle(
                color: Colors.red,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
    );
  }
}

