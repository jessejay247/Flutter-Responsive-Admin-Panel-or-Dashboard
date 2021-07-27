import 'package:flutter/material.dart';

class MenuController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _dashKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _transactionKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _investmentKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _profileKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _contactKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _withdrawKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _referralKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _settingsKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get dashKey => _dashKey;
  GlobalKey<ScaffoldState> get transactionKey => _transactionKey;
  GlobalKey<ScaffoldState> get investmentKey => _investmentKey;
  GlobalKey<ScaffoldState> get profileKey => _profileKey;
  GlobalKey<ScaffoldState> get contactKey => _contactKey;
  GlobalKey<ScaffoldState> get withdrawKey => _withdrawKey;
  GlobalKey<ScaffoldState> get referralKey => _referralKey;
  GlobalKey<ScaffoldState> get settingsKey => _settingsKey;

  void controlMenu() {
    if (_dashKey.currentState.isDrawerOpen) {
      _dashKey.currentState.openDrawer();
    }
  }
}
