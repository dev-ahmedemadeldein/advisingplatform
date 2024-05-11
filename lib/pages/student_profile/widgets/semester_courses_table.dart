
import 'dart:math';

import 'package:flutter/material.dart';

class Course {
  final String courseCode;
  final String courseName;
  final double gpa;

  Course({required this.courseCode, required this.courseName, required this.gpa});
}

class SimesterCoursesTable extends StatelessWidget {
  final List<Course> courses;

  SimesterCoursesTable({required this.courses});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.grey),
      children: [
        buildTableHeaderRow(),
        ...buildTableRows(),
        buildAverageGPARow(),
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
          buildTableCell(course.gpa.toString()),
        ],
      );
    }).toList();
  }

  TableRow buildAverageGPARow() {
    final averageGPA = calculateAverageGPA();

    return TableRow(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey),
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      children: [
        buildTableCell('', hasBorder: false),
        buildTableCell('Average GPA:', hasBorder: false),
        buildTableCell(averageGPA.toStringAsFixed(2), hasBorder: true),
      ],
    );
  }

  double calculateAverageGPA() {
    if (courses.isEmpty) return 0.0;

    final totalGPA = courses.map((course) => course.gpa).reduce((a, b) => a + b);
    return totalGPA / courses.length;
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

  Widget buildTableCell(String text, {bool hasBorder = true}) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: hasBorder ? Border.all(color: Colors.grey) : null,
      ),
      child: Center(
        child: Text(text,style: TextStyle(color: Colors.grey.shade900),),
      ),
    );
  }
}

List<Course> generateRandomCourses(int count) {
  final random = Random();
  final List<Course> courses = [];

  for (int i = 0; i < count; i++) {
    final course = Course(
      courseCode: 'C-${random.nextInt(100)}',
      courseName: 'Course ${i + 1}',
      gpa: (random.nextDouble() * 4.0).toDouble(),
    );
    courses.add(course);
  }

  return courses;
}