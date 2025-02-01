// AddNewTaskScreen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/provider/task_provider.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _taskController = TextEditingController();

  @override
  void dispose() {
    _taskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F3F3),
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        backgroundColor: const Color(0xff3556AB),
        title: const Text(
          'Add New Task',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              shadows: [
                Shadow(color: Color(0xff000000), offset: Offset(0, 2))
              ]),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 39),
            child: Text(
              'Task Name',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 17, right: 17, top: 14, bottom: 14),
            child: TextField(
              controller: _taskController,
              style: const TextStyle(
                fontSize: 20,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xffFDFDFD),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(9),
                  borderSide: const BorderSide(
                    color: Color(0xffCBCBCB),
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  context.read<TaskProvider>().addTask(
                        TaskModel(
                          title: _taskController.text,
                          isDone: false,
                        ),
                      );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  elevation: 6,
                  shadowColor: Colors.black,
                  backgroundColor: const Color(0xff3556AB),
                  minimumSize: const Size(365, 61),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Color(0xff0D2972)),
                  ),
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
