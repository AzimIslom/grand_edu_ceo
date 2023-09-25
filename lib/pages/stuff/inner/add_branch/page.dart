part of 'imports.dart';

class AddBranchPage extends StatelessWidget {
  const AddBranchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddBranchVM>(
      create: (_) => AddBranchVM(),
      child: Consumer<AddBranchVM>(
        builder: (context, AddBranchVM vm, _) {
          return Scaffold(
            body: Stack(
              children: [
                IgnorePointer(
                  ignoring: vm.isLoading,
                  child: const SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 20,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _Field(),
                          Divider(color: kPrimaryColor),
                          _Tels(),
                          Divider(color: kPrimaryColor),
                          _Buttons(),
                          SizedBox(height: 30),
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
