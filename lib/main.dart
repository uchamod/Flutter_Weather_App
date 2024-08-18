import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:whether_app/pages/homepage.dart';
import 'package:whether_app/provider/provider.dart';

void main() async {
  //initilize api key
  await dotenv.load(fileName: ".env");
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
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
      title: "Flutter wether app",
      theme: Provider.of<ThemeProvider>(context).getTheme,
      home: const Homepage(),
    );
  }
}
