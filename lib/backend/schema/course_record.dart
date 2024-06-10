import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseRecord extends FirestoreRecord {
  CourseRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "CourseCode" field.
  DocumentReference? _courseCode;
  DocumentReference? get courseCode => _courseCode;
  bool hasCourseCode() => _courseCode != null;

  // "CourseID" field.
  String? _courseID;
  String get courseID => _courseID ?? '';
  bool hasCourseID() => _courseID != null;

  // "Credits" field.
  int? _credits;
  int get credits => _credits ?? 0;
  bool hasCredits() => _credits != null;

  // "CourseName" field.
  String? _courseName;
  String get courseName => _courseName ?? '';
  bool hasCourseName() => _courseName != null;

  // "CourseDescription" field.
  String? _courseDescription;
  String get courseDescription => _courseDescription ?? '';
  bool hasCourseDescription() => _courseDescription != null;

  void _initializeFields() {
    _courseCode = snapshotData['CourseCode'] as DocumentReference?;
    _courseID = snapshotData['CourseID'] as String?;
    _credits = castToType<int>(snapshotData['Credits']);
    _courseName = snapshotData['CourseName'] as String?;
    _courseDescription = snapshotData['CourseDescription'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Course');

  static Stream<CourseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CourseRecord.fromSnapshot(s));

  static Future<CourseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CourseRecord.fromSnapshot(s));

  static CourseRecord fromSnapshot(DocumentSnapshot snapshot) => CourseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CourseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CourseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CourseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CourseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCourseRecordData({
  DocumentReference? courseCode,
  String? courseID,
  int? credits,
  String? courseName,
  String? courseDescription,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CourseCode': courseCode,
      'CourseID': courseID,
      'Credits': credits,
      'CourseName': courseName,
      'CourseDescription': courseDescription,
    }.withoutNulls,
  );

  return firestoreData;
}

class CourseRecordDocumentEquality implements Equality<CourseRecord> {
  const CourseRecordDocumentEquality();

  @override
  bool equals(CourseRecord? e1, CourseRecord? e2) {
    return e1?.courseCode == e2?.courseCode &&
        e1?.courseID == e2?.courseID &&
        e1?.credits == e2?.credits &&
        e1?.courseName == e2?.courseName &&
        e1?.courseDescription == e2?.courseDescription;
  }

  @override
  int hash(CourseRecord? e) => const ListEquality().hash([
        e?.courseCode,
        e?.courseID,
        e?.credits,
        e?.courseName,
        e?.courseDescription
      ]);

  @override
  bool isValidKey(Object? o) => o is CourseRecord;
}
