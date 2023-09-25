part of 'imports.dart';

class AddGroupPage extends StatelessWidget {
  final List<BranchModel> branches;
  final BranchModel? branch;

  const AddGroupPage({
    Key? key,
    required this.branches,
    this.branch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddGroupVM>(
      create: (_) => AddGroupVM(
        branches: branches,
        branch: branch,
      ),
      child: Consumer<AddGroupVM>(
        builder: (context, AddGroupVM vm, _) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                IgnorePointer(
                  ignoring: vm.isLoading,
                  child: const SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _Branch(),
                          SizedBox(height: 10),
                          _SelectTeacher(),
                          SizedBox(height: 10),
                          _SelectSupport(),
                          Divider(color: kPrimaryColor),
                          _Name(),
                          Divider(color: kPrimaryColor),
                          _Start(),
                          Divider(color: kPrimaryColor),
                          _DayLesson(),
                          Divider(color: kPrimaryColor),
                          _Homework(),
                          Divider(color: kPrimaryColor),
                          _Add(),
                          Divider(color: kPrimaryColor),
                          _Errors(),
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
            ),
          );
        },
      ),
    );
  }
}
