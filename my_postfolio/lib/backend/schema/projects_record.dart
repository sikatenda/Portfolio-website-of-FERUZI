import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectsRecord extends FirestoreRecord {
  ProjectsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "imge" field.
  String? _imge;
  String get imge => _imge ?? '';
  bool hasImge() => _imge != null;

  // "github" field.
  String? _github;
  String get github => _github ?? '';
  bool hasGithub() => _github != null;

  // "project" field.
  String? _project;
  String get project => _project ?? '';
  bool hasProject() => _project != null;

  // "skill" field.
  String? _skill;
  String get skill => _skill ?? '';
  bool hasSkill() => _skill != null;

  // "tools" field.
  String? _tools;
  String get tools => _tools ?? '';
  bool hasTools() => _tools != null;

  // "app" field.
  String? _app;
  String get app => _app ?? '';
  bool hasApp() => _app != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _imge = snapshotData['imge'] as String?;
    _github = snapshotData['github'] as String?;
    _project = snapshotData['project'] as String?;
    _skill = snapshotData['skill'] as String?;
    _tools = snapshotData['tools'] as String?;
    _app = snapshotData['app'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('projects');

  static Stream<ProjectsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProjectsRecord.fromSnapshot(s));

  static Future<ProjectsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProjectsRecord.fromSnapshot(s));

  static ProjectsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProjectsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProjectsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProjectsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProjectsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProjectsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProjectsRecordData({
  String? name,
  String? description,
  String? imge,
  String? github,
  String? project,
  String? skill,
  String? tools,
  String? app,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'imge': imge,
      'github': github,
      'project': project,
      'skill': skill,
      'tools': tools,
      'app': app,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProjectsRecordDocumentEquality implements Equality<ProjectsRecord> {
  const ProjectsRecordDocumentEquality();

  @override
  bool equals(ProjectsRecord? e1, ProjectsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.imge == e2?.imge &&
        e1?.github == e2?.github &&
        e1?.project == e2?.project &&
        e1?.skill == e2?.skill &&
        e1?.tools == e2?.tools &&
        e1?.app == e2?.app;
  }

  @override
  int hash(ProjectsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.imge,
        e?.github,
        e?.project,
        e?.skill,
        e?.tools,
        e?.app
      ]);

  @override
  bool isValidKey(Object? o) => o is ProjectsRecord;
}
