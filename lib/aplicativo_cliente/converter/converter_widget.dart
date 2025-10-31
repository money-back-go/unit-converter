import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/app/theme.dart';
import '/app/utils.dart';
import '/app/widgets.dart';
import 'converter_model.dart';
export 'converter_model.dart';

class ConverterWidget extends StatefulWidget {
  const ConverterWidget({
    Key? key,
    required this.categoryId,
    required this.categoryTitle,
    required this.units,
  }) : super(key: key);

  final String categoryId;
  final String categoryTitle;
  final String units;

  static String routeName = 'converter';
  static String routePath = 'converter';

  @override
  _ConverterWidgetState createState() => _ConverterWidgetState();
}

class _ConverterWidgetState extends State<ConverterWidget> {
  late ConverterModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  
  List<String> unitList = [];
  
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ConverterModel());
    
    // Parsear lista de unidades
    unitList = widget.units.split(',');
    
    // Inicializar unidades padrão
    if (unitList.length >= 2) {
      _model.fromUnit = unitList[0];
      _model.toUnit = unitList[1];
    }
    
    _model.inputController?.addListener(_calculateConversion);
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  // Função principal de conversão
  void _calculateConversion() {
    final inputText = _model.inputController?.text ?? '';
    if (inputText.isEmpty) {
      setState(() {
        _model.result = '0';
      });
      return;
    }

    final inputValue = double.tryParse(inputText.replaceAll(',', '.'));
    if (inputValue == null) {
      setState(() {
        _model.result = 'Valor inválido';
      });
      return;
    }

    double result = 0.0;
    
    switch (widget.categoryId) {
      case 'comprimento':
        result = _convertLength(inputValue, _model.fromUnit!, _model.toUnit!);
        break;
      case 'peso':
        result = _convertWeight(inputValue, _model.fromUnit!, _model.toUnit!);
        break;
      case 'temperatura':
        result = _convertTemperature(inputValue, _model.fromUnit!, _model.toUnit!);
        break;
      case 'volume':
        result = _convertVolume(inputValue, _model.fromUnit!, _model.toUnit!);
        break;
      case 'area':
        result = _convertArea(inputValue, _model.fromUnit!, _model.toUnit!);
        break;
      case 'velocidade':
        result = _convertSpeed(inputValue, _model.fromUnit!, _model.toUnit!);
        break;
      case 'tempo':
        result = _convertTime(inputValue, _model.fromUnit!, _model.toUnit!);
        break;
      case 'dados':
        result = _convertData(inputValue, _model.fromUnit!, _model.toUnit!);
        break;
    }

    setState(() {
      _model.result = _formatResult(result);
    });
  }

  String _formatResult(double value) {
    if (value.abs() >= 1000000) {
      return value.toStringAsExponential(4);
    } else if (value.abs() < 0.0001 && value != 0) {
      return value.toStringAsExponential(4);
    } else {
      String formatted = value.toStringAsFixed(6);
      formatted = formatted.replaceAll(RegExp(r'\.?0+$'), '');
      return formatted;
    }
  }

  // COMPRIMENTO
  double _convertLength(double value, String from, String to) {
    // Converter para metros primeiro
    double meters = 0;
    switch (from) {
      case 'Metro': meters = value; break;
      case 'Quilômetro': meters = value * 1000; break;
      case 'Centímetro': meters = value / 100; break;
      case 'Milímetro': meters = value / 1000; break;
      case 'Milha': meters = value * 1609.34; break;
      case 'Pé': meters = value * 0.3048; break;
      case 'Polegada': meters = value * 0.0254; break;
    }
    
    // Converter de metros para unidade destino
    switch (to) {
      case 'Metro': return meters;
      case 'Quilômetro': return meters / 1000;
      case 'Centímetro': return meters * 100;
      case 'Milímetro': return meters * 1000;
      case 'Milha': return meters / 1609.34;
      case 'Pé': return meters / 0.3048;
      case 'Polegada': return meters / 0.0254;
      default: return 0;
    }
  }

  // PESO
  double _convertWeight(double value, String from, String to) {
    double kg = 0;
    switch (from) {
      case 'Quilograma': kg = value; break;
      case 'Grama': kg = value / 1000; break;
      case 'Miligrama': kg = value / 1000000; break;
      case 'Tonelada': kg = value * 1000; break;
      case 'Libra': kg = value * 0.453592; break;
      case 'Onça': kg = value * 0.0283495; break;
    }
    
    switch (to) {
      case 'Quilograma': return kg;
      case 'Grama': return kg * 1000;
      case 'Miligrama': return kg * 1000000;
      case 'Tonelada': return kg / 1000;
      case 'Libra': return kg / 0.453592;
      case 'Onça': return kg / 0.0283495;
      default: return 0;
    }
  }

  // TEMPERATURA
  double _convertTemperature(double value, String from, String to) {
    // Converter para Celsius primeiro
    double celsius = 0;
    switch (from) {
      case 'Celsius': celsius = value; break;
      case 'Fahrenheit': celsius = (value - 32) * 5 / 9; break;
      case 'Kelvin': celsius = value - 273.15; break;
    }
    
    switch (to) {
      case 'Celsius': return celsius;
      case 'Fahrenheit': return celsius * 9 / 5 + 32;
      case 'Kelvin': return celsius + 273.15;
      default: return 0;
    }
  }

  // VOLUME
  double _convertVolume(double value, String from, String to) {
    double liters = 0;
    switch (from) {
      case 'Litro': liters = value; break;
      case 'Mililitro': liters = value / 1000; break;
      case 'Metro Cúbico': liters = value * 1000; break;
      case 'Galão': liters = value * 3.78541; break;
      case 'Xícara': liters = value * 0.24; break;
    }
    
    switch (to) {
      case 'Litro': return liters;
      case 'Mililitro': return liters * 1000;
      case 'Metro Cúbico': return liters / 1000;
      case 'Galão': return liters / 3.78541;
      case 'Xícara': return liters / 0.24;
      default: return 0;
    }
  }

  // ÁREA
  double _convertArea(double value, String from, String to) {
    double m2 = 0;
    switch (from) {
      case 'Metro Quadrado': m2 = value; break;
      case 'Quilômetro Quadrado': m2 = value * 1000000; break;
      case 'Hectare': m2 = value * 10000; break;
      case 'Acre': m2 = value * 4046.86; break;
      case 'Pé Quadrado': m2 = value * 0.092903; break;
    }
    
    switch (to) {
      case 'Metro Quadrado': return m2;
      case 'Quilômetro Quadrado': return m2 / 1000000;
      case 'Hectare': return m2 / 10000;
      case 'Acre': return m2 / 4046.86;
      case 'Pé Quadrado': return m2 / 0.092903;
      default: return 0;
    }
  }

  // VELOCIDADE
  double _convertSpeed(double value, String from, String to) {
    double ms = 0;
    switch (from) {
      case 'Km/h': ms = value / 3.6; break;
      case 'M/s': ms = value; break;
      case 'Milha/h': ms = value * 0.44704; break;
      case 'Nó': ms = value * 0.514444; break;
    }
    
    switch (to) {
      case 'Km/h': return ms * 3.6;
      case 'M/s': return ms;
      case 'Milha/h': return ms / 0.44704;
      case 'Nó': return ms / 0.514444;
      default: return 0;
    }
  }

  // TEMPO
  double _convertTime(double value, String from, String to) {
    double seconds = 0;
    switch (from) {
      case 'Segundo': seconds = value; break;
      case 'Minuto': seconds = value * 60; break;
      case 'Hora': seconds = value * 3600; break;
      case 'Dia': seconds = value * 86400; break;
      case 'Semana': seconds = value * 604800; break;
      case 'Mês': seconds = value * 2592000; break;
      case 'Ano': seconds = value * 31536000; break;
    }
    
    switch (to) {
      case 'Segundo': return seconds;
      case 'Minuto': return seconds / 60;
      case 'Hora': return seconds / 3600;
      case 'Dia': return seconds / 86400;
      case 'Semana': return seconds / 604800;
      case 'Mês': return seconds / 2592000;
      case 'Ano': return seconds / 31536000;
      default: return 0;
    }
  }

  // DADOS DIGITAIS
  double _convertData(double value, String from, String to) {
    double bytes = 0;
    switch (from) {
      case 'Byte': bytes = value; break;
      case 'Kilobyte': bytes = value * 1024; break;
      case 'Megabyte': bytes = value * 1048576; break;
      case 'Gigabyte': bytes = value * 1073741824; break;
      case 'Terabyte': bytes = value * 1099511627776; break;
    }
    
    switch (to) {
      case 'Byte': return bytes;
      case 'Kilobyte': return bytes / 1024;
      case 'Megabyte': return bytes / 1048576;
      case 'Gigabyte': return bytes / 1073741824;
      case 'Terabyte': return bytes / 1099511627776;
      default: return 0;
    }
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
          widget.categoryTitle,
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
                // Campo de entrada
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
                      Text(
                        'De:',
                        style: AppTheme.labelMedium,
                      ),
                      SizedBox(height: 8.0),
                      DropdownButtonFormField<String>(
                        initialValue: _model.fromUnit,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: AppTheme.primaryBackground,
                        ),
                        items: unitList.map((unit) {
                          return DropdownMenuItem(
                            value: unit,
                            child: Text(unit),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _model.fromUnit = value;
                            _calculateConversion();
                          });
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextField(
                        controller: _model.inputController,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration: InputDecoration(
                          labelText: 'Valor',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: AppTheme.primaryBackground,
                        ),
                        style: AppTheme.titleLarge,
                      ),
                    ],
                  ),
                ),

                // Ícone de conversão
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Icon(
                      Icons.swap_vert,
                      size: 40.0,
                      color: AppTheme.primary,
                    ),
                  ),
                ),

                // Campo de resultado
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
                      Text(
                        'Para:',
                        style: AppTheme.labelMedium,
                      ),
                      SizedBox(height: 8.0),
                      DropdownButtonFormField<String>(
                        initialValue: _model.toUnit,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          filled: true,
                          fillColor: AppTheme.primaryBackground,
                        ),
                        items: unitList.map((unit) {
                          return DropdownMenuItem(
                            value: unit,
                            child: Text(unit),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _model.toUnit = value;
                            _calculateConversion();
                          });
                        },
                      ),
                      SizedBox(height: 16.0),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: AppTheme.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: AppTheme.primary,
                            width: 2.0,
                          ),
                        ),
                        child: Text(
                          _model.result,
                          style: AppTheme.displaySmall.copyWith(
                                color: AppTheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24.0),

                // Botão limpar
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        _model.inputController?.clear();
                        _model.result = '0';
                      });
                    },
                    icon: Icon(Icons.clear),
                    label: Text('Limpar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.secondaryText,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

