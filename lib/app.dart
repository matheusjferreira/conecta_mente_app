import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'views/home_view.dart';

class ConectaMenteApp extends StatelessWidget {
  const ConectaMenteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conecta Mente',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const HomeView(),
    );
  }
}
