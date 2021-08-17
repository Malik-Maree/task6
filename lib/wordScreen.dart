import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'word.dart';
import 'package:intl/intl.dart';
import 'bottomWidget.dart';

class WordListScreen extends StatefulWidget{

  @override
  _WordListScreenState createState() => _WordListScreenState();
}

class _WordListScreenState extends State<WordListScreen> {

  @override
  Widget build(BuildContext context) {

 void openSheet(){
  showModalBottomSheet(context: context, builder: (ctx) {
    return BottomSheetWidget();
  });
}


 final List<Word> _words = Provider.of<Words>(context).words;

    return Scaffold(
      appBar: AppBar(
        title: Text('App 5'),
        
      ),
      body: 
       _words.length==0?
       Center(
         child: Image.asset('assets/notavimgae.jpg'),
       ):
      ListView.builder(
        itemCount: _words.length,
        itemBuilder: (ctx,index){
          return ListTile(
            leading: CircleAvatar(
              child: FittedBox(child: Text(_words[index].id),),
            ),
            title: Text(_words[index].engWord),
            subtitle: Text('${_words[index].arbWord} ${DateFormat.yMMMEd().format(_words[index].date)}'),
            
            trailing: IconButton(
              onPressed: (){
              Provider.of<Words>(context,listen:false).removeWord(_words[index].id);
                //print(wordList.length);
              },
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
              )
            ),
          );
        },
        
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: openSheet,
          child: Icon(Icons.add),
          ),
    );

  }
}