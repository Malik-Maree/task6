import 'package:flutter/foundation.dart';

class Word{
  String id;
  String  engWord;
  String arbWord;
 DateTime date;
Word(this.id, this.engWord, this.arbWord, this.date);
}
class Words with ChangeNotifier {
  List <Word> _words =[
  Word('1','play','يلعب',DateTime.now()),
  Word('2','play','يلعب',DateTime.now()),
  Word('3','play','يلعب',DateTime.now()),
];

List <Word> get words => [..._words];

void addNewWord(String id, String engWord, String arbWord, DateTime date){
    
  _words.add(Word(id, engWord, arbWord, date));
notifyListeners();
}

void removeWord(String id){
 _words.removeWhere((element) => element.id == id);
notifyListeners();
}




}