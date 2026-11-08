class SelfCheckQuestion {
  final String text;
  const SelfCheckQuestion(this.text);
}

class SelfCheckOption {
  final String label;
  final int score;
  const SelfCheckOption(this.label, this.score);
}

const selfCheckQuestions = <SelfCheckQuestion>[
  SelfCheckQuestion(
    'Nas últimas duas semanas, senti-me nervoso(a) ou tenso(a).',
  ),
  SelfCheckQuestion('Tive dificuldade em relaxar ou me acalmar.'),
  SelfCheckQuestion('Preocupei-me excessivamente com coisas do dia a dia.'),
  SelfCheckQuestion('Senti-me triste, desanimado(a) ou sem esperança.'),
  SelfCheckQuestion('Perdi interesse em atividades que costumava gostar.'),
];

const selfCheckOptions = <SelfCheckOption>[
  SelfCheckOption('Nunca', 0),
  SelfCheckOption('Raramente', 1),
  SelfCheckOption('Às vezes', 2),
  SelfCheckOption('Frequentemente', 3),
  SelfCheckOption('Sempre', 4),
];
