import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:baby_tracker_app/app/app.dart';

class DateButton extends StatelessWidget {
  final CalenderViewModel calenderViewmodel;

  const DateButton({super.key, required this.calenderViewmodel});

  @override
  Widget build(BuildContext context) {
    var locale = Localizations.localeOf(context).toString();
    return Observer(
      builder: (context) {
        return TextButton(
          onPressed: () async {
            final DateTime? date = await showDatePicker(
              context: context,
              locale: Localizations.localeOf(context),
              initialDate: calenderViewmodel.selectedDate,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (date != null && date != calenderViewmodel.selectedDate) {
              calenderViewmodel.setSelectedDate(date);
            }
          },
          child: Text(
            DateFormat('EEE, MMM d', locale).format(calenderViewmodel.selectedDate),
            style: TextStyle(fontSize: 20.spMin, fontWeight: FontWeight.w500, color: ColorConst.cblack),
          ),
        );
      },
    );
  }
}
