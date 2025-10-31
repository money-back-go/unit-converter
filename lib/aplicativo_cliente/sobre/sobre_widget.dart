import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/app/theme.dart';
import '/app/utils.dart';
import '/app/widgets.dart';
import 'sobre_model.dart';
export 'sobre_model.dart';

class SobreWidget extends StatefulWidget {
  const SobreWidget({Key? key}) : super(key: key);

  static String routeName = 'sobre';
  static String routePath = 'sobre';

  @override
  _SobreWidgetState createState() => _SobreWidgetState();
}

class _SobreWidgetState extends State<SobreWidget> {
  late SobreModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SobreModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppTheme.primaryBackground,
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        automaticallyImplyLeading: false,
        leading: AppIconButton(
          icon: Icons.arrow_back_rounded,
          iconColor: Colors.white,
          iconSize: 24.0,
          buttonSize: 46.0,
          borderRadius: 30.0,
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          'Sobre o App',
          style: AppTheme.headlineMedium.copyWith(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo/Ícone do app
                Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8.0,
                        color: Color(0x33000000),
                        offset: Offset(0.0, 4.0),
                      )
                    ],
                  ),
                  child: Icon(
                    Icons.calculate_outlined,
                    size: 60.0,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 24.0),

                // Nome do app
                Text(
                  'Conversor de Unidades',
                  style: AppTheme.headlineLarge.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 8.0),

                // Versão
                Text(
                  'Versão 1.0.0',
                  style: AppTheme.bodyMedium.copyWith(
                        color: AppTheme.secondaryText,
                      ),
                ),

                SizedBox(height: 32.0),

                // Card de descrição
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x1A000000),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: AppTheme.primary,
                            size: 24.0,
                          ),
                          SizedBox(width: 12.0),
                          Text(
                            'Sobre',
                            style: AppTheme.titleLarge.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Conversor de Unidades é um aplicativo simples e prático para converter entre diferentes unidades de medida.',
                        style: AppTheme.bodyLarge,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        'Funciona 100% offline, sem necessidade de internet. Rápido, preciso e fácil de usar.',
                        style: AppTheme.bodyMedium.copyWith(
                              color: AppTheme.secondaryText,
                            ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.0),

                // Card de funcionalidades
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4.0,
                        color: Color(0x1A000000),
                        offset: Offset(0.0, 2.0),
                      )
                    ],
                  ),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            color: AppTheme.success,
                            size: 24.0,
                          ),
                          SizedBox(width: 12.0),
                          Text(
                            'Funcionalidades',
                            style: AppTheme.titleLarge.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      _buildFeatureItem('Comprimento', Icons.straighten),
                      _buildFeatureItem('Peso', Icons.fitness_center),
                      _buildFeatureItem('Temperatura', Icons.thermostat),
                      _buildFeatureItem('Volume', Icons.local_drink),
                      _buildFeatureItem('Área', Icons.crop_square),
                      _buildFeatureItem('Velocidade', Icons.speed),
                      _buildFeatureItem('Tempo', Icons.access_time),
                      _buildFeatureItem('Dados Digitais', Icons.storage),
                    ],
                  ),
                ),

                SizedBox(height: 32.0),

                // Footer
                Text(
                  '© 2024 Conversor de Unidades',
                  style: AppTheme.bodySmall.copyWith(
                        color: AppTheme.secondaryText,
                      ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 8.0),

                Text(
                  'Feito com ❤️ para facilitar suas conversões',
                  style: AppTheme.bodySmall.copyWith(
                        color: AppTheme.secondaryText,
                      ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String title, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20.0,
            color: AppTheme.primary,
          ),
          SizedBox(width: 12.0),
          Text(
            title,
            style: AppTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
