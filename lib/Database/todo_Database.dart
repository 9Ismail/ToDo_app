import 'package:hive/hive.dart';

class ToDoDatabase{
List todoList=[];

//reference the database

final _myBox=Hive.box('myBox');

//run this method if it is first time ever opening of app
void createInitialData(){
    todoList=[
      ['Make Tutorial',false],
      ['Do Exercise',false],
    ];
}

//load the data from database 
void loadData(){
  todoList=_myBox.get('TODOLIST');
}

//update the database 
void updateDataBase(){
todoList=_myBox.put('TODOLIST',todoList) as List;
}




}