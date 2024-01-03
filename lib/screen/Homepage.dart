import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/Database/todo_Database.dart';

import '../widgets/dialog_box.dart';
import '../widgets/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//reference the box
final _myBox=Hive.box('myBox');

  final _conroller = TextEditingController();
  ToDoDatabase db=ToDoDatabase();

  //when the app first runs,init state should implemented

  @override
  void initState() {
    //if this first time ever opening of app,create default data
if(_myBox.get('TODOLIST')==null){
  db.createInitialData();
}else{
  db.loadData();
}
    super.initState();
  }

  //checkbox tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
     db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDataBase();
  }

//save  Newtask Button
  void saveNewTask() {
    setState(() {
     db.todoList.add([_conroller.text, false]);
      _conroller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }
//cancel Newtask button

  void cacelNewTask() {
    Navigator.of(context).pop();
  }

  //creating new task

  void createNewTask() {
    showDialog(
        context: context,
        builder: (ctx) => DialogBox(
              textController: _conroller,
              onsave: saveNewTask,
              oncancel: cacelNewTask,
            ));
  }

  void deleteTask(int index) {
   setState(() {
     db.todoList.removeAt(index);
   });
   db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[200],
        appBar: AppBar(
          title: Center(
            child: Text(
              "TO DO",
            ),
          ),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
             onPressed: createNewTask
             ),
        body: ListView.builder(
            itemCount: db.todoList.length,
            itemBuilder: (ctx, index) => ToDoTile(
                  taskName: db.todoList[index][0],
                  taskCompleted:db.todoList[index][1],
                  onchanged: (value) => checkBoxChanged(value, index),
                  deleteFunction: (ctx)=>deleteTask(index),
                )));
  }
}
