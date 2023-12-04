import 'package:flutter/cupertino.dart';
import 'package:jsondecode/model/language.dart';

class lanugageProvider extends ChangeNotifier{
  lang language = lang(ishindi: false);

  languageToggle(){
    language.ishindi =! language.ishindi;
    notifyListeners();
  }
}