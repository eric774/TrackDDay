import 'package:flutter/material.dart';
import 'day_task_tile.dart';
import 'package:provider/provider.dart';
import 'package:minor_project_1/models/task_data.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/services.dart';

var count;

class DayTaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        count = taskData.taskCount;
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: Container(
                child: DayTaskTile(
                  score: task.score,
                  taskTitle: task.name,
                  isChecked: task.isDone,
                  checkboxCallback: (checkboxState) {
                    taskData.updateTask(task);
                  },
                  longPressCallback: () {
                    taskData.deleteTask(task);
                  },
                ),
              ),
              actions: <Widget>[
                IconSlideAction(
                    caption: 'Archive',
                    color: Colors.blue,
                    icon: Icons.archive,
                    onTap: () {
                      archivedTasks.add(task.name);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Task has been been saved as Archived'),
                        ),
                      );
                    }),
                IconSlideAction(
                    caption: 'Copy',
                    color: Colors.indigo,
                    icon: Icons.copy,
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: task.name));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Copied to clipboard'),
                        ),
                      );
                    }),
              ],
              secondaryActions: <Widget>[
                IconSlideAction(
                    caption: 'More',
                    color: Colors.yellowAccent,
                    icon: Icons.more_horiz,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Coming Soon'),
                        ),
                      );
                    }),
                IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () {
                    allDoneTasks.add(task.name);
                    taskData.deleteTask(task);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Task has been Deleted'),
                      ),
                    );
                  },
                ),
              ],
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
