import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.size,
    this.textEditingController,
    required this.label,
    this.suffixText,
    this.maxLines = 1,
    this.filled = true,
  });

  final Size size;
  final TextEditingController? textEditingController;
  final String label;
  final String? suffixText;
  final int? maxLines;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * .8,
      child: TextFormField(
        controller: textEditingController,
        maxLines: maxLines,
        decoration: InputDecoration(
          filled: filled,
          label: Row(
            children: [
              Text(label, style: const TextStyle(color: Colors.grey)),
              const Text("*", style: TextStyle(color: Colors.red)),
            ],
          ),
          suffixText: suffixText,
          suffixStyle: const TextStyle(color: Colors.red),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}
