part of 'imports.dart';

class TeacherDetailPage extends StatefulWidget {
  final TeacherModel teacher;

  const TeacherDetailPage({
    Key? key,
    required this.teacher,
  }) : super(key: key);

  @override
  State<TeacherDetailPage> createState() => _TeacherDetailPageState();
}

class _TeacherDetailPageState extends State<TeacherDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TeacherDetailVM>(
      create: (_) => TeacherDetailVM(
        teacher: widget.teacher,
      ),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: c.white,
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        splashRadius: 25,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          CupertinoIcons.chevron_left,
                          color: kPrimaryColor,
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          bottom: 10,
                        ),
                        child: _Top(
                          controller: tabController,
                        ),
                      ),
                      IconButton(
                        splashRadius: 25,
                        onPressed: null,
                        icon: Icon(
                          CupertinoIcons.chevron_left,
                          color: c.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Consumer<TeacherDetailVM>(
                    builder: (context, TeacherDetailVM vm, _) {
                      return vm.isLoading
                          ? const Center(
                              child: SizedBox(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator(
                                  color: kPrimaryColor,
                                ),
                              ),
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: TabBarView(
                                physics: const BouncingScrollPhysics(),
                                controller: tabController,
                                children: [
                                  Column(
                                    children: [
                                      Hero(
                                        tag: "teacher.${vm.teacher.tel}",
                                        child: _Teacher(teacher: vm.teacher),
                                      ),
                                      const _Info(),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const _Search(),
                                      Expanded(
                                        child: ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount: vm.students.length,
                                          itemBuilder: (_, int index) {
                                            final student = vm.students[index];
                                            final search =
                                                vm.search.text.toLowerCase();
                                            final fullname =
                                                '${student.name} ${student.surname}'
                                                    .toLowerCase();
                                            final rev =
                                                '${student.surname} ${student.name}';
                                            final group =
                                                vm.group(student.groupId);
                                            return fullname.contains(search) ||
                                                    rev.contains(search) ||
                                                    student.tel.contains(search)
                                                ? _Student(
                                                    student: student,
                                                    mask: vm.mask,
                                                    group: group,
                                                  )
                                                : const SizedBox.shrink();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: vm.groups.length,
                                    itemBuilder: (_, int index) {
                                      final group = vm.groups[index];
                                      return _Item(
                                        group: group,
                                        teacher: vm.teacher,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
