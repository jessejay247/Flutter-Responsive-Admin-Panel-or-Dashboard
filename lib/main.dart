import 'package:admin/helpers/constants.dart';
import 'package:admin/controllers/MenuController.dart';
import 'package:admin/helpers/routers.dart';
import 'package:admin/screens/pages/404.dart';
import 'package:admin/screens/pages/dashboard_page.dart';
import 'package:admin/screens/pages/registration_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  FluroRouter.setupRouter();
  setPathUrlStrategy();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
      initialRoute: '/',
      onGenerateRoute: FluroRouter.router.generator,
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => NotFoundPage(),
      ),
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      // theme: ThemeData.light().copyWith(
      //   primaryColor: primaryColor,
      //   scaffoldBackgroundColor: bgColor,
      //   textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
      //       .apply(bodyColor: Colors.black),
      //   canvasColor: secondaryColor,
      // ),
      home: RegistrationPage(),
    );
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(
    //       create: (context) => MenuController(),
    //     ),
    //   ],
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Flutter Admin Panel',
    //     initialRoute: '/',
    //     onGenerateRoute: FluroRouter.router.generator,
    //     onUnknownRoute: (settings) => MaterialPageRoute(
    //       builder: (context) => NotFoundPage(),
    //     ),
    //     theme: ThemeData.dark().copyWith(
    //       scaffoldBackgroundColor: bgColor,
    //       textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
    //           .apply(bodyColor: Colors.white),
    //       canvasColor: secondaryColor,
    //     ),
    //     home: DashboardPage(),
    //   ),
    // );
  }
}
