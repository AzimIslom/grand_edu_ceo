part of 'imports.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GroupVM>(
      create: (_) => GroupVM(),
      child: Consumer<GroupVM>(
        builder: (context, GroupVM vm, _) {
          return FutureBuilder<List<GroupModel>>(
            future: fb.groups(),
            builder: (context, snap) {
              final data = snap.data;
              return Scaffold(
                appBar: _appBar(context),
                backgroundColor: c.white,
                body: data != null && !vm.isLoading
                    ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 15,
                        ),
                        itemCount: data.length,
                        itemBuilder: (_, int index) {
                          final teacher = data[index];
                          return _Item(group: teacher);
                        },
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
              );
            },
          );
        },
      ),
    );
  }
}
