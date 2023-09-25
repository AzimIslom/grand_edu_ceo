part of 'imports.dart';

class AddReceptionPage extends StatelessWidget {
  final BranchModel? branch;
  final List<BranchModel> branches;

  const AddReceptionPage({
    Key? key,
    required this.branch,
    required this.branches,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddReceptionVM>(
      create: (_) => AddReceptionVM(
        branches: branches,
        branch: branch,
      ),
      child: Scaffold(
        backgroundColor: c.white,
        resizeToAvoidBottomInset: false,
        body: Consumer<AddReceptionVM>(
          builder: (context, AddReceptionVM vm, _) {
            return Stack(
              children: [
                IgnorePointer(
                  ignoring: vm.isLoading,
                  child: const SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _Branch(),
                          SizedBox(height: 20),
                          _Names(),
                          SizedBox(height: 10),
                          _Tel(),
                          SizedBox(height: 10),
                          _Features(),
                          SizedBox(height: 10),
                          _Create(),
                          SizedBox(
                            height: 150,
                            child: Column(
                              children: [
                                SizedBox(height: 20),
                                _Errors(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                vm.isLoading
                    ? Container(
                        alignment: Alignment.center,
                        color: kPrimaryColor.withOpacity(.7),
                        child: const SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            color: kPrimaryLightColor,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }
}
