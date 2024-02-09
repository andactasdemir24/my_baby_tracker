// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:baby_tracker_app/app/app.dart';

// ... (imports)

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    Key? key,
    required this.vaccineViewModel,
    required this.text,
    this.color,
  }) : super(key: key);

  final VaccineViewModel vaccineViewModel;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    vaccineViewModel.fillList(context);
    return Observer(
      builder: (context) {
        return ConstrainedBox(
          constraints:
              BoxConstraints.tightFor(height: displayHeight(context) * 0.08, width: displayWidth(context) * 0.88),
          child: DropdownButtonFormField<String>(
            borderRadius: BorderRadius.circular(20),
            isExpanded: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(
                  bottom: displayHeight(context) * 0.03, top: displayHeight(context) * 0.025, left: 10.0, right: 10),
              filled: true,
              fillColor: ColorConst.annualColor,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
            ),
            hint: Text(text, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
            value: vaccineViewModel.dropdownValue,
            onChanged: (String? newValue) {
              vaccineViewModel.vaccineController.text = newValue!;
              vaccineViewModel.changeVisible();
            },
            items: vaccineViewModel.list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
