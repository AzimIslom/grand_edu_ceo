part of 'imports.dart';

class StudentDetailPage extends StatelessWidget {
  final StudentModel student;

  const StudentDetailPage({
    Key? key,
    required this.student,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => StudentDetailVM(student: student),
      child: Consumer<StudentDetailVM>(
        builder: (context, StudentDetailVM vm, _) {
          return Scaffold(
            backgroundColor: c.white,
            body: SafeArea(
              child: vm.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    )
                  : ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      physics: const BouncingScrollPhysics(),
                      children: const [
                        _Info(),
                        SizedBox(height: 5),
                        _Group(),
                        Chart(),
                        SizedBox(height: 5),
                        _Table(),
                        SizedBox(height: 5),
                        _Pay(),
                        // SizedBox(height: 5),
                        // _Comment(),
                        SizedBox(height: 15),
                        _Button(),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}

//full name, tel, xp
//pay
//statistics
//attendance
//group
//des
