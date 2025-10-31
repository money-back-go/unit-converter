# 📱 Unit Converter - Conversor de Unidades

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.35.3-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.9.2-blue?logo=dart)
![License](https://img.shields.io/badge/license-MIT-green)
![Platform](https://img.shields.io/badge/platform-Android%20%7C%20iOS-lightgrey)

**Conversor de unidades simples, rápido e 100% offline**

[Download](#-download) • [Funcionalidades](#-funcionalidades) • [Categorias](#-categorias) • [Documentação](#-documentação)

</div>

---

## 📖 Sobre

**Unit Converter** é um aplicativo Flutter moderno e minimalista para converter entre diferentes unidades de medida. Com 8 categorias completas e mais de 50 unidades diferentes, é a solução perfeita para estudantes, profissionais e qualquer pessoa que precise de conversões rápidas e precisas.

### ✨ Destaques

- 🚀 **100% Offline** - Funciona sem internet
- 🎯 **8 Categorias** - Comprimento, peso, temperatura, volume, área, velocidade, tempo e dados
- 💯 **Precisão Absoluta** - Fórmulas matemáticas oficiais
- 🎨 **Interface Moderna** - Design limpo e intuitivo
- 🆓 **Totalmente Gratuito** - Sem anúncios ou compras
- ⚡ **Super Leve** - Menos de 50MB

---

## 🎯 Funcionalidades

### 📏 8 Categorias de Conversão

| Categoria | Unidades Disponíveis |
|-----------|---------------------|
| 📏 **Comprimento** | Metro, Quilômetro, Centímetro, Milímetro, Milha, Pé, Polegada |
| ⚖️ **Peso** | Quilograma, Grama, Miligrama, Tonelada, Libra, Onça |
| 🌡️ **Temperatura** | Celsius, Fahrenheit, Kelvin |
| 💧 **Volume** | Litro, Mililitro, Metro Cúbico, Galão, Xícara |
| 📐 **Área** | Metro Quadrado, Quilômetro Quadrado, Hectare, Acre, Pé Quadrado |
| 🚀 **Velocidade** | Km/h, M/s, Milha/h, Nó |
| ⏰ **Tempo** | Segundo, Minuto, Hora, Dia, Semana, Mês, Ano |
| 💾 **Dados Digitais** | Byte, Kilobyte, Megabyte, Gigabyte, Terabyte |

### 🎨 Telas Principais

- **Onboarding** - Introdução de 3 páginas com botão "Pular"
- **Home** - Grid com 8 categorias coloridas
- **Conversor** - Interface intuitiva com resultados instantâneos
- **Sobre** - Informações do app
- **Configurações** - Preferências do usuário

---

## 🛠️ Tecnologias

- **Framework:** Flutter 3.35.3
- **Linguagem:** Dart 3.9.2
- **Navegação:** GoRouter
- **Fontes:** Google Fonts (Nunito)
- **Armazenamento:** SharedPreferences (apenas preferências locais)

### 📦 Principais Dependências

```yaml
dependencies:
  flutter:
    sdk: flutter
  go_router: 12.1.3
  provider: 6.1.5
  google_fonts: 6.1.0
  smooth_page_indicator: 1.1.0
  shared_preferences: 2.5.3
```

---

## 🚀 Como Executar

### Pré-requisitos

- Flutter SDK 3.0+
- Dart SDK 3.0+
- Android Studio / Xcode

### Instalação

```bash
# Clone o repositório
git clone https://github.com/money-back-go/unit-converter.git
cd unit-converter

# Instale as dependências
flutter pub get

# Execute o app
flutter run
```

### Builds de Produção

```bash
# Android APK
flutter build apk --release

# Android App Bundle (Google Play)
flutter build appbundle --release

# iOS (requer Mac)
flutter build ios --release
```

---

## 📱 Download

<div align="center">

[![Google Play](https://img.shields.io/badge/Google_Play-Coming_Soon-414141?style=for-the-badge&logo=google-play&logoColor=white)](https://play.google.com)
[![App Store](https://img.shields.io/badge/App_Store-Coming_Soon-0D96F6?style=for-the-badge&logo=app-store&logoColor=white)](https://apps.apple.com)

</div>

---

## 📂 Estrutura do Projeto

```
unit-converter/
├── lib/
│   ├── app/                        # Arquivos base (tema, router, utils)
│   │   ├── theme.dart             # Tema e cores do app
│   │   ├── router.dart            # Navegação GoRouter
│   │   ├── utils.dart             # Utilitários
│   │   └── widgets.dart           # Widgets customizados
│   ├── aplicativo_cliente/        # Telas do app
│   │   ├── home/                  # Tela inicial com categorias
│   │   ├── converter/             # Tela de conversão
│   │   ├── onboarding/            # Introdução do app
│   │   ├── sobre/                 # Sobre o app
│   │   └── configuracoes/         # Configurações
│   ├── app_state.dart             # Estado global
│   └── main.dart                  # Entry point
├── assets/                         # Recursos (imagens, fontes)
├── android/                        # Projeto Android
├── ios/                            # Projeto iOS
├── landing-page.html              # Landing page de divulgação
├── politica-privacidade.html      # Política de privacidade
└── pubspec.yaml                   # Dependências
```

---

## 🎨 Design System

### Cores Principais

```dart
Primary:    #FFAE14  // Laranja vibrante
Secondary:  #15203D  // Azul escuro
Alternate:  #FF5963  // Vermelho/rosa
Success:    #28A745  // Verde
```

### Tipografia

- **Fonte:** Nunito (Google Fonts)
- **Pesos:** Regular (400), Medium (500), SemiBold (600), Bold (700), ExtraBold (800)

---

## 📄 Documentação Adicional

- 📋 [Checklist de Publicação](CHECKLIST_PUBLICACAO.txt)
- 📝 [Descrição Google Play](descricao-google-play.txt)
- 🍎 [Descrição App Store](descricao-app-store.txt)
- 🔑 [Palavras-chave](keywords.txt)
- 🌐 [Landing Page README](LANDING_PAGE_README.md)

---

## 🤝 Contribuindo

Contribuições são bem-vindas! Sinta-se à vontade para:

1. Fazer fork do projeto
2. Criar uma branch (`git checkout -b feature/NovaFuncionalidade`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova funcionalidade'`)
4. Push para a branch (`git push origin feature/NovaFuncionalidade`)
5. Abrir um Pull Request

---

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---

## 📧 Contato

- **Email:** contato@unitconverter.com
- **Website:** [Landing Page](landing-page.html)

---

## 🎯 Roadmap

- [x] 8 categorias de conversão
- [x] Interface moderna
- [x] Funcionamento offline
- [x] Landing page
- [ ] Modo escuro completo
- [ ] Histórico de conversões
- [ ] Favoritar unidades mais usadas
- [ ] Suporte a mais idiomas
- [ ] Widget para tela inicial

---

## 📊 Status do Projeto

**Versão Atual:** 1.0.0  
**Status:** ✅ Pronto para produção  
**Plataformas:** Android, iOS

---

<div align="center">

**Desenvolvido com ❤️ em Flutter**

[![Flutter](https://img.shields.io/badge/Made%20with-Flutter-02569B?logo=flutter)](https://flutter.dev)

</div>

