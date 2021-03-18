import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:source_code/providers/user_app.dart';

class DateTimeWeddingItem extends StatelessWidget {
  _selectDate(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    assert(theme.platform != null);
    switch (theme.platform) {
      case TargetPlatform.android:
        return _buildMaterialDatePicker(context);
      case TargetPlatform.iOS:
        return _buildCupertinoDatePicker(context);
      default:
        print('${theme.platform} not handle');
        break;
    }
  }

  _buildCupertinoDatePicker(BuildContext ctx) {
    final userAppData = Provider.of<UserApp>(
      ctx,
      listen: false,
    );
    final dateTimeData = userAppData.weddingDay;

    showModalBottomSheet(
        context: ctx,
        builder: (BuildContext builder) {
          return Container(
            height: 330,
            color: Colors.white,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: dateTimeData,
              minimumYear: 2000,
              maximumYear: 2125,
              onDateTimeChanged: (picked) {
                if (picked != null && picked != dateTimeData) {
                  userAppData.updateWeddingDay(picked);
                }
              },
            ),
          );
        });
  }

  _buildMaterialDatePicker(BuildContext ctx) async {
    final userAppData = Provider.of<UserApp>(
      ctx,
      listen: false,
    );
    final dateTimeData = userAppData.weddingDay;

    final DateTime picked = await showDatePicker(
      context: ctx,
      initialDate: dateTimeData,
      firstDate: DateTime(2000),
      lastDate: DateTime(2125),
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
    if (picked != null && picked != dateTimeData) {
      userAppData.updateWeddingDay(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userAppData = Provider.of<UserApp>(context);
    final dateTimeData = userAppData.weddingDay;

    return Container(
      height: 60,
      width: double.infinity,
      child: FlatButton(
        onPressed: () => _selectDate(context),
        child: Center(
          child: Text(
            dateTimeData == null
                ? 'Chọn Ngày'
                : DateFormat('dd-MM-yyyy').format(dateTimeData).toString(),
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
