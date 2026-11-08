import 'package:flutter/material.dart';
import '../services/content_service.dart';
import '../services/gemini_service.dart';
import '../viewmodels/educational_viewmodel.dart';
import '../viewmodels/self_check_viewmodel.dart';
import '../viewmodels/support_viewmodel.dart';
import '../viewmodels/chat_viewmodel.dart';
import '../widgets/module_card.dart';
import '../widgets/disclaimer_banner.dart';
import 'educational/educational_view.dart';
import 'self_check/self_check_view.dart';
import 'support/support_view.dart';
import 'chat/chat_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final contentService = ContentService();

    return Scaffold(
      appBar: AppBar(title: const Text('Conecta Mente')),
      body: Column(
        children: [
          const DisclaimerBanner(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Text(
                  'Olá! Como podemos te apoiar hoje?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                ModuleCard(
                  icon: Icons.menu_book_outlined,
                  title: 'Educativo',
                  subtitle: 'Conteúdos sobre saúde mental',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EducationalView(
                        viewModel: EducationalViewModel(contentService),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ModuleCard(
                  icon: Icons.psychology_outlined,
                  title: 'Autochecagem Emocional',
                  subtitle: 'Reflita sobre como você está',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          SelfCheckView(viewModel: SelfCheckViewModel()),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ModuleCard(
                  icon: Icons.place_outlined,
                  title: 'Mapeamento de Apoio',
                  subtitle: 'CAPS, UBS e CVV 188',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SupportView(
                        viewModel: SupportViewModel(contentService),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                ModuleCard(
                  icon: Icons.chat_bubble_outline,
                  title: 'Assistente Virtual',
                  subtitle: 'Converse com o assistente (IA)',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          ChatView(viewModel: ChatViewModel(GeminiService())),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
