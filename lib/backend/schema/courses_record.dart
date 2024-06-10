import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursesRecord extends FirestoreRecord {
  CoursesRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "CourseRef" field.
  DocumentReference? _courseRef;
  DocumentReference? get courseRef => _courseRef;
  bool hasCourseRef() => _courseRef != null;

  // "CourseName" field.
  String? _courseName;
  String get courseName => _courseName ?? '';
  bool hasCourseName() => _courseName != null;

  // "CourseID" field.
  String? _courseID;
  String get courseID => _courseID ?? '';
  bool hasCourseID() => _courseID != null;

  // "Grade" field.
  String? _grade;
  String get grade => _grade ?? '';
  bool hasGrade() => _grade != null;

  // "Credits" field.
  int? _credits;
  int get credits => _credits ?? 0;
  bool hasCredits() => _credits != null;

  // "corequisites" field.
  List<String>? _corequisites;
  List<String> get corequisites => _corequisites ?? const [];
  bool hasCorequisites() => _corequisites != null;

  // "prerequisites" field.
  List<String>? _prerequisites;
  List<String> get prerequisites => _prerequisites ?? const [];
  bool hasPrerequisites() => _prerequisites != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _courseRef = snapshotData['CourseRef'] as DocumentReference?;
    _courseName = snapshotData['CourseName'] as String?;
    _courseID = snapshotData['CourseID'] as String?;
    _grade = snapshotData['Grade'] as String?;
    _credits = castToType<int>(snapshotData['Credits']);
    _corequisites = getDataList(snapshotData['corequisites']);
    _prerequisites = getDataList(snapshotData['prerequisites']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Courses')
          : FirebaseFirestore.instance.collectionGroup('Courses');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Courses').doc(id);

  static Stream<CoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoursesRecord.fromSnapshot(s));

  static Future<CoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoursesRecord.fromSnapshot(s));

  static CoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoursesRecordData({
  DocumentReference? courseRef,
  String? courseName,
  String? courseID,
  String? grade,
  int? credits,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CourseRef': courseRef,
      'CourseName': courseName,
      'CourseID': courseID,
      'Grade': grade,
      'Credits': credits,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoursesRecordDocumentEquality implements Equality<CoursesRecord> {
  const CoursesRecordDocumentEquality();

  @override
  bool equals(CoursesRecord? e1, CoursesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.courseRef == e2?.courseRef &&
        e1?.courseName == e2?.courseName &&
        e1?.courseID == e2?.courseID &&
        e1?.grade == e2?.grade &&
        e1?.credits == e2?.credits &&
        listEquality.equals(e1?.corequisites, e2?.corequisites) &&
        listEquality.equals(e1?.prerequisites, e2?.prerequisites);
  }

  @override
  int hash(CoursesRecord? e) => const ListEquality().hash([
        e?.courseRef,
        e?.courseName,
        e?.courseID,
        e?.grade,
        e?.credits,
        e?.corequisites,
        e?.prerequisites
      ]);

  @override
  bool isValidKey(Object? o) => o is CoursesRecord;
}
