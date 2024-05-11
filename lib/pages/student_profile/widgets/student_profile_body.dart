import 'dart:math';

import 'package:acadmic_advising_platform_k_s_i_u/pages/student_profile/widgets/semester_courses_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/flutter_flow/flutter_flow_animations.dart';

class StudentProfileBody extends StatelessWidget {
  const StudentProfileBody({
    super.key,
    required this.animationsMap,
  });

  final Map<String, AnimationInfo> animationsMap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .6,
      child: ListView.separated(
        itemCount: 8,
        shrinkWrap: true,
        itemBuilder: (c, i) => CourseItem(),
        separatorBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Divider(
              color: Colors.grey,
            ),
          );
        },
      ),
    );
  }
}

class CourseItem extends StatefulWidget {
  const CourseItem({
    super.key,
  });

  @override
  State<CourseItem> createState() => _CourseItemState();
}

class _CourseItemState extends State<CourseItem> with AutomaticKeepAliveClientMixin{
  bool isExpanded = true;

  void toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Course> courses = generateRandomCourses(5);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ExpansionTile(
        iconColor: Colors.grey,
        dense: true,
        collapsedIconColor: Colors.grey.shade900,
        title: Text(
          'March 2023',
          style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w900),
        ),
        children: [
          Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'any Data here',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 10,),
                    SimesterCoursesTable(courses: courses)
                  ],
                ),
              ))
        ],
        initiallyExpanded: isExpanded,
        onExpansionChanged: (expanded) {
          setState(() {
            isExpanded = expanded;
          });
        },
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}



