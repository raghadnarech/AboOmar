import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:supplier/Constant/colors.dart';
import 'package:supplier/Controller/ListProvider.dart';
// import 'package:supplier/View/ChooseService/ChooseService.dart';
// import 'package:supplier/View/ChooseService/Controller/ChooseServicesController.dart';
import 'package:supplier/View/Splash/Controller/SplashController.dart';
import 'package:supplier/View/Splash/Splash.dart';
import 'package:supplier/l10n/app_localizations.dart';
import 'package:supplier/l10n/l10n.dart';

void main() {
  runApp(
    MultiProvider(
      providers: listproviders,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gas Supplier',
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
      home: ChangeNotifierProvider(
        create: (context) => SplashController(),
        builder: (context, child) => Splash(),
      ),
      builder: (context, child) {
        EasyLoading.instance
          ..displayDuration = const Duration(seconds: 3)
          ..indicatorType = EasyLoadingIndicatorType.fadingCircle
          ..loadingStyle = EasyLoadingStyle.custom
          ..indicatorSize = 45.0
          ..radius = 15.0
          ..maskType = EasyLoadingMaskType.black
          ..progressColor = kPrimaryColor
          ..backgroundColor = kBaseColor
          ..indicatorColor = kPrimaryColor
          ..textColor = kPrimaryColor
          ..maskColor = Colors.black
          ..userInteractions = false
          ..animationStyle = EasyLoadingAnimationStyle.opacity
          ..dismissOnTap = false;
        return FlutterEasyLoading(child: child);
      },
    );
  }
}
