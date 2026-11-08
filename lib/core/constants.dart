class AppStrings {
  static const String disclaimer =
      'Este aplicativo é informativo e orientativo. '
      'Não substitui atendimento profissional de saúde mental.';

  static const String cvvNumber = '188';
  static const String cvvLabel = 'CVV — 188 (24h)';
}

class AppConfig {
  // Chave injetada via --dart-define=GEMINI_API_KEY=xxx
  static const String geminiApiKey = String.fromEnvironment('GEMINI_API_KEY', defaultValue: '');
  static const String geminiModel = 'gemini-3.8-flash';
  static const String geminiEndpoint =
      'https://generativelanguage.googleapis.com/v1beta/models';
}
