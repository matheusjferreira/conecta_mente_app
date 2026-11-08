import 'package:flutter/foundation.dart';
import '../models/self_check_question.dart';

enum SelfCheckPhase { answering, finished }

class SelfCheckViewModel extends ChangeNotifier {
  final Map<int, int> _answers = {};
  int _current = 0;
  SelfCheckPhase _phase = SelfCheckPhase.answering;

  SelfCheckPhase get phase => _phase;
  int get currentIndex => _current;
  int get total => selfCheckQuestions.length;
  SelfCheckQuestion get currentQuestion => selfCheckQuestions[_current];
  List<SelfCheckOption> get options => selfCheckOptions;
  double get progress => (_current + 1) / total;

  int get totalScore => _answers.values.fold(0, (a, b) => a + b);

  void answer(int optionIndex) {
    _answers[_current] = selfCheckOptions[optionIndex].score;
    if (_current < total - 1) {
      _current++;
    } else {
      _phase = SelfCheckPhase.finished;
    }
    notifyListeners();
  }

  void restart() {
    _answers.clear();
    _current = 0;
    _phase = SelfCheckPhase.answering;
    notifyListeners();
  }

  /// Mensagem orientativa — NÃO é diagnóstico.
  String get resultMessage {
    final s = totalScore;
    if (s <= 5) {
      return 'Seus indicadores parecem leves. Continue cuidando de você.';
    } else if (s <= 12) {
      return 'Você relatou sinais moderados. Considere conversar com alguém de confiança ou buscar apoio.';
    } else {
      return 'Você relatou sinais importantes. Reforçamos a importância de procurar um profissional. O CVV (188) está disponível 24h.';
    }
  }
}
