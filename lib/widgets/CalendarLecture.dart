import 'package:flutter/material.dart';

class CalendarLecture extends StatelessWidget {
	final LectureEntity _lecture;
	
	CalendarLecture(this._lecture);
	
	@override
	Widget build(BuildContext context) {
		return Column(
			children: <Widget>[
				Text(
						"${_lecture.startTime.toString().padLeft(2, "0")}:00 - ${(_lecture
								.startTime + _lecture.duration).toString().padLeft(
								2, "0")}:00"),
				ConstrainedBox(
					constraints: BoxConstraints(
							minHeight: 80.0 * _lecture.duration, minWidth: double.infinity),
					child: Opacity(
						opacity: _lecture.name != null ? 1.0 : 0.0,
						child: Card(
							color: Theme
									.of(context)
									.primaryColor,
							child: _lecture.name != null
									? Container(
								margin: EdgeInsets.all(10.0),
								child: Column(
									children: <Widget>[
										Text(
											_lecture.name,
											style: TextStyle(
												color: Theme
														.of(context)
														.primaryColorLight,
												fontWeight: FontWeight.bold,
												fontSize: 24.0,
											),
										),
										Text(_lecture.location),
									],
								),
							)
									: null,
						),
					),
				),
				Divider(),
			],
		);
	}
}

class LectureEntity {
	final int startTime;
	final int duration;
	final String name;
	final String location;
	
	LectureEntity({this.startTime, this.duration, this.name, this.location});
}