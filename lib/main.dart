import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';

import 'app/router.dart';
import 'app/theme.dart';
import 'app_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();

  final appState = FFAppState();
  await appState.initializePersistedState();

  runApp(
    ChangeNotifierProvider(
      create: (context) => appState,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier.instance;
    _router = createAppRouter(_appStateNotifier);

    Future.delayed(
      const Duration(milliseconds: 100),
      () => _appStateNotifier.stopShowingSplashImage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      theme: ThemeData(
        useMaterial3: false,
        brightness: Brightness.light,
        primaryColor: AppTheme.primary,
        scaffoldBackgroundColor: AppTheme.primaryBackground,
        colorScheme: ColorScheme.light(
          primary: AppTheme.primary,
          secondary: AppTheme.secondary,
          surface: AppTheme.secondaryBackground,
        ),
        scrollbarTheme: ScrollbarThemeData(
          radius: const Radius.circular(5.0),
          thumbColor: WidgetStateProperty.all(AppTheme.primary),
        ),
      ),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
        Locale('en', 'US'),
      ],
      routerConfig: _router,
    );
  }
}
