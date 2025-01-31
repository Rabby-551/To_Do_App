import 'package:flutter/material.dart';
import 'package:to_do_app/screens/task_list_screen.dart';

void main (){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manger',
      theme: ThemeData(
        primaryColor:Colors.blue,
      ),
      home:const TaskListScreen(),
    );
  }
}
