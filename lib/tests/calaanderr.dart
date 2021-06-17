// // import 'package:flutter/material.dart';
// // // import 'package:flutter_calendar_carousel/classes/event.dart';
// // // import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
// // // import 'package:intl/intl.dart';

// // // class CalenderScreen extends StatefulWidget {
// // //   @override
// // //   _CalenderScreenState createState() => _CalenderScreenState();
// // // }

// // // class _CalenderScreenState extends State<CalenderScreen> {
// // //   DateTime _currentDate = DateTime.now();
// // //   DateTime _currentDate2 = DateTime.now();
// // //   String _currentMonth = DateFormat.yMMM().format(DateTime.now());
// // //   DateTime _targetDateTime = DateTime.now();

// // //   CalendarCarousel _calendarCarouselNoHeader;

// // //   static Widget _eventIcon = new Container(
// // //     decoration: new BoxDecoration(
// // //         color: Colors.white,
// // //         borderRadius: BorderRadius.all(Radius.circular(1000)),
// // //         border: Border.all(color: Colors.blue, width: 2.0)),
// // //     child: new Icon(
// // //       Icons.person,
// // //       color: Colors.amber,
// // //     ),
// // //   );

// // //   EventList<Event> _markedDateMap = new EventList<Event>(
// // //     events: {
// // //       new DateTime(2020, 2, 10): [
// // //         new Event(
// // //           date: new DateTime(2020, 2, 14),
// // //           title: 'Event 1',
// // //           icon: _eventIcon,
// // //           dot: Container(
// // //             margin: EdgeInsets.symmetric(horizontal: 1.0),
// // //             color: Colors.red,
// // //             height: 5.0,
// // //             width: 5.0,
// // //           ),
// // //         ),
// // //         new Event(
// // //           date: new DateTime(2020, 2, 10),
// // //           title: 'Event 2',
// // //           icon: _eventIcon,
// // //         ),
// // //         new Event(
// // //           date: new DateTime(2020, 2, 15),
// // //           title: 'Event 3',
// // //           icon: _eventIcon,
// // //         ),
// // //       ],
// // //     },
// // //   );

// // //   @override
// // //   void initState() {
// // //     _markedDateMap.add(
// // //         new DateTime(2020, 2, 25),
// // //         new Event(
// // //           date: new DateTime(2020, 2, 25),
// // //           title: 'Event 5',
// // //           icon: _eventIcon,
// // //         ));

// // //     _markedDateMap.add(
// // //         new DateTime(2020, 2, 10),
// // //         new Event(
// // //           date: new DateTime(2020, 2, 10),
// // //           title: 'Event 4',
// // //           icon: _eventIcon,
// // //         ));

// // //     _markedDateMap.addAll(new DateTime(2019, 2, 11), [
// // //       new Event(
// // //         date: new DateTime(2019, 2, 11),
// // //         title: 'Event 1',
// // //         icon: _eventIcon,
// // //       ),
// // //       new Event(
// // //         date: new DateTime(2019, 2, 11),
// // //         title: 'Event 2',
// // //         icon: _eventIcon,
// // //       ),
// // //       new Event(
// // //         date: new DateTime(2019, 2, 11),
// // //         title: 'Event 3',
// // //         icon: _eventIcon,
// // //       ),
// // //     ]);
// // //     super.initState();
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     _calendarCarouselNoHeader = CalendarCarousel<Event>(
// // //       todayBorderColor: Colors.green,
// // //       onDayPressed: (DateTime date, List<Event> events) {
// // //         this.setState(() => _currentDate2 = date);
// // //         events.forEach((event) => print(event.title));
// // //       },
// // //       daysHaveCircularBorder: true,
// // //       showOnlyCurrentMonthDate: false,
// // //       weekendTextStyle: TextStyle(
// // //         color: Colors.red,
// // //       ),
// // //       thisMonthDayBorderColor: Colors.grey,
// // //       weekFormat: false,
// // // //      firstDayOfWeek: 4,
// // //       markedDatesMap: _markedDateMap,
// // //       height: 420.0,
// // //       selectedDateTime: _currentDate2,
// // //       targetDateTime: _targetDateTime,
// // //       customGridViewPhysics: NeverScrollableScrollPhysics(),
// // //       markedDateCustomShapeBorder:
// // //           CircleBorder(side: BorderSide(color: Colors.yellow)),
// // //       markedDateCustomTextStyle: TextStyle(
// // //         fontSize: 18,
// // //         color: Colors.blue,
// // //       ),
// // //       showHeader: false,
// // //       todayTextStyle: TextStyle(
// // //         color: Colors.blue,
// // //       ),

// // //       todayButtonColor: Colors.yellow,
// // //       selectedDayTextStyle: TextStyle(
// // //         color: Colors.yellow,
// // //       ),
// // //       minSelectedDate: _currentDate.subtract(Duration(days: 360)),
// // //       maxSelectedDate: _currentDate.add(Duration(days: 360)),
// // //       prevDaysTextStyle: TextStyle(
// // //         fontSize: 16,
// // //         color: Colors.pinkAccent,
// // //       ),
// // //       inactiveDaysTextStyle: TextStyle(
// // //         color: Colors.tealAccent,
// // //         fontSize: 16,
// // //       ),
// // //       onCalendarChanged: (DateTime date) {
// // //         this.setState(() {
// // //           _targetDateTime = date;
// // //           _currentMonth = DateFormat.yMMM().format(_targetDateTime);
// // //         });
// // //       },
// // //       onDayLongPressed: (DateTime date) {
// // //         print('long pressed date $date');
// // //       },
// // //     );

// // //     return new Scaffold(
// // //         appBar: new AppBar(
// // //           title: new Text('Calendar'),
// // //         ),
// // //         body: SingleChildScrollView(
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             mainAxisAlignment: MainAxisAlignment.start,
// // //             children: <Widget>[
// // //               //custom icon

// // //               Container(
// // //                 margin: EdgeInsets.only(
// // //                   top: 30.0,
// // //                   bottom: 16.0,
// // //                   left: 16.0,
// // //                   right: 16.0,
// // //                 ),
// // //                 child: new Row(
// // //                   children: <Widget>[
// // //                     Expanded(
// // //                         child: Text(
// // //                       _currentMonth,
// // //                       style: TextStyle(
// // //                         fontWeight: FontWeight.bold,
// // //                         fontSize: 24.0,
// // //                       ),
// // //                     )),
// // //                     FlatButton(
// // //                       child: Text('PREV'),
// // //                       onPressed: () {
// // //                         setState(() {
// // //                           _targetDateTime = DateTime(
// // //                               _targetDateTime.year, _targetDateTime.month - 1);
// // //                           _currentMonth =
// // //                               DateFormat.yMMM().format(_targetDateTime);
// // //                         });
// // //                       },
// // //                     ),
// // //                     FlatButton(
// // //                       child: Text('NEXT'),
// // //                       onPressed: () {
// // //                         setState(() {
// // //                           _targetDateTime = DateTime(
// // //                               _targetDateTime.year, _targetDateTime.month + 1);
// // //                           _currentMonth =
// // //                               DateFormat.yMMM().format(_targetDateTime);
// // //                         });
// // //                       },
// // //                     )
// // //                   ],
// // //                 ),
// // //               ),
// // //               Container(
// // //                 margin: EdgeInsets.symmetric(horizontal: 16.0),
// // //                 child: _calendarCarouselNoHeader,
// // //               ), //
// // //             ],
// // //           ),
// // //         ));
// // //   }
// // // }

// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       // theme: theme,
// //       // darkTheme: darkTheme,
// //       home: Home(),
// //     );
// //   }
// // }

// // class Home extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => new _MyHomePageState();
// // }

// // class _MyHomePageState extends State<Home> {
// //   DateTime selected;

// //   _showDateTimePicker() async {
// //     selected = await showDatePicker(
// //       context: context,
// //       initialDate: new DateTime.now(),
// //       firstDate: new DateTime(1960),
// //       lastDate: new DateTime(2050),
// //     );

// //     setState(() {});
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     var dateFormat_1 = new Column(
// //       children: <Widget>[
// //         new SizedBox(
// //           height: 30.0,
// //         ),
// //         selected != null
// //             ? new Text(
// //                 new DateFormat('yyyy-MMMM-dd').format(selected),
// //                 style: new TextStyle(
// //                   color: Colors.black,
// //                   fontSize: 20.0,
// //                 ),
// //               )
// //             : new SizedBox(
// //                 width: 0.0,
// //                 height: 0.0,
// //               ),
// //       ],
// //     );

// //     var dateFormat_2 = new Column(
// //       children: <Widget>[
// //         new SizedBox(
// //           height: 30.0,
// //         ),
// //         selected != null
// //             ? new Text(
// //                 new DateFormat('yyyy-MM-dd').format(selected),
// //                 style: new TextStyle(
// //                   color: Colors.deepPurple,
// //                   fontSize: 20.0,
// //                 ),
// //               )
// //             : new SizedBox(
// //                 width: 0.0,
// //                 height: 0.0,
// //               ),
// //       ],
// //     );

// //     var dateStringParsing = new Column(
// //       children: <Widget>[
// //         new SizedBox(
// //           height: 30.0,
// //         ),
// //         selected != null
// //             ? new Text(
// //                 new DateFormat('yyyy-MM-dd h:m:s')
// //                     .format(DateTime.parse("2018-09-15 20:18:04Z")),
// //                 style: new TextStyle(
// //                   color: Colors.green,
// //                   fontSize: 20.0,
// //                 ),
// //               )
// //             : new SizedBox(
// //                 width: 0.0,
// //                 height: 0.0,
// //               ),
// //       ],
// //     );

// //     var dateUtcLocal = new Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: <Widget>[
// //         new SizedBox(
// //           height: 30.0,
// //         ),
// //         selected != null
// //             ? new Text(
// //                 "UTC: " +
// //                     new DateFormat('yyyy-MM-dd h:m:s').format(selected.toUtc()),
// //                 style: new TextStyle(
// //                   color: Colors.blue,
// //                   fontSize: 20.0,
// //                 ),
// //               )
// //             : new SizedBox(
// //                 width: 0.0,
// //                 height: 0.0,
// //               ),
// //         new SizedBox(
// //           height: 30.0,
// //         ),
// //         selected != null
// //             ? new Text(
// //                 "Local: " +
// //                     new DateFormat('yyyy-MM-dd h:m:s')
// //                         .format(selected.toLocal()),
// //                 style: new TextStyle(
// //                   color: Colors.black26,
// //                   fontSize: 20.0,
// //                 ),
// //               )
// //             : new SizedBox(
// //                 width: 0.0,
// //                 height: 0.0,
// //               ),
// //       ],
// //     );

// //     var compareDates = new Column(
// //       children: <Widget>[
// //         new Text(
// //           selected != null
// //               ? selected.isBefore(new DateTime.now())
// //                   ? ": True"
// //                   : ": False"
// //               : "",
// //           style: new TextStyle(color: Colors.red, fontSize: 20.0),
// //         ),
// //       ],
// //     );

// //     var dateComapereFormat = new Row(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: <Widget>[
// //         selected != null
// //             ? new Text(
// //                 new DateFormat('yyyy-MM-dd').format(selected),
// //                 style: new TextStyle(color: Colors.green, fontSize: 17.0),
// //               )
// //             : new SizedBox(
// //                 width: 0.0,
// //                 height: 0.0,
// //               ),
// //         new SizedBox(
// //           width: 10.0,
// //         ),
// //         selected != null
// //             ? new Text(
// //                 "After",
// //                 style: new TextStyle(color: Colors.green, fontSize: 17.0),
// //               )
// //             : new SizedBox(
// //                 width: 0.0,
// //                 height: 0.0,
// //               ),
// //         new SizedBox(
// //           width: 10.0,
// //         ),
// //         selected != null
// //             ? new Text(
// //                 new DateFormat('yyyy-MM-dd').format(new DateTime.now()),
// //                 style: new TextStyle(color: Colors.green, fontSize: 17.0),
// //               )
// //             : new SizedBox(
// //                 width: 0.0,
// //                 height: 0.0,
// //               ),
// //         new SizedBox(
// //           width: 10.0,
// //         ),
// //         compareDates,
// //       ],
// //     );
// //     return new Scaffold(
// //         appBar: new AppBar(
// //           title: new Text(
// //             "Date and Time",
// //             style: new TextStyle(color: Colors.white),
// //           ),
// //           actions: <Widget>[
// //             new IconButton(
// //               icon: new Icon(
// //                 Icons.date_range,
// //                 color: Colors.white,
// //               ),
// //               onPressed: () => _showDateTimePicker(),
// //             )
// //           ],
// //         ),
// //         body: new Padding(
// //           padding: EdgeInsets.all(20.0),
// //           child: new Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: <Widget>[
// //               dateFormat_1,
// //               dateFormat_2,
// //               dateStringParsing,
// //               dateUtcLocal,
// //               new SizedBox(
// //                 height: 20.0,
// //               ),
// //               dateComapereFormat
// //             ],
// //           ),
// //         ));
// //   }
// // }
// // // now run this code and will see it's working as below.

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
// import '../screens/resources/colorRange.dart';

// void main() {
//   return runApp(MyApp());
// }

// /// My app class to display the date range picker
// class MyApp extends StatefulWidget {
//   @override
//   MyAppState createState() => MyAppState();
// }

// /// State for MyApp
// class MyAppState extends State<MyApp> {
//   List<DateTime> _specialDates;

//   @override
//   void initState() {
//     _specialDates = <DateTime>[
//       // DateTime.now().add(Duration(days: 2)),
//       // DateTime.now().add(Duration(days: 3)),
//       // DateTime.now().add(Duration(days: 6)),
//       // DateTime.now().add(Duration(days: 7)),
//       // DateTime.now().add(Duration(days: -2)),
//       // DateTime.now().add(Duration(days: -3)),
//       // DateTime.now().add(Duration(days: -6)),
//       // DateTime.now().add(Duration(days: -7))
//     ];
//     super.initState();
//     _specialDates.add(DateTime.now().subtract(const Duration(days: 1)));
//   }

//   String _selectedDate = '';
//   String _dateCount = '';
//   String _range = '';
//   String _rangeCount = '';

//   void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
//     setState(() {
//       if (args.value is PickerDateRange) {
//         _range =
//             DateFormat('dd/MM/yyyy').format(args.value.startDate).toString() +
//                 ' - ' +
//                 DateFormat('dd/MM/yyyy')
//                     .format(args.value.endDate ?? args.value.startDate)
//                     .toString();
//       } else if (args.value is DateTime) {
//         _selectedDate = args.value.toString();
//       } else if (args.value is List<DateTime>) {
//         _dateCount = args.value.length.toString();
//       } else {
//         _rangeCount = args.value.length.toString();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(
//               title: const Text('DatePicker demo'),
//             ),
//             body: Stack(
//               children: <Widget>[
//                 Positioned(
//                   left: 0,
//                   right: 0,
//                   top: 0,
//                   height: 80,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       // Text('Selected date: ' + _selectedDate),
//                       // Text('Selected date count: ' + _dateCount),
//                       // Text('Selected range: ' + _range),
//                       // Text('Selected ranges count: ' + _rangeCount)
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   left: 0,
//                   top: 80,
//                   right: 0,
//                   bottom: 0,
//                   child: SfDateRangePicker(
//                     monthViewSettings: DateRangePickerMonthViewSettings(
//                         specialDates: _specialDates),
//                     monthCellStyle: DateRangePickerMonthCellStyle(
//                         specialDatesTextStyle:
//                             const TextStyle(color: Colors.white),
//                         specialDatesDecoration: BoxDecoration(
//                             color: colorRange(),
//                             // color: Color(0xFFd97d71),
//                             border: Border.all(
//                                 color: const Color(0xFF2B732F), width: 1),
//                             shape: BoxShape.circle),
//                         todayTextStyle: TextStyle(
//                             fontStyle: FontStyle.italic,
//                             fontWeight: FontWeight.w800,
//                             fontSize: 18,
//                             color: Colors.red)),
//                     selectionColor: Colors.blueGrey,
//                     onSelectionChanged: _onSelectionChanged,
//                     // selectionMode: DateRangePickerSelectionMode.single,
//                     // initialSelectedDate:
//                     //     DateTime.now().subtract(const Duration(days: 4)),
//                     // initialSelectedRange: PickerDateRange(
//                     //   DateTime.now().subtract(const Duration(days: 4)),
//                     //   DateTime.now().add(const Duration(days: 3)),
//                     // ),
//                   ),
//                 )
//               ],
//             )));
//   }
// }
