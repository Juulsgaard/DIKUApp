import 'dart:async';

import 'package:diku_app/tools/api.dart';
import 'package:diku_app/widgets/CalendarLecture.dart';
import 'package:flutter/material.dart';

class CalendarDay extends StatefulWidget {
	
  @override
  _CalenderDayState createState() => _CalenderDayState();
}

class _CalenderDayState extends State<CalendarDay>
{
	List<LectureEntity> lectures = [
		LectureEntity(
				name: "First Lecture",
				duration: 1,
				location: "Store UP1",
				startTime: 9),
		LectureEntity(
				name: "Second Lecture",
				duration: 2,
				location: "Store UP1",
				startTime: 12),
	];
	
  @override
  Widget build(BuildContext context) {
	  return RefreshIndicator(
		  child: ListView(
			  children: getLectures(),
		  ), onRefresh: loadData
	  );
  }

  List<CalendarLecture> getLectures() {
	  var list = List<CalendarLecture>();
	  for (int i = 8; i < 17; i++) {
		  var lecture = lectures.singleWhere((x) => x.startTime == i,
				  orElse: () => LectureEntity(startTime: i, duration: 1));
		  list.add(CalendarLecture(lecture));
		  i += lecture.duration - 1;
	  }
	  return list;
  }

  Future<void> loadData() async {
  	List data = await Api.apiCall("GET", "/calendar/today");
  	
  	setState(() {
  	  lectures = data.map((x) => LectureEntity(
		    startTime: (x["start"] as int),
		    duration: x["duration"],
		    location: x["room"],
		    name: x["title"] as String,
	    )).toList();
  	});
  	
	  return;
  }
}
