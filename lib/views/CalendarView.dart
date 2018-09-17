import 'package:diku_app/widgets/CalendarDay.dart';
import 'package:flutter/material.dart';

class CalendarView extends StatefulWidget
{
  @override
  createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView>
{
  @override
  Widget build(BuildContext context) {
    return CalendarDay();
  }
}