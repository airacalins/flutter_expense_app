// ignore_for_file: prefer_const_constructors, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_page/home_page.dart';

void main() => {
  WidgetsFlutterBinding.ensureInitialized(),
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]),
  runApp(MyApp())
};

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
            titleSmall: TextStyle(
              fontFamily: 'Opensans',
              fontWeight: FontWeight.bold,
              fontSize: 18)),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light()
                .textTheme
                .copyWith(headline6: TextStyle(fontFamily: 'Opensans')),
          )),
      home: HomePage(),
    );
  }
}