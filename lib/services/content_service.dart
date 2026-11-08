import '../models/educational_content.dart';
import '../models/support_resource.dart';

class ContentService {
  List<EducationalContent> getEducationalContents() => const [
    EducationalContent(
      id: '1',
      title: 'O que é ansiedade?',
      summary: 'Entenda quando a ansiedade deixa de ser natural.',
      body:
          'A ansiedade é uma resposta natural do corpo a situações de '
          'perigo ou desafio. Torna-se preocupante quando é intensa, '
          'frequente e interfere no dia a dia. Buscar informação e apoio '
          'é um passo importante de autocuidado.',
    ),
    EducationalContent(
      id: '2',
      title: 'Estresse do dia a dia',
      summary: 'Sinais de alerta e estratégias simples.',
      body:
          'O estresse pode se manifestar como irritabilidade, insônia, '
          'cansaço e tensão muscular. Pequenas pausas, respiração '
          'consciente e apoio social ajudam. Se persistir, procure um '
          'profissional de saúde.',
    ),
    EducationalContent(
      id: '3',
      title: 'Lidando com a solidão',
      summary: 'A importância das conexões humanas.',
      body:
          'Sentir-se sozinho não é o mesmo que estar sozinho. O contato '
          'com outras pessoas e o compartilhamento de sentimentos '
          'fortalecem o bem-estar. Considere conversar com alguém de '
          'confiança ou buscar grupos de apoio.',
    ),
  ];

  List<SupportResource> getSupportResources() => const [
    SupportResource(
      name: 'CVV — Centro de Valorização da Vida',
      type: 'Apoio emocional',
      address: 'Atendimento por telefone, 24h',
      phone: '188',
      hours: '24 horas',
    ),
    SupportResource(
      name: 'CAPS — Centro de Atenção Psicossocial',
      type: 'Serviço público',
      address: 'Consulte a unidade mais próxima do seu município',
      phone: '—',
      hours: 'Comercial',
    ),
    SupportResource(
      name: 'UBS — Unidade Básica de Saúde',
      type: 'Atenção primária',
      address: 'Consulte a UBS mais próxima',
      phone: '—',
      hours: 'Comercial',
    ),
  ];
}
