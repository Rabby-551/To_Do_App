import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:to_do_app/screens/add_new_task_screen.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  //  task list
  List<Map<String, dynamic>> tasks = [
    {'title': 'Complete Flutter project', 'isDone': false},
    {'title': 'Write blog post', 'isDone': false},
    {'title': 'Write blog post', 'isDone': false},
    {'title': 'Write blog post', 'isDone': false},
    {'title': 'Write blog post', 'isDone': false},
    {'title': 'Write blog post', 'isDone': false},
    {'title': 'Write blog post', 'isDone': false},
    {'title': 'Write blog post', 'isDone': false},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.15),
        child: AppBar(
          backgroundColor: Color(0xff3556AB),
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/img.png',
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
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'rabby@gmail.com',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
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
          Container(
            height: 116,
            color: const Color(0xff9EB031),
            padding: const EdgeInsets.symmetric(horizontal: 24,),
            child: Stack(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/trophy.svg',
                      height: 40.89,
                      width: 53.1,
                    ),
                    const SizedBox(width: 16),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Go Pro (No Ads)',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'No fuss, no ads, for only \$1 a\nmonth',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    height: 71,
                    width: 66.11,
                    decoration: BoxDecoration(
                      color: const Color(0xff071D55),
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: const Text(
                      '\$1',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: 382,
                      height: 91,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 1.3,
                            child: Checkbox(
                              value: task['isDone'],
                              shape: const CircleBorder(),
                              activeColor: Colors.green,
                              onChanged: (value) {
                                setState(() {
                                  tasks[index]['isDone'] = value!;
                                });
                              },
                            ),
                          ),

                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              task['title'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                decoration: task['isDone']
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                const BorderSide(
                                    color: Colors.black), // Black border
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)), // Square shape
                                ),
                              ),
                              foregroundColor: MaterialStateProperty.all(
                                  Colors.black), // Text color
                            ),
                            onPressed: () { },
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNewTaskScreen()),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Color(0xff123EB1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),

    );
  }
}
