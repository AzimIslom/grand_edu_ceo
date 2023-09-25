part of 'imports.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({Key? key}) : super(key: key);

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StudentVM>(
      create: (_) => StudentVM(),
      child: Consumer<StudentVM>(builder: (context, StudentVM vm, _) {
        return FutureBuilder<List<StudentModel>>(
          future: fb.students(),
          builder: (context, snap) {
            final data = snap.data;
            return Scaffold(
              backgroundColor: c.white,
              body: SafeArea(
                child: data != null
                    ? Column(
                        children: [
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
                                    '${student.name} ${student.surname}'.toLowerCase();
                                final rev =
                                    '${student.surname} ${student.name}';
                                return fullname.contains(search) ||
                                        rev.contains(search) ||
                                        student.tel.contains(search)
                                    ? _Item(
                                        student: student,
                                        mask: vm.mask,
                                      )
                                    : const SizedBox.shrink();
                              },
                            ),
                          ),
                        ],
                      )
                    : const Center(
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
              ),
            );
          },
        );
      }),
    );
  }
}
