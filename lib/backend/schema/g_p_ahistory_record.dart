import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GPAhistoryRecord extends FirestoreRecord {
  GPAhistoryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Semester" field.
  DocumentReference? _semester;
  DocumentReference? get semester => _semester;
  bool hasSemester() => _semester != null;

  // "Semestername" field.
  String? _semestername;
  String get semestername => _semestername ?? '';
  bool hasSemestername() => _semestername != null;

  // "GPA" field.
  double? _gpa;
  double get gpa => _gpa ?? 0.0;
  bool hasGpa() => _gpa != null;

  // "Courses" field.
  DocumentReference? _courses;
  DocumentReference? get courses => _courses;
  bool hasCourses() => _courses != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _semester = snapshotData['Semester'] as DocumentReference?;
    _semestername = snapshotData['Semestername'] as String?;
    _gpa = castToType<double>(snapshotData['GPA']);
    _courses = snapshotData['Courses'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('GPAhistory')
          : FirebaseFirestore.instance.collectionGroup('GPAhistory');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('GPAhistory').doc(id);

  static Stream<GPAhistoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GPAhistoryRecord.fromSnapshot(s));

  static Future<GPAhistoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GPAhistoryRecord.fromSnapshot(s));

  static GPAhistoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GPAhistoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GPAhistoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GPAhistoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GPAhistoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GPAhistoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGPAhistoryRecordData({
  DocumentReference? semester,
  String? semestername,
  double? gpa,
  DocumentReference? courses,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Semester': semester,
      'Semestername': semestername,
      'GPA': gpa,
      'Courses': courses,
    }.withoutNulls,
  );

  return firestoreData;
}

class GPAhistoryRecordDocumentEquality implements Equality<GPAhistoryRecord> {
  const GPAhistoryRecordDocumentEquality();

  @override
  bool equals(GPAhistoryRecord? e1, GPAhistoryRecord? e2) {
    return e1?.semester == e2?.semester &&
        e1?.semestername == e2?.semestername &&
        e1?.gpa == e2?.gpa &&
        e1?.courses == e2?.courses;
  }

  @override
  int hash(GPAhistoryRecord? e) => const ListEquality()
      .hash([e?.semester, e?.semestername, e?.gpa, e?.courses]);

  @override
  bool isValidKey(Object? o) => o is GPAhistoryRecord;
}
