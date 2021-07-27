import 'package:admin/screens/pages/404.dart';
import 'package:admin/screens/pages/dashboard_page.dart';
import 'package:admin/screens/pages/deposit_page.dart';
import 'package:admin/screens/pages/investment_page.dart';
import 'package:admin/screens/pages/message_page.dart';
import 'package:admin/screens/pages/profile_page.dart';
import 'package:admin/screens/pages/referral_page.dart';
import 'package:admin/screens/pages/settings_page.dart';
import 'package:admin/screens/pages/transaction_page.dart';
import 'package:admin/screens/pages/withdraw_page.dart';
import 'package:fluro/fluro.dart' as route;
import 'package:flutter/material.dart';

class FluroRouter {
  static final router = route.FluroRouter();
  //Dashboard
  static route.Handler _dashHandler = route.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return DashboardPage();
  });

  //profile Page
  static route.Handler _profileHandler = route.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return ProfilePage();
  });

  //Transaction
  static route.Handler transactionHandler = route.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return TransactionPage();
  });

  //White Paper
  static route.Handler _investmentsHandler = route.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return InvestmentPage();
  });

  //Withdraw
  static route.Handler _withdrawHandler = route.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return WithdrawPage();
  });

  //Withdraw
  static route.Handler _depositHandler = route.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    String address = params['address']?.first;
    String amount = params['amount']?.first;
    String cryptoprice = params['cryptoprice']?.first;
    String currency = params['currency']?.first;
    String orderRef = params['orderRef']?.first;
    String unit = params['unit']?.first;
    return DepositPage(
      address: address,
      amount: amount,
      cryptoprice: cryptoprice,
      currency: currency,
      orderRef: orderRef,
      unit: unit,
    );
  });

  //Privacy
  static route.Handler _settingsHandler = route.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return SettingsPage();
  });

  //Terms
  static route.Handler _referralHandler = route.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return ReferralPage();
  });

  //Faqs
  static route.Handler _messageHandler = route.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) {
    return MessagePage();
  });

  //NotFound
  static route.Handler _notFoundHandler = route.Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          NotFoundPage());

  static void setupRouter() {
    // Home
    router.define(
      '/',
      handler: _dashHandler,
      transitionType: route.TransitionType.fadeIn,
    );

    // Login
    router.define(
      '/profile',
      handler: _profileHandler,
      transitionType: route.TransitionType.fadeIn,
    );
    router.define(
      '/profile/',
      handler: _profileHandler,
      transitionType: route.TransitionType.fadeIn,
    );

    // Vendors
    router.define(
      '/transaction',
      handler: transactionHandler,
      transitionType: route.TransitionType.fadeIn,
    );
    router.define(
      '/transaction/',
      handler: transactionHandler,
      transitionType: route.TransitionType.fadeIn,
    );

    // WhitePaper
    router.define(
      '/investments',
      handler: _investmentsHandler,
      transitionType: route.TransitionType.fadeIn,
    );
    router.define(
      '/investments/',
      handler: _investmentsHandler,
      transitionType: route.TransitionType.fadeIn,
    );

    // Withdraw
    router.define(
      '/withdraw',
      handler: _withdrawHandler,
      transitionType: route.TransitionType.fadeIn,
    );
    router.define(
      '/withdraw/',
      handler: _withdrawHandler,
      transitionType: route.TransitionType.fadeIn,
    );

    // Deposit
    // router.define(
    //   '/deposit',
    //   handler: _depositHandler,
    //   transitionType: route.TransitionType.fadeIn,
    // );
    router.define(
      '/deposit/:address/:amount/:cryptoprice/:currency/:orderRef/:unit',
      handler: _depositHandler,
      transitionType: route.TransitionType.fadeIn,
    );
    //     String address = params['address']?.first;
    // String amount = params['amount']?.first;
    // String cryptoprice = params['cryptoprice']?.first;
    // String currency = params['currency']?.first;
    // String orderRef = params['orderRef']?.first;
    // String unit = params['unit']?.first;

    // Privacy
    router.define(
      '/settings',
      handler: _settingsHandler,
      transitionType: route.TransitionType.fadeIn,
    );
    router.define(
      '/settings/',
      handler: _settingsHandler,
      transitionType: route.TransitionType.fadeIn,
    );

    // Terms
    router.define(
      '/referral',
      handler: _referralHandler,
      transitionType: route.TransitionType.fadeIn,
    );
    router.define(
      '/referral/',
      handler: _referralHandler,
      transitionType: route.TransitionType.fadeIn,
    );

    // Contact
    router.define(
      '/contact',
      handler: _messageHandler,
      transitionType: route.TransitionType.fadeIn,
    );
    router.define(
      '/contact/',
      handler: _messageHandler,
      transitionType: route.TransitionType.fadeIn,
    );

    // Not Found
    router.define(
      '404',
      handler: _notFoundHandler,
      transitionType: route.TransitionType.fadeIn,
    );
  }
}
