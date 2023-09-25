part of 'imports.dart';

class ReceptionDetailPage extends StatelessWidget {
  final ReceptionModel reception;

  const ReceptionDetailPage({
    Key? key,
    required this.reception,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReceptionDetailVM>(
      create: (_) => ReceptionDetailVM(reception: reception),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Consumer<ReceptionDetailVM>(
              builder: (context, ReceptionDetailVM vm, _) {
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
                    : Column(
                        children: [
                          _ItemReception(reception: reception),
                          const SizedBox(height: 15),
                          const _Features(),
                          const SizedBox(height: 15),
                          _Location(branch: vm.branch),
                          const SizedBox(height: 50),
                          _Create(
                            onTap: () {
                              vm.save(context);
                            },
                          ),
                        ],
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
