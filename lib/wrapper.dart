import 'package:flutter/material.dart';
import 'package:minor_project_1/screens/resources/login.dart';
import 'package:provider/provider.dart';
import 'screens/allTasks.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<String>(context);
    // print(user);

    if (user == null) {
      return Login();
    } else {
      return AllTasksScreen();
    }
  }
}
