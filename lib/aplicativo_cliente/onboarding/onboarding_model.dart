import 'package:flutter/material.dart';
import '/app/utils.dart';
import 'onboarding_widget.dart';

class OnboardingModel extends AppModel<OnboardingWidget> {
  final unfocusNode = FocusNode();
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    super.dispose();
  }
}
