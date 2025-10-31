import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../aplicativo_cliente/home/home_widget.dart';
import '../aplicativo_cliente/onboarding/onboarding_widget.dart';
import '../aplicativo_cliente/converter/converter_widget.dart';
import '../aplicativo_cliente/sobre/sobre_widget.dart';
import '../aplicativo_cliente/configuracoes/configuracoes_widget.dart';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createAppRouter(AppStateNotifier appStateNotifier) {
  return GoRouter(
    initialLocation: '/',
    refreshListenable: appStateNotifier,
    routes: [
      GoRoute(
        path: '/',
        name: 'onboarding',
        builder: (context, state) => const OnboardingWidget(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeWidget(),
      ),
      GoRoute(
        path: '/converter',
        name: 'converter',
        builder: (context, state) {
          final categoryId = state.uri.queryParameters['categoryId'] ?? '';
          final categoryTitle = state.uri.queryParameters['categoryTitle'] ?? '';
          final units = state.uri.queryParameters['units'] ?? '';
          
          return ConverterWidget(
            categoryId: categoryId,
            categoryTitle: categoryTitle,
            units: units,
          );
        },
      ),
      GoRoute(
        path: '/sobre',
        name: 'sobre',
        builder: (context, state) => const SobreWidget(),
      ),
      GoRoute(
        path: '/configuracoes',
        name: 'configuracoes',
        builder: (context, state) => const ConfiguracoesWidget(),
      ),
    ],
  );
}

// Navigation extensions
extension NavigationExtensions on BuildContext {
  void safePop() {
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

