import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:vue_v4/controller/task_controller.dart';
import 'package:vue_v4/widgets/add_task.dart';
import '../../models/task.dart';
import '../../models/uid.dart';
import '../../services/size_config.dart';
import '../../services/theme_services.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../widgets/task_tile.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({Key? key}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

File? _image;
bool theDarkMode = Get.isDarkMode;
final TaskController _taskController = Get.put(TaskController());
DateTime _selectDate = DateTime.now();

class _TaskPageState extends State<TaskPage> {
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      // ignore: use_build_context_synchronously
      Navigator.pop(context); // Close the dialog
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tasks page',
          style: headingStyle.copyWith(color: ThemeManager.deepBlue),
        ),
      ),
      body: Column(
        children: [
          _addTaskBar(),
          _addDateBar(),
          _showTasks(),
        ],
      ),
    );
  }

  _addTaskBar() {
    String today = DateFormat.yMMMMd().format(DateTime.now()).toString();
    return Container(
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                today,
              ),
              const Text('Today'),
            ],
          ),
          const Spacer(),
          CustomButton(
            onPressed: () async {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AddTaskPage(),
                ),
              );
              // await Get.to(const AddTaskPage());
            },
            text: '+ add task',
          ),
        ],
      ),
    );
  }

  _addDateBar() {
    return DatePicker(
      DateTime.now(),
      width: 70,
      height: 100,
      dateTextStyle: titleStyle.copyWith(fontSize: 20, color: Colors.grey),
      dayTextStyle: titleStyle.copyWith(fontSize: 16, color: Colors.grey),
      monthTextStyle: titleStyle.copyWith(fontSize: 12, color: Colors.grey),
      initialSelectedDate: _selectDate,
      selectionColor: ThemeManager.deepBlue,
      onDateChange: (date) {
        setState(() {
          _selectDate = date;
        });
      },
    );
  }

  _showTasks() {
    return Expanded(
      child: Obx(() {
        if (_taskController.taskList.isEmpty) {
          return _noTaskMsg();
        } else {
          return ListView.builder(
            scrollDirection: SizeConfig.orientation == Orientation.landscape
                ? Axis.horizontal
                : Axis.vertical,
            itemBuilder: (BuildContext contex, int index) {
              Task task = _taskController.taskList[index];

              //NOTIFACATION
              //  mynot.scheduledNotification(int.parse(hour), int.parse(min), task,);
              if (task.repeat == 'daily' ||
                  task.date == DateFormat.yMd().format(_selectDate)) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 1200),
                  child: SlideAnimation(
                    horizontalOffset: 300,
                    child: FadeInAnimation(
                      child: GestureDetector(
                        onTap: () => _showBottomSheet(
                          context,
                          task,
                        ),
                        child: TaskTile(
                          task: task,
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
            itemCount: _taskController.taskList.length,
          );
        }
      }),
    );
  }

  _noTaskMsg() {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 3000),
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 100, bottom: 100),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: ThemeManager.deepBlue,
                  maxRadius: 80,
                  backgroundImage: const AssetImage('assets/Doctors1.png'),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Text(
                    'No tasks added yet!',
                    style: subtitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  _showBottomSheet(BuildContext context, Task task) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(top: 4),
            width: MediaQuery.of(context).size.width,
            height:
                (MediaQuery.of(context).orientation == Orientation.landscape)
                    ? (task.isCompleted == 1
                        ? MediaQuery.of(context).size.height * 0.6
                        : MediaQuery.of(context).size.height * 0.8)
                    : (task.isCompleted == 1
                        ? MediaQuery.of(context).size.height * 0.30
                        : MediaQuery.of(context).size.height * 0.39),
            color: Colors.white,
            child: Column(
              children: [
                Flexible(
                  child: Container(
                    height: 6,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[600]
                          : Colors.grey[600],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                task.isCompleted == 1
                    ? Container()
                    : _buildBottomSheet(
                        label: 'Task Completed',
                        onTap: () async {
                          await _taskController.markTaskCompleted(task);
                          Navigator.of(context).pop(); // Close bottom sheet
                        },
                        clrOfText: Colors.white,
                        clr: primaryClr),
                _buildBottomSheet(
                    label: 'Delete Task',
                    onTap: () async {
                      await _taskController.deleteTasks(task);
                      // ignore: use_build_context_synchronously
                      Navigator.pop(context); // Close bottom sheet
                    },
                    clrOfText: Colors.white,
                    clr: pinkClr),
                Divider(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.grey
                      : darkGreyClr,
                ),
                _buildBottomSheet(
                  label: 'Cancel',
                  onTap: () {
                    Navigator.of(context).pop(); // Close bottom sheet
                  },
                  clrOfText: darkGreyClr,
                  clr: Colors.grey.withOpacity(0.5),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  _buildBottomSheet(
      {required String label,
      required Function() onTap,
      required Color clr,
      required Color clrOfText,
      bool isClose = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: 65,
        width: SizeConfig.screenWidth * 0.9,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClose
                ? Get.isDarkMode
                    ? Colors.grey[600]!
                    : Colors.grey[600]!
                : clr,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isClose ? Colors.transparent : clr,
        ),
        child: Center(
          child: Text(
            label,
            style: titleStyle.copyWith(color: clrOfText),
          ),
        ),
      ),
    );
  }

  Center pickImage(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: _image != null
                          ? Image.file(
                              _image!,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/Doctors1.png',
                              fit: BoxFit.cover,
                            ),
                    ),
                    TextButton(
                      onPressed: _pickImage,
                      child: const Text('Change picture'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: CircleAvatar(
          radius: 50.0,
          child: ClipOval(
            child: _image != null
                ? Image.file(
                    _image!,
                    width: 45.0,
                    height: 50.0,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/Doctors1.png',
                    width: 45.0,
                    height: 50.0,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }
}
