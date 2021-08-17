import 'package:app61/word.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'wordScreen.dart';

class BottomSheetWidget extends StatefulWidget{
 
 // final Function (String id, String engWord, String arbWord, DateTime date) addNewWord;
  const BottomSheetWidget({Key?key}): super(key:key);
 
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {

 var idController = TextEditingController();
 var engWordController = TextEditingController();
 var arbWordController = TextEditingController();

  DateTime? selectedDate;
   void datePicker(){
     showDatePicker(context: context,
      initialDate: DateTime.now(),
       firstDate: DateTime(2000), 
       lastDate: DateTime.now()).then((value) {
    setState(() {
         selectedDate= value  ;
    });
         });
   }
      

  @override
  
  
  Widget build(BuildContext context) {
   
   


   return Container(
   child: Column(
     children: [

     TextField(
         controller: idController,
          decoration: InputDecoration(
     
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.purpleAccent, width: 2)
    ),
    labelText: 'Id',
    
    
  ),
  keyboardType: TextInputType.number,
       ),


       TextField(
         controller: engWordController,
          decoration: InputDecoration(
    
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.purpleAccent, width: 2)
    ),
    labelText: 'Enter English word',
    
    
  ),
       ),
       
      
     
       TextField(
         controller: arbWordController,
          decoration: InputDecoration(
    
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.purpleAccent, width: 2)
    ),
    labelText: 'Enter Arabic word',
    
    
  ),
       ),

    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(selectedDate == null? 'No Date Selected' 
        : '${DateFormat.yMMMd().format(selectedDate!)}'),
        TextButton(onPressed: datePicker,
         child: Text("chose Date"))
      ],
    ),

    ElevatedButton(
      onPressed: (){
        Navigator.pop(context);
        Provider.of<Words>(context,listen: false).addNewWord(
          idController.text,
          engWordController.text,
          arbWordController.text,
          selectedDate!
        );
      },
       child: Text("Add word"))
     ],
   ),
   );

  }
}