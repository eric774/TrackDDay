import 'package:flutter/material.dart';
import 'package:circle_checkbox/redev_checkbox.dart';
// import 'package:minor_project_1/models/task_data.dart';
import 'package:minor_project_1/screens/day_task_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:numberpicker/numberpicker.dart';

var scoreSum = 0;
List scoresList = [];
// final int taskScore = 0;
var avgScore = 0;

SharedPreferences item;

class DayTaskTile extends StatefulWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressCallback;
  int score;

  DayTaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkboxCallback,
      this.longPressCallback,
      this.score});

  @override
  _DayTaskTileState createState() => _DayTaskTileState();
}

class _DayTaskTileState extends State<DayTaskTile> {
  double _currentSliderValue = 0;
  // int _currentValue = 4;

  @override
  Widget build(BuildContext context) {
    // scores.add(widget.score);
    avgScore = scoreSum ~/ (count * 10);
    return ListTile(
      leading: CircleCheckbox(
        value: widget.isChecked,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        checkColor: Colors.white,
        activeColor: Colors.green,
        onChanged: widget.checkboxCallback,
      ),
      // leading: Checkbox(
      //   value: widget.isChecked,
      //   onChanged: widget.checkboxCallback,
      // ),
      onLongPress: widget.longPressCallback,
      // isThreeLine: true,
      title: Text(
        widget.taskTitle,
        style: TextStyle(
            decoration: widget.isChecked ? TextDecoration.lineThrough : null),
      ),
      // trailing: NumberPicker(
      //   value: _currentValue,
      //   minValue: 0,
      //   maxValue: 100,
      //   step: 10,
      //   itemHeight: 100,
      //   axis: Axis.horizontal,
      //   onChanged: (value) => setState(() => _currentValue = value),
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(16),
      //     border: Border.all(color: Colors.black26),
      //   ),
      // ),

      subtitle: widget.isChecked
          ? Slider(
              activeColor: Colors.green,
              value: _currentSliderValue,
              min: 0,
              max: 100,
              divisions: 5,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                  // scores.add(_currentSliderValue.toInt());
                });
                // print(scoresList);
              },
              onChangeEnd: (value) {
                widget.score = value.toInt();
                // print(widget.score);
                scoresList.add(value.toInt());
                scoreSum = scoresList.reduce((a, b) => a + b);
                print(scoreSum);
              },
              onChangeStart: (value) {
                if (scoresList != []) {
                  scoresList.remove(value);
                }
              },
            )
          : null,
    );
  }
}

// Color colorRange() {
//   if (avgScore == 0) {
//     return Color(0xFFd97d71);
//   } else if (avgScore == 10) {
//     return Color(0xFF32a2a8);
//   } else if (avgScore > 0 && avgScore < 5) {
//     return Color(0xFFd9a871);
//   } else if (avgScore == 5) {
//     return Color(0xFF4632a8);
//   } else {
//     return Color(0xFF3ea832);
//   }
// }
