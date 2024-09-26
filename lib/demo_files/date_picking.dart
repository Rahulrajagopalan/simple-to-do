import 'package:flutter/material.dart';

class DatePicking extends StatefulWidget {
  const DatePicking({super.key});

  @override
  State<DatePicking> createState() => _DatePickingState();
}

class _DatePickingState extends State<DatePicking> {

  Future<DateTime> pickDate() async {
    var selectedDate = await showDatePicker(
        context: context, firstDate: DateTime(2021), lastDate: DateTime(2025));
    if (selectedDate != null) {
      return selectedDate;
    }
    return DateTime.now();
  }

  // DateTime datePicked = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  pickDate().then((onValue) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text("${onValue.toString().split(" ").first}")));
                  });
                },
                child: Text("Open Date Picker")),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return TimePickerDialog(initialTime: TimeOfDay.now());
                      });
                },
                child: Text("Open Time Picker"))
          ],
        ),
      ),
    );
  }
}
