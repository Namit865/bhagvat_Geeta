import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jsondecode/provider/lanuguage.dart';
import 'package:provider/provider.dart';

import '../model/bhagvat.dart';
import 'detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bhagvat> allverse = [];

  @override
  void initState() {
    super.initState();
    // Timer(
    //   const Duration(seconds: 1),
    //   () {
    //     loadbhagvatgeeta().then(
    //       (value) => print(data),
    //     );
    //   },
    // );
    loadbhagvatgeeta().then((value) {
      setState(() {});
    });
  }

  Future<void> loadbhagvatgeeta() async {
    String jsonString = await rootBundle.loadString('assets/verse.json');

    Map res = jsonDecode(jsonString);
    List verses = res['Verse'];

    allverse = verses
        .map((e) => bhagvat(
            chapter_number: e['chapter_number'],
            chapter_summary: e['chapter_summary'],
            chapter_summary_hindi: e['chapter_summary_hindi'],
            id: e['id'],
            name: e['image_name'],
            name_hindi: e['name'],
            verses_count: e['verses_count'],
            image: e['image']))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bhagvat Gita"),
      ),
      body: ListView(
        children: allverse
            .map(
              (e) => Card(
                child: ListTile(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => more(bhagvat: e),
                    ),
                  ),
                  title: Text(
                    "Chapter - ${e.chapter_number}",
                  ),
                  subtitle: (Provider.of<lanugageProvider>(context)
                              .language
                              .ishindi ==
                          false)
                      ? Text("Chapter Name - ${e.name}")
                      : Text("chapter Name - ${e.name_hindi}"),
                  trailing: const Icon(Icons.keyboard_arrow_right),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
