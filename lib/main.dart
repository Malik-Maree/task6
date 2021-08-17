import 'package:flutter/material.dart';
import 'word.dart';
import 'package:intl/intl.dart';
import 'wordScreen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{


@override
  Widget build(BuildContext context) {
   return ChangeNotifierProvider.value(value: Words(),
     child: MaterialApp(
       home: WordListScreen() ,
     ),
   );

  }
}






