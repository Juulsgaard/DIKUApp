import 'package:diku_app/views/CalendarView.dart';
import 'package:diku_app/views/LoginView.dart';
import 'package:diku_app/widgets/CalendarDay.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
	
	@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
	
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
	    initialRoute: "/login",
	    routes: {
      	"/": (context) => CalendarView(),
      	"/login": (context) => LoginView(),
		    "/calendar": (context) => CalendarView(),
      },
    );
  }
}
