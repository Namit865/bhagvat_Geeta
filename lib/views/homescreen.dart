import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jsondecode/provider/lanuguage.dart';
import 'package:provider/provider.dart';
import '../model/bhagvat.dart';
import 'detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bhagvat> allverse = [];
  bool isTranslatePressed = false;
  bool isThemePressed = false;

  @override
  void initState() {
    super.initState();
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
      image: e['image'],
    ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Provider.of<lanugageProvider>(context, listen: false)
                      .languageToggle();
                  setState(() {
                    isTranslatePressed =
                    !Provider.of<lanugageProvider>(context, listen: false)
                        .language
                        .ishindi;
                  });
                },
                icon: Icon(
                  Icons.translate_outlined,
                  color: isTranslatePressed ? Colors.orange : Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  Provider.of<lanugageProvider>(context, listen: false)
                      .themeToggle();
                  setState(() {
                    isThemePressed =
                        Provider.of<lanugageProvider>(context, listen: false)
                            .language
                            .isdark;
                  });
                },
                icon: Icon(
                  isThemePressed ? Icons.light_mode : Icons.dark_mode,
                  color: isThemePressed ? Colors.orange : Colors.black,
                ),
              ),
            ],
            backgroundColor: Colors.orange,
            expandedHeight: 200,
            pinned: true,
            floating: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/3.jpg',
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: Container(
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.bottomLeft,
                child: const Text(
                  "Bhagavad Gita",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                bhagvat e = allverse[index];
                return Card(
                  color: Colors.orange,
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ListTile(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => More(bhagvad: e),
                      ),
                    ),
                    title: Text(
                      "Chapter - ${e.chapter_number}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    subtitle: (Provider.of<lanugageProvider>(context)
                        .language
                        .ishindi ==
                        false)
                        ? Text(
                      "Chapter Name - ${e.name}",
                      style: const TextStyle(color: Colors.white),
                    )
                        : Text(
                      "Chapter Name - ${e.name_hindi}",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
              childCount: allverse.length,
            ),
          ),
        ],
      ),
    );
  }
}
