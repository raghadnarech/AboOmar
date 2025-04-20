import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gas_manager_mandob/Constant/colors.dart';
import 'package:gas_manager_mandob/Controller/CartController.dart';
import 'package:gas_manager_mandob/View/Splash/Splash.dart';
import 'package:gas_manager_mandob/l10n/app_localizations.dart';
import 'package:gas_manager_mandob/l10n/l10n.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<CartController>(
      create: (context) => CartController(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gas Mandob',
      theme: ThemeData(
        fontFamily: 'Cairo',
        primaryColor: kBaseColor,
        scaffoldBackgroundColor: kBaseColor,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => kPrimaryColor),
          ),
        ),
        iconTheme: IconThemeData(
          color: kPrimaryColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: kPrimaryColor,
        ),
        useMaterial3: false,
        colorScheme: ColorScheme.light(
          primary: kPrimaryColor,
          secondary: kSecendryColor,
        ).copyWith(background: kBaseColor),
      ),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      locale: Locale('ar'),
      home: Splash(),
    );
  }
}
