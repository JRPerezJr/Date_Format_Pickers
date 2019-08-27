import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime _currentDate = new DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime _pickDate = await showDatePicker(
        context: context,
        initialDate: _currentDate,
        firstDate: DateTime(1990),
        lastDate: DateTime(2020),
        builder: (context, child) {
          return SingleChildScrollView(
            child: child,
          );
        });

    if (_pickDate != null) {
      setState(() {
        _currentDate = _pickDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String _formatedDate = new DateFormat.yMMMd().format(_currentDate);
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Date'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _selectDate(context);
            },
            icon: Icon(Icons.calendar_today),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Date: $_formatedDate',
          style: TextStyle(fontSize: 30.0, color: Colors.pinkAccent),
        ),
      ),
    );
  }
}
