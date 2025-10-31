import 'package:flutter/material.dart';

// Safe setState wrapper
extension SafeSetState on State {
  void safeSetState(VoidCallback fn) {
    if (mounted) {
      // ignore: invalid_use_of_protected_member
      setState(fn);
    }
  }
}

// Model base class
abstract class AppModel<T extends StatefulWidget> extends ChangeNotifier {
  void initState(BuildContext context);
  void dispose();
}

// Create model helper
T createModel<T extends AppModel>(BuildContext context, T Function() create) {
  final model = create();
  model.initState(context);
  return model;
}

// Responsive visibility helper
bool responsiveVisibility({
  required BuildContext context,
  bool phone = true,
  bool tablet = true,
  bool tabletLandscape = true,
  bool desktop = true,
}) {
  final width = MediaQuery.sizeOf(context).width;
  if (width < 479) {
    return phone;
  } else if (width < 767) {
    return tablet;
  } else if (width < 991) {
    return tabletLandscape;
  } else {
    return desktop;
  }
}

// Platform check
bool get isWeb => identical(0, 0.0);

