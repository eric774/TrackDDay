import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'resources/sideMenuScreen.dart';
import 'resources/bottomBar.dart';
import 'package:badges/badges.dart';
import 'resources/stopwatchUp.dart';
import '../models/task_data.dart';

class AllDone extends StatefulWidget {
  @override
  _AllDoneState createState() => _AllDoneState();
}

class _AllDoneState extends State<AllDone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.dark,
          // elevation: 0.0,
          // titleSpacing: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.done_all,
              semanticLabel: 'icon',
            ),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Text('All Done'),
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
                        onTap: () {}, child: Text('How to Use')),
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
        drawer: SideMenu(),
        bottomNavigationBar: BottomBar(0),
        body:
            // allDoneTasks == []
            //     ? Center(
            //         child: Padding(
            //           padding: EdgeInsets.only(left: 20, right: 20, top: 20),
            //           child: Text("Nothing done yet"),
            //         ),
            //       )
            //     :
            ListView.builder(
          itemCount: allDoneTasks.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('${allDoneTasks[index]}'),
            );
          },
        ));
  }
}
