import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExperienceRecord extends FirestoreRecord {
  ExperienceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "company" field.
  String? _company;
  String get company => _company ?? '';
  bool hasCompany() => _company != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  bool hasYear() => _year != null;

  void _initializeFields() {
    _company = snapshotData['company'] as String?;
    _role = snapshotData['role'] as String?;
    _year = snapshotData['year'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('experience');

  static Stream<ExperienceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExperienceRecord.fromSnapshot(s));

  static Future<ExperienceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExperienceRecord.fromSnapshot(s));

  static ExperienceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExperienceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExperienceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExperienceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExperienceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExperienceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExperienceRecordData({
  String? company,
  String? role,
  String? year,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'company': company,
      'role': role,
      'year': year,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExperienceRecordDocumentEquality implements Equality<ExperienceRecord> {
  const ExperienceRecordDocumentEquality();

  @override
  bool equals(ExperienceRecord? e1, ExperienceRecord? e2) {
    return e1?.company == e2?.company &&
        e1?.role == e2?.role &&
        e1?.year == e2?.year;
  }

  @override
  int hash(ExperienceRecord? e) =>
      const ListEquality().hash([e?.company, e?.role, e?.year]);

  @override
  bool isValidKey(Object? o) => o is ExperienceRecord;
}
