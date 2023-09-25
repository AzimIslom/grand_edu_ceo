import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grand_edu_ceo/models/attendence_model.dart';
import 'package:grand_edu_ceo/models/branch_model.dart';
import 'package:grand_edu_ceo/models/group_model.dart';
import 'package:grand_edu_ceo/models/reception_model.dart';
import 'package:grand_edu_ceo/models/student_model.dart';
import 'package:grand_edu_ceo/models/support_model.dart';
import 'package:grand_edu_ceo/models/teacher_model.dart';

import '../utils/api.dart';

final fb = FBService();
final _fb = FirebaseFirestore.instance;

class FBService {
  //add
  Future<String?> addTeacher(TeacherModel teacher) async {
    try {
      await _fb
          .collection(api.apiTeachers)
          .doc(teacher.tel)
          .set(teacher.toJson());
      return null;
    } catch (e) {
      print("addTeacher: $e\n\n\n\n\n\n\n\n");
      return e.toString();
    }
  }

  Future<String?> addStudent(StudentModel student) async {
    try {
      await _fb
          .collection(api.apiStudents)
          .doc(student.tel)
          .set(student.toJson());
      await addStudentGroup(student.groupId, student.tel);
      return null;
    } catch (e) {
      print("addStudent: $e\n\n\n\n\n\n\n\n");
      return e.toString();
    }
  }

  Future<String?> addReception(ReceptionModel reception) async {
    try {
      await _fb
          .collection(api.apiReceptions)
          .doc(reception.tel)
          .set(reception.toJson());
      return null;
    } catch (e) {
      print("addReception: $e\n\n\n\n\n\n\n\n");
      return e.toString();
    }
  }

  Future<String?> addSupport(SupportModel support) async {
    try {
      await _fb
          .collection(api.apiSupports)
          .doc(support.tel)
          .set(support.toJson());
      return null;
    } catch (e) {
      print("addSupport: $e\n\n\n\n\n\n\n\n");
      return e.toString();
    }
  }

  Future<String?> addGroup(GroupModel group) async {
    try {
      await _fb.collection(api.group).add(group.toJson()).then((value) async {
        group.id = value.id;
        await _fb.collection(api.group).doc(value.id).set(group.toJson());
        await addGroupTeacher(group.id, group.teacherId);
      });
      return null;
    } catch (e) {
      print("addGroup: $e\n\n\n\n\n\n\n\n");
      return e.toString();
    }
  }

  Future<String?> addBranch(BranchModel branch) async {
    try {
      await _fb.collection(api.branch).add(branch.toJson()).then((value) async {
        branch.id = value.id;
        await _fb.collection(api.branch).doc(value.id).set(branch.toJson());
      });
      return null;
    } catch (e) {
      print("addBranch: $e\n\n\n\n\n\n\n\n");
      return e.toString();
    }
  }

//************************************************
//************************************************
//************************************************
  /// get
  Future<List<TeacherModel>> teachers() async {
    try {
      final data = await _fb.collection(api.apiTeachers).get();
      final result = data.docs
          .map(
            (e) => TeacherModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return result;
    } catch (e) {
      print("teachers: $e\n\n\n\n\n\n\n\n");
      return [];
    }
  }

  Future<List<ReceptionModel>> receptions() async {
    try {
      final data = await _fb.collection(api.apiReceptions).get();
      final result = data.docs
          .map(
            (e) => ReceptionModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return result;
    } catch (e) {
      print("teachers: $e\n\n\n\n\n\n\n\n");
      return [];
    }
  }

  Future<List<SupportModel>> supports() async {
    try {
      final data = await _fb.collection(api.apiSupports).get();
      final result = data.docs
          .map(
            (e) => SupportModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return result;
    } catch (e) {
      print("teachers: $e\n\n\n\n\n\n\n\n");
      return [];
    }
  }

  Future<List<GroupModel>> groups() async {
    try {
      final data = await _fb.collection(api.group).get();
      final result = data.docs
          .map(
            (e) => GroupModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return result;
    } catch (e) {
      print("groups: $e\n\n\n\n\n\n\n\n");
      return [];
    }
  }

  Future<List<BranchModel>> branches() async {
    try {
      final data = await _fb.collection(api.branch).get();
      final result = data.docs
          .map(
            (e) => BranchModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return result;
    } catch (e) {
      print("groups: $e\n\n\n\n\n\n\n\n");
      return [];
    }
  }

  Future<List<StudentModel>> students() async {
    try {
      final data = await _fb.collection(api.apiStudents).get();
      final result = data.docs
          .map(
            (e) => StudentModel.fromJson(
              e.data(),
            ),
          )
          .toList();
      return result;
    } catch (e) {
      print("students: $e\n\n\n\n\n\n\n\n");
      return [];
    }
  }

  Future<List<AttendanceModel>> attendance(GroupModel group) async {
    final time = group.lessons.last;
    final data = await _fb
        .collection(api.table)
        .doc(group.id)
        .collection(
          "${time.year}${time.month}${time.day}",
        )
        .get();
    return data.docs
        .map(
          (e) => AttendanceModel.fromJson(
            e.data(),
          ),
        )
        .toList();
  }

//************************************************
//************************************************
//************************************************
//specific
  Future<GroupModel> specialGroup(String id) async {
    final data = await _fb.collection(api.group).doc(id).get();
    return GroupModel.fromJson(data.data()!);
  }

  Future<TeacherModel> specialTeacher(String id) async {
    final data = await _fb.collection(api.apiTeachers).doc(id).get();
    return TeacherModel.fromJson(data.data()!);
  }

  Future<ReceptionModel> specialReception(String id) async {
    final data = await _fb.collection(api.apiReceptions).doc(id).get();
    return ReceptionModel.fromJson(data.data()!);
  }

  Future<StudentModel> specialStudent(String id) async {
    final data = await _fb.collection(api.apiStudents).doc(id).get();
    return StudentModel.fromJson(data.data()!);
  }

  Future<BranchModel> specialBranch(String id) async {
    final data = await _fb.collection(api.branch).doc(id).get();
    return BranchModel.fromJson(data.data()!);
  }

//************************************************
//************************************************
//************************************************
  //update
  Future<void> addGroupTeacher(String group, String teacher) async {
    final t = await specialTeacher(teacher);
    t.groups.add(group);
    saveTeacher(t);
  }

  Future<void> addStudentGroup(String group, String student) async {
    final g = await specialGroup(group);
    g.students.add(student);
    await updateGroup(g);
  }

  Future<void> updateGroup(GroupModel group) async {
    await _fb.collection(api.group).doc(group.id).update(group.toJson());
  }

  Future<void> saveTeacher(TeacherModel teacher) async {
    await _fb
        .collection(api.apiTeachers)
        .doc(teacher.tel)
        .update(teacher.toJson());
  }

  Future<void> saveReception(ReceptionModel reception) async {
    await _fb
        .collection(api.apiReceptions)
        .doc(reception.tel)
        .update(reception.toJson());
  }
}
