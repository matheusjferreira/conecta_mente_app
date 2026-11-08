# 🧠 Conecta Mente

> Aplicativo móvel de apoio e orientação em saúde mental — informativo, acolhedor e acessível.

[![Flutter](https://img.shields.io/badge/Flutter-stable-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Gemini API](https://img.shields.io/badge/AI-Gemini%20API-4285F4?logo=google&logoColor=white)](https://ai.google.dev)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![Status](https://img.shields.io/badge/status-em%20desenvolvimento-orange)]()

---

## 📖 Sobre o projeto

O **Conecta Mente** é um aplicativo móvel desenvolvido como parte do **Projeto Integrador em Computação VI** do curso de Engenharia de Computação da **Universidade Virtual do Estado de São Paulo (UNIVESP)**.

A proposta surgiu da escuta da comunidade externa, que evidenciou a **dificuldade de acesso rápido, simples e confiável** a informações e canais de apoio relacionados a estresse, ansiedade, solidão e outras dificuldades emocionais do cotidiano.

O app atua como uma **ferramenta digital informativa e orientativa**, aproximando o usuário de conteúdos confiáveis e de canais de apoio adequados — **sem substituir o acompanhamento de profissionais especializados** e **sem realizar diagnóstico ou tratamento**.

### 🎯 Objetivos

- **Objetivo geral:** desenvolver um aplicativo móvel informativo e orientativo em saúde mental, com foco em facilitar o acesso a informações confiáveis, orientações iniciais e canais de apoio.
- **Objetivos específicos:** mapear demandas da comunidade; estruturar canais de apoio; projetar UX/UI acessível; integrar IA (Gemini API); desenvolver em Flutter; publicar via Google Play ou Firebase Hosting; validar a solução de forma progressiva.

---

## ✨ Funcionalidades

O app é composto por **quatro módulos principais**:

### 1. 📚 Módulo Educativo
Reúne conteúdos informativos sobre saúde mental com linguagem acessível. Aborda temas como:
- Ansiedade
- Estresse do dia a dia
- Solidão e conexões humanas

Cada conteúdo é exibido em cards com título, resumo e texto completo. Inclui **campo de busca** por tema.

### 2. 🧠 Autochecagem Emocional
Oferece uma forma inicial de **reflexão sobre o estado emocional** do usuário. Composta por perguntas objetivas inspiradas em instrumentos de rastreio validados (**PHQ-9** e **GAD-7**), com escala de respostas:
- Nunca / Raramente / Às vezes / Frequentemente / Sempre

Ao final, apresenta uma **mensagem orientativa** (não diagnóstica) com sugestões de autocuidado e encaminhamentos para canais de apoio.

> ⚠️ **Importante:** a autochecagem **não é diagnóstico médico**. É apenas um recurso de reflexão e orientação.

### 3. 🏥 Mapeamento de Apoio/Emergência
Organiza informações e caminhos para serviços e canais de apoio:
- **CVV** — Centro de Valorização da Vida (telefone **188**, 24h)
- **CAPS** — Centro de Atenção Psicossocial
- **UBS** — Unidade Básica de Saúde

Permite **filtro por tipo de serviço** e apresenta nome, endereço, telefone e horário de funcionamento.

### 4. 💬 Assistente Virtual com IA (Gemini API)
Interface de chat com o assistente virtual baseado na **Gemini API** (Google AI). Oferece respostas **acolhedoras e orientações iniciais** sobre saúde mental, com linguagem empática e simples.

O assistente:
- ❌ **Nunca** faz diagnóstico
- ❌ **Nunca** prescreve medicamentos
- ✅ **Sempre** orienta buscar o CVV (188) ou emergência (192) em situações de risco

---

## 🏗️ Arquitetura

O projeto segue o padrão **MVVM (Model-View-ViewModel)**, alinhado às recomendações oficiais do Flutter, com separação clara de responsabilidades:

```
lib/
├── main.dart                          # Ponto de entrada
├── app.dart                           # Configuração do MaterialApp
├── core/
│   ├── theme.dart                     # Tema e cores (Material 3)
│   └── constants.dart                 # Strings e configurações globais
├── models/                            # Dados imutáveis
│   ├── educational_content.dart
│   ├── self_check_question.dart
│   ├── support_resource.dart
│   └── chat_message.dart
├── services/                          # Acesso a dados e APIs
│   ├── content_service.dart           # Conteúdos mockados (nesta versão)
│   └── gemini_service.dart            # Integração com Gemini API
├── viewmodels/                        # Estado + regras de negócio
│   ├── educational_viewmodel.dart
│   ├── self_check_viewmodel.dart
│   ├── support_viewmodel.dart
│   └── chat_viewmodel.dart
├── views/                             # Telas
│   ├── home_view.dart
│   ├── educational/
│   ├── self_check/
│   ├── support/
│   └── chat/
└── widgets/                           # Componentes reutilizáveis
    ├── module_card.dart
    └── disclaimer_banner.dart
```

### Por que MVVM?

- **Models:** dados puros, sem dependências de UI.
- **Services:** encapsulam acesso a dados (local ou remoto).
- **ViewModels:** herdam de `ChangeNotifier` e notificam a UI sobre mudanças de estado.
- **Views:** apenas renderizam; não contêm lógica de negócio.
- **Widgets:** componentes visuais reutilizáveis.

Essa separação facilita **testes unitários**, **manutenção** e **escalabilidade** — permitindo, por exemplo, trocar `ContentService` por uma integração com Firestore sem tocar nas views.

---

## 🛠️ Tecnologias utilizadas

### Ambiente de Desenvolvimento
| Ferramenta | Finalidade |
|---|---|
| **VS Code** | IDE com extensão oficial do Flutter |
| **Git** | Controle de versão |
| **Flutter SDK (stable)** | Framework principal |

### Linguagem e Framework
| Tecnologia | Descrição |
|---|---|
| **Dart** | Linguagem com null safety e programação assíncrona |
| **Flutter (Material Design 3)** | UI multiplataforma responsiva e acessível |

### Arquitetura
| Conceito | Aplicação |
|---|---|
| **MVVM** | Separação entre dados, lógica e UI |
| **ChangeNotifier** | Gerenciamento de estado reativo |
| **Separation of Concerns** | Camadas independentes e testáveis |

### Integração com IA e Serviços
| Tecnologia | Uso |
|---|---|
| **Gemini API** (`gemini-1.5-flash`) | Assistente virtual com IA |
| **Pacote `http` (Dart)** | Requisições HTTP à Gemini API |
| **Firebase (Auth, Firestore, Hosting)** | Previsto para a 5ª quinzena |
| **Google Play Console / Firebase Hosting** | Publicação (prevista) |

### Segurança
- **`GEMINI_API_KEY` via `--dart-define`**: a chave **não é hardcoded** no código-fonte; é injetada em tempo de build, evitando vazamentos no repositório e reforçando a conformidade com a **LGPD**.

### Conceitos aplicados
- **Design Thinking** (Ouvir → Criar → Implementar)
- **Design Centrado no Usuário** (princípios de Donald Norman)
- **LGPD** — tratamento de dados sensíveis de saúde
- **Disclaimer Ético** — aviso visível de que o app não substitui profissionais
- **Acessibilidade** — linguagem acolhedora e navegação intuitiva

---

## 🚀 Como executar

### Pré-requisitos

- **Flutter SDK (stable)** instalado — [instruções oficiais](https://docs.flutter.dev/get-started/install)
- **Dart** (já incluso no Flutter)
- **VS Code** com a extensão oficial do Flutter *(recomendado)*
- **Git** para clonar o repositório
- **Chave da Gemini API** — obtenha em [Google AI Studio](https://aistudio.google.com/app/apikey)
- **Android Studio / Xcode** *(opcional, para emuladores)*

### Verificar a instalação

```bash
flutter doctor
```

### 1. Clonar o repositório

```bash
git clone https://github.com/<usuario>/conecta_mente.git
cd conecta_mente
```

### 2. Instalar dependências

```bash
flutter pub get
```

### 3. Configurar a chave da Gemini API

A chave **não deve ser commitada**. Utilize `--dart-define` ao executar:

```bash
flutter run --dart-define=GEMINI_API_KEY=SUA_CHAVE_AQUI
```

> 💡 **Dica:** para não digitar sempre, crie um arquivo local `--dart-define-from-file`:
>
> **`env.json`** (adicionar no `.gitignore`):
> ```json
> { "GEMINI_API_KEY": "SUA_CHAVE_AQUI" }
> ```
>
> E execute:
> ```bash
> flutter run --dart-define-from-file=env.json
> ```

### 4. Rodar em um dispositivo/emulador

```bash
# Android (dispositivo ou emulador)
flutter run --dart-define=GEMINI_API_KEY=SUA_CHAVE

# Web (Chrome)
flutter run -d chrome --dart-define=GEMINI_API_KEY=SUA_CHAVE

# iOS (macOS)
flutter run -d ios --dart-define=GEMINI_API_KEY=SUA_CHAVE
```

### 5. Build para produção

```bash
# Android (APK)
flutter build apk --release --dart-define=GEMINI_API_KEY=SUA_CHAVE

# Android (App Bundle para Play Store)
flutter build appbundle --release --dart-define=GEMINI_API_KEY=SUA_CHAVE

# Web
flutter build web --dart-define=GEMINI_API_KEY=SUA_CHAVE
```

### 6. (Opcional) Publicar no Firebase Hosting

```bash
firebase login
firebase init hosting
firebase deploy --only hosting
```

---

## 🧪 Testes

```bash
# Testes unitários
flutter test

# Análise estática de código
flutter analyze
```

*(Testes unitários dos ViewModels estão planejados para a próxima etapa.)*

---

## 📁 Estrutura do repositório

```
conecta_mente/
├── android/                  # Projeto Android
├── ios/                      # Projeto iOS
├── web/                      # Projeto Web
├── lib/                      # Código-fonte Dart
│   ├── core/
│   ├── models/
│   ├── services/
│   ├── viewmodels/
│   ├── views/
│   ├── widgets/
│   ├── main.dart
│   └── app.dart
├── test/                     # Testes
├── pubspec.yaml              # Dependências
├── README.md                 # Este arquivo
├── LICENSE                   # Licença MIT
└── .gitignore
```

---

## ⚠️ Aviso importante

> **O Conecta Mente NÃO substitui acompanhamento profissional.**
>
> - ❌ Não realiza diagnóstico
> - ❌ Não prescreve medicamentos
> - ❌ Não substitui atendimento psicológico, médico ou psiquiátrico
>
> ✅ É uma ferramenta complementar de informação e orientação
>
> **Em situações de risco de vida, procure imediatamente:**
> - **CVV** — 188 (24h, gratuito)
> - **SAMU** — 192
> - **Emergência mais próxima**

---

## 🗺️ Roadmap

- [x] Arquitetura inicial (MVVM)
- [x] Módulo Educativo
- [x] Autochecagem Emocional
- [x] Mapeamento de Apoio
- [x] Assistente Virtual com Gemini API
- [ ] Firebase Authentication (login/cadastro)
- [ ] Firestore para conteúdos dinâmicos
- [ ] Publicação no Google Play
- [ ] Publicação via Firebase Hosting
- [ ] Testes unitários dos ViewModels
- [ ] Ampliação da amostra de validação comunitária
- [ ] Painel administrativo para gestão de conteúdo

---

## 👥 Autores

- **RA 2232950** — Adilson Polidoro de França
- **RA 1805701** — Carlos Alberto Pereira
- **RA 2229651** — Elisangela Maria Rosa da Silva
- **RA 2218685** — Matheus Jediel Ferreira
- **RA 1818303** — Pablo Antonio Takeyama Antunes
- **RA 2103144** — Reginaldo Egashira

**Orientadora:** Prof.ª Ana Julia Gonzalez Tendulini
**Instituição:** Universidade Virtual do Estado de São Paulo (UNIVESP)
**Curso:** Engenharia de Computação
**Disciplina:** Projeto Integrador em Computação VI
**Polos:** Santa Bárbara D'Oeste, Itatiba e Mogi Mirim — SP
**Ano:** 2026

---

## 📚 Referências

- WORLD HEALTH ORGANIZATION. **World mental health report: transforming mental health for all.** Geneva: WHO, 2022.
- NORMAN, D. A. **The design of everyday things.** Revised and expanded edition. New York: Basic Books, 2013.
- BRASIL. **Lei nº 13.709, de 14 de agosto de 2018** (LGPD). Brasília, DF, 2018.
- MARENGO, L. L. et al. **Tecnologias móveis em saúde.** Revista Panamericana de Salud Pública, v. 46, 2022.
- TOROUS, J. et al. **The growing field of digital psychiatry.** World Psychiatry, v. 20, n. 3, 2021.

---

## 🤝 Contribuindo

Este é um projeto acadêmico. Sugestões e feedbacks são bem-vindos!

1. Faça um _fork_ do projeto
2. Crie uma _branch_ (`git checkout -b feature/minha-feature`)
3. Faça _commit_ das suas mudanças (`git commit -m 'feat: minha feature'`)
4. Faça _push_ (`git push origin feature/minha-feature`)
5. Abra um _Pull Request_

---

## 📄 Licença

Este projeto está licenciado sob a **Licença MIT** — veja o arquivo [LICENSE](./LICENSE) para detalhes.

```
MIT License

Copyright (c) 2026 Conecta Mente — UNIVESP

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

---

<p align="center">
  Feito com 💙 para promover acesso a informação e apoio em saúde mental.
  <br>
  <em>"Cuidar da mente é cuidar da vida."</em>
</p>
```
