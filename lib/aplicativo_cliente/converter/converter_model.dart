import 'package:flutter/material.dart';
import '/app/utils.dart';
import 'converter_widget.dart';

class ConverterModel extends AppModel<ConverterWidget> {
  TextEditingController? inputController;
  
  String? fromUnit;
  String? toUnit;
  
  String result = '0';

  @override
  void initState(BuildContext context) {
    inputController = TextEditingController();
  }

  @override
  void dispose() {
    inputController?.dispose();
    super.dispose();
  }
}
