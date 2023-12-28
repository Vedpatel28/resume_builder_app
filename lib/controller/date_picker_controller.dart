import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:resume_builder_app/model/variable_model.dart';

class DatePickerController extends ChangeNotifier {
  DateTime? date = DateTime.now();
  TimeOfDay? time = TimeOfDay.now();

  init() {
    VariableModal.dob.text = "";
    ChangeNotifier();
  }

  setDate() {
    String dateFormat = DateFormat("yMMMd").format(date!).toString();
    VariableModal.dob.text = dateFormat.toString();
    ChangeNotifier();
  }
}
