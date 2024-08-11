import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderPage extends StatefulWidget {
  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;

  DateTime _focusedDay = DateTime.now();

  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF26235C),
      appBar: AppBar(
        backgroundColor: Color(0xFF26235C),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: () {},
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, User',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cloudy',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                Text(
                  '21°C',
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
              ],
            ),
        SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFF3E3A84),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.white24,
                blurRadius: 20.0,
                spreadRadius: 10.0,
              )
            ],
          ),
          padding: EdgeInsets.all(16),
          child: TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                defaultTextStyle: TextStyle(color: Colors.white),
                weekendTextStyle: TextStyle(color: Colors.white70),
              ),
              headerStyle: HeaderStyle(
                titleTextStyle: TextStyle(color: Colors.white),
                formatButtonTextStyle: TextStyle(color: Colors.white),
                formatButtonDecoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(16.0),
                ),
          ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.white),
              weekendStyle: TextStyle(color: Colors.white70),
            ),
          )
        ),
          ],
        ),
      ),
    );
  }
}
