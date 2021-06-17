import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (_) => AboutPage(),
      ),
    );
  }

  @override
  _State createState() => _State();
}

class _State extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('How to Use, tips...'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text('Slide from left to access drawer : '),
            Text(
                'This is the App Drawer, from here various utility page views can be accessed.'),
            SizedBox(height: 20),
            Text('Click on Floating + icon to add task :'),
            Text(
                'This is the add task method, which pops up with Animation, It is used for assigning daily activities.'),
            SizedBox(height: 20),
            Text('Click on clock icon on top right : '),
            Text(
                'This is the Stop Watch feature, it can be accessed from the top bar.'),
            SizedBox(height: 20),
            Text('All tasks Page from Drawer :'),
            Text(
                'This is the all tasks completed page, users arrive here after a particular assigned task is completed and it is deleted from history after 30 days.This is to be used for reference and motivation'),
            SizedBox(height: 20),
            Text('All tasks page / Home screen :'),
            Text(
                'This is all tasks bar, where tasks are mentioned and new tasks can be added from bottom right corner plus icon.'),
            Text(
                'Users can archive, copy and delete tasks here. The Slider is used for users to rate themselves on various activities, later these ratings are used for feedback analysis'),
            SizedBox(height: 20),
            Text('Access Analysis page from bottom : '),
            Text(
                'This is the graph analysis view page here weekly scores out of 10 can be seen for particular tasks'),
          ],
        ));
  }
}
