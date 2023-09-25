part of 'imports.dart';

class StudentTablePage extends StatelessWidget {
  const StudentTablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StudentTableVM>(
      create: (_) => StudentTableVM(),
      child: Scaffold(
        appBar: _appBar(context),
        backgroundColor: c.white,
        body: FutureBuilder<List<AttendanceModel>>(
          future: StudentTableVM().table(),
          builder: (context, snap) {
            final data = snap.data ?? [];
            return SafeArea(
              child: Consumer<StudentTableVM>(
                builder: (context, StudentTableVM vm, _) {
                  return vm.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        )
                      : ListView.builder(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 15,
                          ),
                          physics: const BouncingScrollPhysics(),
                          itemCount: data.length,
                          itemBuilder: (_, int index) {
                            final table = data[index];
                            return _Item(table: table);
                          },
                        );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
