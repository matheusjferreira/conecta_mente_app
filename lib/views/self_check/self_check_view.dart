import 'package:flutter/material.dart';
import '../../viewmodels/self_check_viewmodel.dart';
import 'self_check_result_view.dart';

class SelfCheckView extends StatelessWidget {
  final SelfCheckViewModel viewModel;
  const SelfCheckView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: viewModel,
      builder: (context, _) {
        if (viewModel.phase == SelfCheckPhase.finished) {
          return SelfCheckResultView(viewModel: viewModel);
        }
        return Scaffold(
          appBar: AppBar(title: const Text('Autochecagem')),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LinearProgressIndicator(value: viewModel.progress),
                const SizedBox(height: 24),
                Text(
                  'Pergunta ${viewModel.currentIndex + 1} de ${viewModel.total}',
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
                ),
                const SizedBox(height: 8),
                Text(
                  viewModel.currentQuestion.text,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 24),
                ...List.generate(viewModel.options.length, (i) {
                  final opt = viewModel.options[i];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: OutlinedButton(
                      onPressed: () => viewModel.answer(i),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      child: Text(opt.label),
                    ),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
