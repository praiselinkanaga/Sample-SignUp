import 'package:flutter/material.dart';
import 'package:signup/model/getGenresModel.dart';
import 'package:signup/provider/genresProvider.dart';
import 'package:signup/provider/genresService.dart';
import 'package:signup/styles.dart';
import 'package:provider/provider.dart';
import 'home.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => GenresProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Poppins",
          scaffoldBackgroundColor: const Color(0xFF000d1a)),
      home: const MyHomePage(),
    );
  }
}
