part of 'imports.dart';

class GroupDetailPage extends StatelessWidget {
  final GroupModel group;
  final TeacherModel teacher;

  const GroupDetailPage({
    Key? key,
    required this.group,
    required this.teacher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StudentVM>(
      create: (_) => StudentVM(),
      child: FutureBuilder<List<StudentModel>>(
          future: _getStudents(group.students),
          builder: (context, snap) {
            final data = snap.data ?? [];
            return Scaffold(
              appBar: _appBar(context, teacher, group),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  child: Consumer<StudentVM>(
                    builder: (context, vm, _) {
                      return Column(
                        children: [
                          _Item(group: group, teacher: teacher),
                          const _Top(),
                          Expanded(
                            child: ListView.builder(
                              padding: const EdgeInsets.only(
                                left: 5,
                                right: 5,
                                bottom: 15,
                              ),
                              itemCount: data.length,
                              itemBuilder: (_, int index) {
                                final student = data[index];
                                final search = vm.search.text.toLowerCase();
                                final fullname =
                                    '${student.name} ${student.surname}'
                                        .toLowerCase();
                                final rev =
                                    '${student.surname} ${student.name}';
                                return fullname.contains(search) ||
                                        rev.contains(search) ||
                                        student.tel.contains(search)
                                    ? _Student(
                                        student: student,
                                        mask: vm.mask,
                                      )
                                    : const SizedBox.shrink();
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            );
          }),
    );
  }
}
