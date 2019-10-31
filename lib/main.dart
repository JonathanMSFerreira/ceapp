import 'package:ceapp/ui/estatisticas_page.dart';
import 'package:ceapp/ui/cronograma_page.dart';
import 'package:ceapp/ui/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Cronograma de Estudos',

      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,  ],
      supportedLocales: [
        const Locale('pt', 'BR'), ],
      darkTheme: ThemeData(

        backgroundColor: Colors.white,
        primaryColor: Colors.white,

      ),

      home: SplashPage(),

    );
  }
}
