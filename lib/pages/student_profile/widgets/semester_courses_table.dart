
import 'dart:math';

import 'package:flutter/material.dart';

class Course {
  final String courseCode;
  final String courseName;
  final String gpa;

  Course({required this.courseCode, required this.courseName, required this.gpa});
}

class MyTable extends StatelessWidget {
  final List<Course> courses;

  MyTable({required this.courses});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.grey),
      children: [
        buildTableHeaderRow(),
        ...buildTableRows(),
      ],
    );
  }

  TableRow buildTableHeaderRow() {
    return TableRow(
      children: [
        buildTableHeaderCell('Course Code'),
        buildTableHeaderCell('Course Name'),
        buildTableHeaderCell('GPA'),
      ],
    );
  }

  List<TableRow> buildTableRows() {
    return courses.map((course) {
      return TableRow(
        children: [
          buildTableCell(course.courseCode),
          buildTableCell(course.courseName),
          buildTableCell(course.gpa),
        ],
      );
    }).toList();
  }

  Widget buildTableHeaderCell(String text) {
    return Container(
      height: 50,
      color: Colors.grey,
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget buildTableCell(String text) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Text(text,style: TextStyle(color: Colors.grey.shade900),),
      ),
    );
  }
}


final List<String> gpaList = ['A+', 'A-', 'B+', 'B-', 'C+', 'C-'];

List<Course> generateRandomCourses(int count) {
  final random = Random();
  final List<Course> courses = [];

  for (int i = 0; i < count; i++) {
    final gpaIndex = random.nextInt(gpaList.length);
    final course = Course(
      courseCode: 'C-${random.nextInt(100)}',
      courseName: 'Course ${i + 1}',
      gpa: gpaList[gpaIndex],
    );
    courses.add(course);
  }

  return courses;
}