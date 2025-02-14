import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/provider/task_provider.dart';
import 'package:to_do_app/screens/add_new_task_screen.dart';
import 'package:to_do_app/screens/edit_task_screen.dart';

import '../widgets/go_pro_widget.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.15),
        child: AppBar(
          backgroundColor: const Color(0xff3556AB),
          elevation: 0,
          flexibleSpace: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: size.height * 0.02,
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/Profile.png',
                      fit: BoxFit.cover,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, Raziul Islam Rabby',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Color(0xff000000),
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'rabby.raziul@gmail.com',
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 25,
                            fontWeight: FontWeight.w100,
                            height: 0,
                            shadows: [
                              Shadow(
                                color: Color(0xff000000),
                                offset: Offset(0, 2),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const GoProWidget(),
          const SizedBox(height: 16),
          Expanded(
            child: Consumer<TaskProvider>(builder: (context, data, child) {
              return ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: data.taskList.length,
                itemBuilder: (context, index) {
                  final task = data.taskList[index];
                  return Padding(
                    padding:
                    const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                    child: Container(
                      width: 382,
                      height: 91,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: const Color(0xffE7E7E7),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(0, 4),
                              blurRadius: 4,
                            )
                          ]),
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 1.3,
                            child: Checkbox(
                              value: task.isDone,
                              shape: const CircleBorder(),
                              activeColor: Colors.green,
                              onChanged: (value) {
                                data.toggleTaskStatus(index);
                              },
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              task.title,
                              style: TextStyle(
                                fontSize: 16,
                                color: const Color(0xff8D8D8D),
                                fontWeight: FontWeight.w500,
                                decoration: task.isDone
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                const BorderSide(color: Colors.black),
                              ),
                              shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(4)), // Square shape
                                ),
                              ),
                              foregroundColor: MaterialStateProperty.all(
                                  Colors.black), // Text color
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditTaskScreen(
                                      taskModel: task,
                                      taskIndex: index,
                                    )),
                              );
                            },
                            child: const Text(
                              'Edit',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
      floatingActionButton: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.8),
                  blurRadius: 8,
                  spreadRadius: 1,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddNewTaskScreen(),
                ),
              );
            },
            backgroundColor: const Color(0xff3556AB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(70),
              side: const BorderSide(
                color: Color(0xff123EB1),
              ),
            ),
            child: const Icon(
              Icons.add,
              size: 36,
              color: Colors.white,
              shadows: [Shadow(color: Colors.black,offset: Offset(0, 2))],
            ),
          ),
        ],
      ),
    );
  }
}
