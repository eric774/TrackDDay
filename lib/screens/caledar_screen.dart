import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'resources/bottomBar.dart';
// import 'resources/colorRange.dart';
import 'day_task_tile.dart';

/// My app class to display the date range picker
class CalenderScreen extends StatefulWidget {
  @override
  CalenderScreenState createState() => CalenderScreenState();
}

/// State for MyApp
class CalenderScreenState extends State<CalenderScreen> {
  List<DateTime> _specialDates;

  @override
  void initState() {
    setState(() {
      if (avgScore == 0) {
        col = Color(0xFFd97d71);
      } else if (avgScore == 10) {
        col = Color(0xFF32a2a8);
      } else if (avgScore > 0 && avgScore < 5) {
        col = Color(0xFFd9a871);
      } else if (avgScore == 5) {
        col = Color(0xFF4632a8);
      } else {
        col = Color(0xFF3ea832);
      }
    });
    _specialDates = <DateTime>[
      // DateTime.now().add(Duration(days: 2)),
      // DateTime.now().add(Duration(days: 3)),
      // DateTime.now().add(Duration(days: 6)),
      // DateTime.now().add(Duration(days: 7)),
      // DateTime.now().add(Duration(days: -2)),
      // DateTime.now().add(Duration(days: -3)),
      // DateTime.now().add(Duration(days: -6)),
      // DateTime.now().add(Duration(days: -7))
      DateTime.now().subtract(const Duration(days: 4)),
    ];
    super.initState();
    _specialDates.add(DateTime.now().subtract(const Duration(days: 2)));
  }

  String _selectedDate = '';
  String _dateCount = '';
  String _range = '';
  String _rangeCount = '';
  var col;

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        _range =
            DateFormat('dd/MM/yyyy').format(args.value.startDate).toString() +
                ' - ' +
                DateFormat('dd/MM/yyyy')
                    .format(args.value.endDate ?? args.value.startDate)
                    .toString();
      } else if (args.value is DateTime) {
        _selectedDate = args.value.toString();
      } else if (args.value is List<DateTime>) {
        _dateCount = args.value.length.toString();
      } else {
        _rangeCount = args.value.length.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage("images/rating.png"),
                  height: 50,
                  width: 70,
                )
                // Text('Selected date: ' + _selectedDate),
                // Text('Selected date count: ' + _dateCount),
                // Text('Selected range: ' + _range),
                // Text('Selected ranges count: ' + _rangeCount)
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 80,
            right: 0,
            bottom: 70,
            child: SfDateRangePicker(
              monthViewSettings: DateRangePickerMonthViewSettings(
                  specialDates: _specialDates,
                  blackoutDates: [
                    DateTime.now().subtract(const Duration(days: 3)),
                    DateTime.now().subtract(const Duration(days: 1)),
                    DateTime.now().subtract(const Duration(days: 5)),
                  ]),

              monthCellStyle: DateRangePickerMonthCellStyle(
                blackoutDatesDecoration: BoxDecoration(
                    color: Color(0xFF32a2a8),
                    border:
                        Border.all(color: const Color(0xFF2B732F), width: 1),
                    shape: BoxShape.circle),
                specialDatesTextStyle: const TextStyle(color: Colors.black),
                specialDatesDecoration: BoxDecoration(
                    color: Color(0xFF3ea832),
                    // color: Colors.green,
                    // color: colorRange(),
                    border:
                        Border.all(color: const Color(0xFF2B732F), width: 1),
                    shape: BoxShape.circle),
                todayTextStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                    color: Colors.red),
                todayCellDecoration: BoxDecoration(
                    color: col,
                    // color: Colors.green,
                    // color: colorRange(),
                    border:
                        Border.all(color: const Color(0xFF2B732F), width: 1),
                    shape: BoxShape.circle),
              ),
              selectionColor: Colors.blueGrey,
              onSelectionChanged: _onSelectionChanged,
              // selectionMode: DateRangePickerSelectionMode.single,
              // initialSelectedDate:
              //     DateTime.now().subtract(const Duration(days: 4)),
              // initialSelectedRange: PickerDateRange(
              //   DateTime.now().subtract(const Duration(days: 4)),
              //   DateTime.now().add(const Duration(days: 3)),
              // ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 557,
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Color(0xFF32a2a8), shape: BoxShape.circle),
                    ),
                    Text("Exellent")
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Color(0xFF3ea832), shape: BoxShape.circle),
                    ),
                    Text("Good")
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Color(0xFF4632a8), shape: BoxShape.circle),
                    ),
                    Text("Meh")
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Color(0xFFd9a871), shape: BoxShape.circle),
                    ),
                    Text("Bad")
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Color(0xFFd97d71), shape: BoxShape.circle),
                    ),
                    Text("Awful")
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(1),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'resources/bottomBar.dart';

// var _calendarFormat = CalendarFormat.month;
// var _selectedDay;
// var _focusedDay;

// class CalenderScreen extends StatefulWidget {
//   @override
//   _CalenderScreenState createState() => _CalenderScreenState();
// }

// class _CalenderScreenState extends State<CalenderScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('TableCalendar'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TableCalendar(
//               // format
//               calendarFormat: _calendarFormat,
//               onFormatChanged: (format) {
//                 setState(() {
//                   _calendarFormat = format;
//                 });
//               },
//               selectedDayPredicate: (day) {
//                 return isSameDay(_selectedDay, day);
//               },
//               onDaySelected: (selectedDay, focusedDay) {
//                 setState(() {
//                   _selectedDay = selectedDay;
//                   _focusedDay = focusedDay; // update `_focusedDay` here as well
//                 });
//               },
//               onPageChanged: (focusedDay) {
//                 _focusedDay = focusedDay;
//               },
//               // calendarStyle: ,
//               firstDay: DateTime.utc(2021, 01, 01),
//               lastDay: DateTime.utc(2030, 01, 01),
//               focusedDay: DateTime.now(),
//               calendarStyle: CalendarStyle(),
//             )
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomBar(),
//     );
//   }
// }
