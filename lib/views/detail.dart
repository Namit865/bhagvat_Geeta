import 'package:flutter/material.dart';
import 'package:jsondecode/model/bhagvat.dart';
import 'package:jsondecode/provider/lanuguage.dart';
import 'package:provider/provider.dart';

class More extends StatefulWidget {
  More({Key? key, required this.bhagvad}) : super(key: key);

  final bhagvat bhagvad;

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<lanugageProvider>(context, listen: false)
                  .languageToggle();
              (Provider.of<lanugageProvider>(context).language.ishindi == false)
                  ? const Text("Change Language To Hindi")
                  : const Text("Change Language To English");
            },
            icon: const Icon(Icons.translate_outlined),
          ),
          IconButton(
            onPressed: () {
              Provider.of<lanugageProvider>(context, listen: false)
                  .themeToggle();
            },
            icon: (Provider.of<lanugageProvider>(context).language.isdark ==
                    false)
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
          )
        ],
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text(
          Provider.of<lanugageProvider>(context).language.ishindi
              ? widget.bhagvad.name_hindi
              : widget.bhagvad.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Image.asset(widget.bhagvad.image),
              const SizedBox(
                height: 20,
              ),
              Provider.of<lanugageProvider>(context).language.ishindi ==
                      false
                  ? Text(
                      widget.bhagvad.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  : Text(
                      widget.bhagvad.name_hindi,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
              const SizedBox(
                height: 10,
              ),
              (Provider.of<lanugageProvider>(context).language.ishindi ==
                      false)
                  ? Text(widget.bhagvad.chapter_summary)
                  : Text(widget.bhagvad.chapter_summary_hindi)
            ],
          ),
        ),
      ),
    );
  }
}
