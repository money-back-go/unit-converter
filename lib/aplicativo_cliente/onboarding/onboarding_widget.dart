import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import '/app/theme.dart';
import '/app/utils.dart';
import '/app/widgets.dart';
import 'onboarding_model.dart';
export 'onboarding_model.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key});

  static String routeName = 'onboarding';
  static String routePath = 'inicioApp';

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  late OnboardingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OnboardingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  void _completeOnboarding() {
    context.goNamed('home');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: AppTheme.primary,
        body: Stack(
          children: [
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40.0),
                            child: PageView(
                              controller: _model.pageViewController ??=
                                  PageController(initialPage: 0),
                              scrollDirection: Axis.horizontal,
                              children: [
                                // Página 1
                                _buildOnboardingPage(
                                  icon: Icons.calculate_outlined,
                                  title: 'Conversor de Unidades',
                                  description:
                                      'Converta facilmente entre diferentes unidades de medida',
                                ),
                                // Página 2
                                _buildOnboardingPage(
                                  icon: Icons.offline_bolt,
                                  title: '100% Offline',
                                  description:
                                      'Funciona sem internet. Rápido e prático!',
                                ),
                                // Página 3
                                _buildOnboardingPage(
                                  icon: Icons.check_circle_outline,
                                  title: 'Pronto para Usar',
                                  description:
                                      'Toque para começar a converter suas medidas',
                                  showButton: true,
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: Alignment(0.0, 1.0),
                            child: Padding(
                              padding:
                                  EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                              child: smooth_page_indicator.SmoothPageIndicator(
                                controller: _model.pageViewController ??=
                                    PageController(initialPage: 0),
                                count: 3,
                                axisDirection: Axis.horizontal,
                                onDotClicked: (i) async {
                                  await _model.pageViewController!
                                      .animateToPage(
                                    i,
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  );
                                  safeSetState(() {});
                                },
                                effect:
                                    smooth_page_indicator.ExpandingDotsEffect(
                                  expansionFactor: 3.0,
                                  spacing: 8.0,
                                  radius: 16.0,
                                  dotWidth: 16.0,
                                  dotHeight: 8.0,
                                  dotColor: Color(0x9AFFFFFF),
                                  activeDotColor: Colors.white,
                                  paintStyle: PaintingStyle.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Botão Pular no topo
            Positioned(
              top: 16.0,
              right: 16.0,
              child: SafeArea(
                child: TextButton(
                  onPressed: _completeOnboarding,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white.withValues(alpha: 0.2),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: Text(
                    'Pular',
                    style: AppTheme.titleSmall.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingPage({
    required IconData icon,
    required String title,
    required String description,
    bool showButton = false,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.primary,
            AppTheme.secondary,
          ],
          stops: [0.0, 1.0],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 60.0,
              ),
            ),
            SizedBox(height: 48.0),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTheme.displaySmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              description,
              textAlign: TextAlign.center,
              style: AppTheme.titleMedium.copyWith(
                color: Colors.white.withValues(alpha: 0.9),
              ),
            ),
            if (showButton) ...[
              SizedBox(height: 48.0),
              AppButton(
                onPressed: _completeOnboarding,
                text: 'Começar',
                width: 200.0,
                height: 50.0,
                color: Colors.white,
                textColor: AppTheme.primary,
                borderRadius: 25.0,
                elevation: 3.0,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
