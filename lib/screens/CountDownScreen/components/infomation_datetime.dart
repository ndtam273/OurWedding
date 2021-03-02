import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  @override
  void initState() {
    super.initState();
    _readSelectedDate();
  }

  _readSelectedDate() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    int readMicroSecond = shared.getInt('kDateTime');
    DateTime date = DateTime.fromMicrosecondsSinceEpoch(readMicroSecond);
    setState(() {
      _selectedDate = readMicroSecond > 0 ? date : null;
    });
  }

  _saveSelectedDate(DateTime picked) async {
    int saveMicroSecond = picked.microsecondsSinceEpoch;
    SharedPreferences shared = await SharedPreferences.getInstance();
    await shared.setInt('kDateTime', saveMicroSecond);
    setState(() {
      _selectedDate = picked;
    });
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
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != _selectedDate)
                  _saveSelectedDate(picked);
              },
              initialDateTime: _selectedDate,
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
    if (picked != null && picked != _selectedDate) _saveSelectedDate(picked);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      child: FlatButton(
        onPressed: () => _selectDate(context),
        child: Center(
          child: Text(
            _selectedDate == null
                ? 'Chọn Ngày'
                : DateFormat('yyyy-MM-dd').format(_selectedDate).toString(),
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
