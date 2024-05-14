import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/db.dart';
import 'package:to_do_app/pages/dialog_box.dart';
import 'package:to_do_app/pages/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox=Hive.box("mybox");
  final _controller=TextEditingController();
  Database db=Database();
  @override
  void initState() {
    if(_mybox.get("TODOLIST")==null){
      db.createInitaialData();
    } else{
      db.loadData();
    }
    super.initState();
  }
  void changeStatus(bool? value,int index){
    setState(() {
      db.toDoList[index][1] =! db.toDoList[index][1];
    });
    db.updataData();
  }
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updataData();
  }
  void saveTask(){
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updataData();  
  }
  void createTask(){
    showDialog(
      context: context, 
      builder: (context){
        return DialogBox(
          onSave: saveTask,
          onCancel: ()=> Navigator.of(context).pop(),
          myController: _controller,
        );
      },
      );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
        title: const Text('TO DO APP'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index)  {
          return ToDoTile(
            taskName: db.toDoList[index][0], 
            taskStatus: db.toDoList[index][1], 
            onChanged: (value)=> changeStatus(value,index),
            onDelete: () => deleteTask(index) ,
            );
        }),

      );
  }
}