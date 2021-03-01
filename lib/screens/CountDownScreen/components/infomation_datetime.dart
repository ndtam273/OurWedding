import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import './local_manager.dart';

class InfomationDateTimeItem extends StatefulWidget {
  final String title;

  InfomationDateTimeItem({
    this.title,
  });

  @override
  _InfomationDateTimeItemState createState() => _InfomationDateTimeItemState();
}

class _InfomationDateTimeItemState extends State<InfomationDateTimeItem> {
  DateTime _selectedDate;
  final oneSec = const Duration(seconds: 1);

  Timer _timer;
  int _difference = 0;

  startTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
    DateTime dateTimeNow = DateTime.now();
    final difference = dateTimeNow.difference(_selectedDate).inSeconds;

    setState(() {
      _difference = difference;
    });

    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_difference == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _difference--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  _selectDate(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
        return buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
        return buildCupertinoDatePicker(context);
      default:
        break;
    }
  }

  buildCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext builder) {
          return Container(
            height: 300,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.dateAndTime,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != _selectedDate)
                  setState(() {
                    _selectedDate = picked;
                  });
                // startTimer();
                // LocalManager().saveDateLocal(picked.toString());
              },
              initialDateTime: DateTime.now(), // _selectedDate,
              minimumYear: 2000,
              maximumYear: 2025,
            ),
          );
        });
  }

  buildMaterialDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      initialEntryMode: DatePickerEntryMode.calendar,
      initialDatePickerMode: DatePickerMode.day,
      helpText: 'Select booking date',
      cancelText: 'Not now',
      confirmText: 'Book',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      fieldLabelText: 'Booking date',
      fieldHintText: 'Month/Date/Year',
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      child: FlatButton(
        onPressed: () => _selectDate(context),
        child: Center(
          child: Text(
            _selectedDate == null //ternary expression to check if date is null
                ? widget.title
                // : LocalManager().getDateLocal(),
                // : "$_difference",
                : DateFormat('yyyy-MM-dd hh:mm:ss')
                    .format(_selectedDate)
                    .toString(),
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
