part of 'imports.dart';

class AddStudentPage extends StatelessWidget {
  const AddStudentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddStudentVM>(
      create: (_) => AddStudentVM(),
      child: Scaffold(
        backgroundColor: c.white,
        body: Consumer<AddStudentVM>(
          builder: (context, AddStudentVM vm, _) {
            return Stack(
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
                          _SelectGroups(),
                          Divider(color: kPrimaryColor),
                          _Names(),
                          Divider(color: kPrimaryColor),
                          _Tel(),
                          Divider(color: kPrimaryColor),
                          _Create(),
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
            );
          },
        ),
      ),
    );
  }
}
