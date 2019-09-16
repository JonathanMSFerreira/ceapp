import 'package:ceapp/ui/NewCePage.dart';
import 'package:ceapp/ui/NovoCicloPage.dart';
import 'package:flutter/material.dart';
import 'package:ceapp/ui/CeAppPage.dart';
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
      theme: ThemeData(


        backgroundColor: Colors.white,
        primaryColor: Colors.white,
      ),
      home: CeAppPage(),
    );
  }
}
