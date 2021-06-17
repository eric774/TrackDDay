import 'package:flutter/material.dart';
import 'package:minor_project_1/screens/allTasks.dart';
import '../caledar_screen.dart';
import '../analysis_screen.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

// int _selectedIndex = 0;
// int cIndex = 0;
var _bottomPage;

class BottomBar extends StatefulWidget {
  // const BottomBar({
  //   Key key,
  // }) : super(key: key);

  final int cIndex;
  BottomBar(this.cIndex);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  // var _bottomPage;

  void _onItemTapped(int index) {
    Route _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => _bottomPage,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.easeInCirc;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    }

    // setState(() {
    //   cIndex = index;
    // });
    if (index == 0) {
      _bottomPage = AllTasksScreen();
    } else if (index == 1) {
      _bottomPage = CalenderScreen();
    } else {
      _bottomPage = AnalysisScreen();
    }
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => _bottomPage,
    //   ),
    // );
    Navigator.of(context).push(_createRoute());
  }

  // int currentIndex;
  // @override
  // void initState() {
  //
  //   super.initState();
  //   _currentIndex = 0;
  // }

  // void changePage(int index) {
  //   setState(() {
  //     currentIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // return BottomNavigationBar(
    //   items: const <BottomNavigationBarItem>[
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.check),
    //       label: 'Tasks',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.calendar_today_outlined),
    //       label: 'Callender',
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(Icons.add_chart),
    //       label: 'Analysis',
    //     ),
    //   ],
    //   currentIndex: _selectedIndex,
    //   onTap: _onItemTapped,
    //   selectedItemColor: Colors.amber[800],
    // );

    return BubbleBottomBar(
      hasNotch: true,
      fabLocation: BubbleBottomBarFabLocation.end,
      opacity: .2,
      currentIndex: widget.cIndex,
      onTap: _onItemTapped,
      borderRadius: BorderRadius.vertical(
          top: Radius.circular(
              16)), //border radius doesn't work when the notch is enabled.
      elevation: 8,
      items: <BubbleBottomBarItem>[
        BubbleBottomBarItem(
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.dashboard,
              color: Colors.red,
            ),
            title: Text("Home - All Tasks")),
        BubbleBottomBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(
              Icons.calendar_today,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.calendar_today,
              color: Colors.deepPurple,
            ),
            title: Text("Calendar")),
        BubbleBottomBarItem(
            backgroundColor: Colors.indigo,
            icon: Icon(
              Icons.analytics_outlined,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.analytics_outlined,
              color: Colors.indigo,
            ),
            title: Text("Analysis")),
      ],
    );
  }
}
