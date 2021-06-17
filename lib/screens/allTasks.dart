// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:minor_project_1/screens/resources/how_to_use.dart';
import 'add_task_screen.dart';
import 'day_task_list.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'resources/sideMenuScreen.dart';
import 'resources/bottomBar.dart';
import 'package:badges/badges.dart';
import 'resources/stopwatchUp.dart';

var alertflag = false;

class AllTasksScreen extends StatefulWidget {
  @override
  _AllTasksScreenState createState() => _AllTasksScreenState();
}

class _AllTasksScreenState extends State<AllTasksScreen> {
  @override
  Widget build(BuildContext context) {
    alertflag == false
        ? Future.delayed(Duration.zero, () => showAlert(context))
        : null;
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        // elevation: 0.0,
        // titleSpacing: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.track_changes_sharp,
            semanticLabel: 'menu',
          ),
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text('All Tasks'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.watch_later,
              semanticLabel: 'Stopwatch',
            ),
            onPressed: () {
              // Navigator.of(context).push(Stopwatch());
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Stopwatch()),
              );
            },
          ),
          Badge(
            badgeContent: Text(
              '3',
            ),
            badgeColor: Colors.amber,
            alignment: Alignment.center,
            elevation: 2,
            // position: BadgePosition.bottomStart(),
            child: Icon(Icons.notifications),
          ),
          PopupMenuButton(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Icon(
                Icons.help_outline_outlined,
                semanticLabel: 'actions',
              ),
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AboutPage()),
                        );
                      },
                      child: Text('How to Use')),
                ),
                PopupMenuItem(
                  child: GestureDetector(
                      onTap: () {
                        AdaptiveTheme.of(context).toggleThemeMode();
                      },
                      child: Text('Light/Dark mode')),
                )
              ];
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => AddTaskScreen());
        },
        child: Icon(Icons.add),
        // backgroundColor: Colors.yellow,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      drawer: SideMenu(),
      bottomNavigationBar: BottomBar(0),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Today",
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                Icon(Icons.add)
              ],
            ),
            Expanded(
              // child: Container(
              // day card/tile - today, tommorow, selected date
              child: DayTaskList(),
              // dayTile("Tommorow"),
              // dayTile("Upcomming"),
              // ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text("Tommorow",
            //         style:
            //             TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
            //     Icon(Icons.add)
            //   ],
            // ),
            // Expanded(
            //   // child: Container(
            //   // day card/tile - today, tommorow, selected date
            //   child: DayTaskList(),
            //   // dayTile("Tommorow"),
            //   // dayTile("Upcomming"),
            //   // ),
            // ),
            // Container(
            //     padding: EdgeInsets.all(8),
            //     child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            //       Expanded(
            //         child: TextFormField(
            //           autocorrect: false,
            //           decoration: InputDecoration(
            //             contentPadding: EdgeInsets.fromLTRB(30, 25, 0, 0),
            //             labelText: "I Want to...",
            //             labelStyle:
            //                 TextStyle(fontSize: 20.0, color: Colors.white),
            //             fillColor: Colors.blue,
            //             border: OutlineInputBorder(
            //                 borderRadius:
            //                     BorderRadius.all(Radius.circular(50.0)),
            //                 borderSide: BorderSide(color: Colors.blueAccent)),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         padding: EdgeInsets.only(left: 10),
            //         // child: FloatingActionButton(
            //         //   child: Icon(Icons.add),
            //         //   onPressed: () {
            //         //     showModalBottomSheet(
            //         //         context: context,
            //         //         builder: (context) => AddTaskScreen());
            //         //   },
            //         // ),
            //       ),
            //     ])),
          ],
        ),
      ),
      // bottomNavigationBar: BottomBar(),
    );
  }

  void showAlert(BuildContext context) {
    alertflag = true;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Motivation of the day'),
        // content: const Text('AlertDialog description'),
        content: Text(motivation),
        elevation: 24,
        backgroundColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        actions: <Widget>[
          // TextButton(
          //   onPressed: () => Navigator.pop(context, 'Cancel'),
          //   child: const Text('Cancel'),
          // ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.yellow),
            ),
          ),
        ],
      ),
    );
  }
}

List motivationList = [
  '“The Best Way To Get Started Is To Quit Talking And Begin Doing.” – Walt Disney',
  '“The Pessimist Sees Difficulty In Every Opportunity. The Optimist Sees Opportunity In Every Difficulty.” – Winston Churchill',
  '“Don’t Let Yesterday Take Up Too Much Of Today.” – Will Rogers',
  'You Learn More From Failure Than From Success. Don’t Let It Stop You. Failure Builds Character.',
  "It’s Not Whether You Get Knocked Down, It’s Whether You Get Up",
  '“If You Are Working On Something That You Really Care About, You Don’t Have To Be Pushed. The Vision Pulls You.” – Steve Jobs',
  '“People Who Are Crazy Enough To Think They Can Change The World, Are The Ones Who Do.” – Rob Siltanen',
  '“Failure Will Never Overtake Me If My Determination To Succeed Is Strong Enough.” – Og Mandino',
  '“We May Encounter Many Defeats But We Must Not Be Defeated.” – Maya Angelou',
  '“Imagine Your Life Is Perfect In Every Respect; What Would It Look Like?” – Brian Tracy'
];
var motivation = (motivationList..shuffle()).first;
