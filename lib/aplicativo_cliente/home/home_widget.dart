import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/app/theme.dart';
import '/app/utils.dart';
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  static String routeName = 'home';
  static String routePath = 'home';

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> _categories = [
    {
      'id': 'comprimento',
      'title': 'Comprimento',
      'icon': Icons.straighten,
      'color': AppTheme.primary,
      'units': [
        'Metro',
        'Quilômetro',
        'Centímetro',
        'Milímetro',
        'Milha',
        'Pé',
        'Polegada'
      ]
    },
    {
      'id': 'peso',
      'title': 'Peso',
      'icon': Icons.fitness_center,
      'color': AppTheme.alternate,
      'units': ['Quilograma', 'Grama', 'Miligrama', 'Tonelada', 'Libra', 'Onça']
    },
    {
      'id': 'temperatura',
      'title': 'Temperatura',
      'icon': Icons.thermostat,
      'color': const Color(0xFF4B39EF),
      'units': ['Celsius', 'Fahrenheit', 'Kelvin']
    },
    {
      'id': 'volume',
      'title': 'Volume',
      'icon': Icons.local_drink,
      'color': const Color(0xFF39D2C0),
      'units': ['Litro', 'Mililitro', 'Metro Cúbico', 'Galão', 'Xícara']
    },
    {
      'id': 'area',
      'title': 'Área',
      'icon': Icons.crop_square,
      'color': const Color(0xFFEE8B60),
      'units': [
        'Metro Quadrado',
        'Quilômetro Quadrado',
        'Hectare',
        'Acre',
        'Pé Quadrado'
      ]
    },
    {
      'id': 'velocidade',
      'title': 'Velocidade',
      'icon': Icons.speed,
      'color': const Color(0xFF249689),
      'units': ['Km/h', 'M/s', 'Milha/h', 'Nó']
    },
    {
      'id': 'tempo',
      'title': 'Tempo',
      'icon': Icons.access_time,
      'color': const Color(0xFFFF6F00),
      'units': ['Segundo', 'Minuto', 'Hora', 'Dia', 'Semana', 'Mês', 'Ano']
    },
    {
      'id': 'dados',
      'title': 'Dados Digitais',
      'icon': Icons.storage,
      'color': const Color(0xFF6F61EF),
      'units': ['Byte', 'Kilobyte', 'Megabyte', 'Gigabyte', 'Terabyte']
    },
  ];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());
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
        title: Text(
          'Conversor de Unidades',
          style: AppTheme.headlineMedium.copyWith(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 24.0,
            ),
            onPressed: () {
              context.pushNamed('sobre');
            },
          ),
        ],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppTheme.secondaryBackground,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4.0,
                    color: Color(0x1A000000),
                    offset: Offset(0.0, 2.0),
                  )
                ],
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Escolha uma categoria',
                    style: AppTheme.titleLarge.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Converta rapidamente entre diferentes unidades de medida',
                    style: AppTheme.bodyMedium.copyWith(
                      color: AppTheme.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: _categories.length,
                  itemBuilder: (context, index) {
                    final category = _categories[index];
                    return _buildCategoryCard(category);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(Map<String, dynamic> category) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          'converter',
          queryParameters: {
            'categoryId': category['id'],
            'categoryTitle': category['title'],
            'units': (category['units'] as List<String>).join(','),
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: const [
            BoxShadow(
              blurRadius: 8.0,
              color: Color(0x1A000000),
              offset: Offset(0.0, 4.0),
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 64.0,
              height: 64.0,
              decoration: BoxDecoration(
                color: (category['color'] as Color).withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                category['icon'] as IconData,
                color: category['color'] as Color,
                size: 32.0,
              ),
            ),
            const SizedBox(height: 12.0),
            Text(
              category['title'] as String,
              textAlign: TextAlign.center,
              style: AppTheme.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
