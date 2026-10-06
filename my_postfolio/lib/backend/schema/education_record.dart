import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EducationRecord extends FirestoreRecord {
  EducationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "field" field.
  String? _field;
  String get field => _field ?? '';
  bool hasField() => _field != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "qualification" field.
  String? _qualification;
  String get qualification => _qualification ?? '';
  bool hasQualification() => _qualification != null;

  // "university" field.
  String? _university;
  String get university => _university ?? '';
  bool hasUniversity() => _university != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  bool hasYear() => _year != null;

  void _initializeFields() {
    _field = snapshotData['field'] as String?;
    _image = snapshotData['image'] as String?;
    _qualification = snapshotData['qualification'] as String?;
    _university = snapshotData['university'] as String?;
    _year = snapshotData['year'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('education');

  static Stream<EducationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EducationRecord.fromSnapshot(s));

  static Future<EducationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EducationRecord.fromSnapshot(s));

  static EducationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EducationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EducationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EducationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EducationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EducationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEducationRecordData({
  String? field,
  String? image,
  String? qualification,
  String? university,
  String? year,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'field': field,
      'image': image,
      'qualification': qualification,
      'university': university,
      'year': year,
    }.withoutNulls,
  );

  return firestoreData;
}

class EducationRecordDocumentEquality implements Equality<EducationRecord> {
  const EducationRecordDocumentEquality();

  @override
  bool equals(EducationRecord? e1, EducationRecord? e2) {
    return e1?.field == e2?.field &&
        e1?.image == e2?.image &&
        e1?.qualification == e2?.qualification &&
        e1?.university == e2?.university &&
        e1?.year == e2?.year;
  }

  @override
  int hash(EducationRecord? e) => const ListEquality()
      .hash([e?.field, e?.image, e?.qualification, e?.university, e?.year]);

  @override
  bool isValidKey(Object? o) => o is EducationRecord;
}
