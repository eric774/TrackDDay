import 'package:flutter/material.dart';
import 'package:minor_project_1/auth.dart';
import 'package:minor_project_1/screens/allDone.dart';
import 'package:minor_project_1/screens/resources/login.dart';
// import 'addTaskPage.dart';
import '../allTasks.dart';
import '../analysis_screen.dart';
import '../archived.dart';
// import 'models/task_data.dart';
// import 'package:provider/provider.dart';
// import 'models/listsStorage/lessons.dart';
// String newPageName = "newTaskPage";

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Morning';
  }
  if (hour < 17) {
    return 'Afternoon';
  }
  return 'Evening';
}

List pageNameList() {
  List _pageNames = ['newpage 1', 'new page 2', 'newpage 3'];
  return _pageNames;
  // _newpages.length, _newpages.add(page), _newpages.remove(page)
}

ListItem showPages() {
  for (int i = 0; i < pageNameList().length; i++) {
    return ListItem(pageNameList()[i], Icons.today, AllTasksScreen());
  }
}

class SideMenu extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Good ' + greeting() + ',',
                  ),
                  Text(
                    // "Nishant",
                    // name_from_email[0].toString(),
                    name_from_email == null
                        ? 'nishant'
                        : name_from_email[0].toString(),
                    style: TextStyle(fontSize: 40),
                  ),
                  // Container(
                  //   padding: EdgeInsets.all(10),
                  //   margin: EdgeInsets.all(5),
                  //   alignment: Alignment.center,
                  //   child: OutlinedButton(
                  //     child: Text('+ Add New Task Page'),
                  //     style: TextButton.styleFrom(
                  //         backgroundColor: Colors.teal,
                  //         primary: Colors.white,
                  //         elevation: 5,
                  //         onSurface: Colors.tealAccent,
                  //         shape: const BeveledRectangleBorder(
                  //             borderRadius:
                  //                 BorderRadius.all(Radius.circular(12)))),
                  //     onPressed: () {
                  //       // showModalBottomSheet(
                  //       //     context: context,
                  //       //     builder: (context) => AddTaskScreen());
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),

            Container(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  // return makeCard;
                },
              ),
            ),
            ListItem('All Tasks', Icons.home, AllTasksScreen()), //sorting
            ListItem('Archived Tasks', Icons.archive, ArchivedTasks()),
            ListItem('Analysis', Icons.analytics, AnalysisScreen()),
            ListItem('All Done', Icons.done_all, AllDone()),
            // ListItem('Log Out', Icons.logout, SignOut()),
            // showPages(),

            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () {
                  _auth.signOut();
                },
                child: Text("LogOut")),

            SizedBox(
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("images/fire.gif"),
                  height: 50,
                  width: 70,
                ),
                Text(
                  " x 4",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                      fontSize: 40),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Card makeCard(Lesson lesson) => Card(
//       elevation: 8.0,
//       margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
//       child: Container(
//         decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
//         child: makeListTile(lesson),
//       ),
//     );

// ListTile makeListTile(Lesson lesson) => ListTile(
//       contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//       leading: Container(
//         padding: EdgeInsets.only(right: 12.0),
//         decoration: new BoxDecoration(
//             border: new Border(
//                 right: new BorderSide(width: 1.0, color: Colors.white24))),
//         child: Icon(Icons.autorenew, color: Colors.white),
//       ),
//       title: Text(
//         lesson.title,
//         style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//       ),

//       subtitle: Row(
//         children: <Widget>[
//           Expanded(
//               flex: 1,
//               child: Container(
//                 // tag: 'hero',
//                 child: LinearProgressIndicator(
//                     backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
//                     value: lesson.indicatorValue,
//                     valueColor: AlwaysStoppedAnimation(Colors.green)),
//               )),
//           Expanded(
//             flex: 4,
//             child: Padding(
//                 padding: EdgeInsets.only(left: 10.0),
//                 child:
//                     Text(lesson.level, style: TextStyle(color: Colors.white))),
//           )
//         ],
//       ),
//       trailing:
//           Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
//       // onTap: () {

//       //   Navigator.push(
//       //       context, MaterialPageRoute(builder: (context) => DetailPage()));
//       // },
//     );

/////////////////////////////////////////////////////////////////////////////////////////////////////////
// ignore: must_be_immutable
class ListItem extends StatelessWidget {
  var linkedTo;
  var tileIcon;
  var link;
  ListItem(this.linkedTo, this.tileIcon, this.link);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            tileIcon,
            // color: Colors.white54,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            linkedTo,
            // style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
      onTap: () {
        // Update the state of the app
        // ...
        // Then close the drawer
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => link),
        );
      },
    );
  }
}
//konsa button use karun?
//naya bana diya na, log out ka, bs push krne ka class vagera lagana h udhr
