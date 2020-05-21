import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_tracker/models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  //? BuildContext carries info about where the childeren widget is in the widget tree
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          // itemCount: Provider.of<TaskData>(context).tasks.length,
          itemCount: taskData.taskCount,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isCompleted,
              checkboxCallback: (bool checkboxState) {
                taskData.updateTask(task);
              },
              longPressCallback: () {
                taskData.removeTask(index);
                // taskData.removeTask(task);
              },
            );
          },
        );
      },
    );
  }
}
