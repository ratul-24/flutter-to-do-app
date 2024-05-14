import 'package:hive_flutter/hive_flutter.dart';

class Database{
  List toDoList=[];
  final _mybox=Hive.box("mybox"); 
  void createInitaialData(){
    toDoList=[
      ["Do exercise",false],
      ["Drink water",false],
    ];
  }
  void loadData(){
    toDoList = _mybox.get("TODOLIST");
  }
  void updataData(){
    _mybox.put("TODOLIST", toDoList);
  }
}