import 'package:flutter/material.dart';
import 'package:jsondecode/provider/lanuguage.dart';
import 'package:jsondecode/views/splashscreen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => lanugageProvider(),builder: (context, child) =>
       MaterialApp(
        theme: Provider.of<lanugageProvider>(context).language.isdark == false
            ? ThemeData.light()
            : ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}
