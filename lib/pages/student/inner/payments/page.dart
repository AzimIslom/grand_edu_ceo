part of 'imports.dart';

class StudentPaymentDetailPage extends StatelessWidget {
  const StudentPaymentDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StudentPaymentDetailVM>(
      create: (_) => StudentPaymentDetailVM(),
      child: Scaffold(
        backgroundColor: c.white,
        appBar: _appBar(context),
        body: FutureBuilder<List<PayModel>>(
          future: StudentPaymentDetailVM().payments(),
          builder: (context, snap) {
            final data = snap.data ?? [];
            return Consumer<StudentPaymentDetailVM>(
              builder: (context, StudentPaymentDetailVM vm, _) {
                return snap.connectionState == ConnectionState.waiting || vm.isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: kPrimaryColor,
                        ),
                      )
                    : SafeArea(
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 15,
                                ),
                                physics: const BouncingScrollPhysics(),
                                itemCount: data.length,
                                itemBuilder: (_, int index) {
                                  final pay = data[index];
                                  final reception =
                                      vm.receptionName(pay.getter);
                                  return _Items(
                                    pay: pay,
                                    reception: reception,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
              },
            );
          },
        ),
      ),
    );
  }
}
