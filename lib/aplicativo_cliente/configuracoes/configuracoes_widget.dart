import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/app/theme.dart';
import '/app/utils.dart';
import '/app/widgets.dart';
import 'configuracoes_model.dart';
export 'configuracoes_model.dart';

class ConfiguracoesWidget extends StatefulWidget {
  const ConfiguracoesWidget({Key? key}) : super(key: key);

  static String routeName = 'configuracoes';
  static String routePath = 'configuracoes';

  @override
  _ConfiguracoesWidgetState createState() => _ConfiguracoesWidgetState();
}

class _ConfiguracoesWidgetState extends State<ConfiguracoesWidget> {
  late ConfiguracoesModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConfiguracoesModel());
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
          'Configurações',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Seção Geral
                Text(
                  'Geral',
                  style: AppTheme.labelMedium.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.0),
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                      _buildSettingsItem(
                        icon: Icons.info_outline,
                        title: 'Sobre o App',
                        onTap: () {
                          context.pushNamed('sobre');
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24.0),

                // Informações do App
                Center(
                  child: Column(
                    children: [
                      Text(
                        'Conversor de Unidades',
                        style: AppTheme.bodyMedium.copyWith(
                          color: AppTheme.secondaryText,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'Versão 1.0.0',
                        style: AppTheme.bodySmall.copyWith(
                          color: AppTheme.secondaryText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppTheme.alternate.withValues(alpha: 0.3),
              width: 1.0,
            ),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppTheme.primary,
              size: 24.0,
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Text(
                title,
                style: AppTheme.bodyLarge,
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: AppTheme.secondaryText,
              size: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
