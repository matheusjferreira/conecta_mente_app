import 'package:flutter/material.dart';
import '../../models/educational_content.dart';

class EducationalDetailView extends StatelessWidget {
  final EducationalContent content;
  const EducationalDetailView({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(content.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Text(
          content.body,
          style: const TextStyle(fontSize: 16, height: 1.5),
        ),
      ),
    );
  }
}
