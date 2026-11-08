// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/constants.dart';

class GeminiService {
  static const String _systemInstruction =
      'Você é um assistente acolhedor do app Conecta Mente. '
      'Ofereça orientações iniciais e informações sobre saúde mental '
      'com linguagem empática e simples. Nunca faça diagnóstico, '
      'nunca prescreva medicamentos. Em situações de risco, '
      'oriente a procurar o CVV (188) ou emergência (192).';

  Future<String> sendMessage(String userMessage) async {
    // Verifica se a chave foi configurada
    if (AppConfig.geminiApiKey.isEmpty) {
      return 'Assistente indisponível. Configure a GEMINI_API_KEY.';
    }

    // A URL agora NÃO leva a chave na query string
    final url = Uri.parse(
      '${AppConfig.geminiEndpoint}/${AppConfig.geminiModel}:generateContent',
    );

    final body = jsonEncode({
      'system_instruction': {
        'parts': [
          {'text': _systemInstruction},
        ],
      },
      'contents': [
        {
          'role': 'user',
          'parts': [
            {'text': userMessage},
          ],
        },
      ],
    });

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          // A chave vai no HEADER, não na URL
          'x-goog-api-key': AppConfig.geminiApiKey,
        },
        body: body,
      );

      if (response.statusCode != 200) {
        // Log para debug (remova em produção)
        print('Erro Gemini: ${response.statusCode} - ${response.body}');
        return 'Não foi possível obter resposta agora. '
            'Tente novamente em instantes.';
      }

      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final candidates = data['candidates'] as List?;
      final text =
          candidates?.first?['content']?['parts']?[0]?['text'] as String?;
      return text?.trim() ?? 'Sem resposta no momento.';
    } catch (e) {
      print('Exceção Gemini: $e');
      return 'Ocorreu um erro ao conectar ao assistente. Verifique sua conexão.';
    }
  }
}
