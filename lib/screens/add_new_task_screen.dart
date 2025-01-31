import 'package:flutter/material.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _taskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xffF3F3F3),
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
                  if (_taskController.text.isNotEmpty) {
                    Navigator.pop(context, _taskController.text);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter a task name."),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 6,
                  shadowColor: Colors.black,
                  backgroundColor:const Color(0xff3556AB), // Button background color
                  minimumSize: const Size(365, 61), // Set width and height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side:const BorderSide(color: Color(0xff0D2972))
                  ),
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 18, // Text size
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(0, 2),
                      ),
                    ], // Text weight
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
