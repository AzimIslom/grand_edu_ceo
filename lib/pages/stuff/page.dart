part of 'imports.dart';

class StuffPage extends StatefulWidget {
  const StuffPage({Key? key}) : super(key: key);

  @override
  State<StuffPage> createState() => _StuffPageState();
}

class _StuffPageState extends State<StuffPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<StuffVM>(
      create: (_) => StuffVM(),
      child: Consumer<StuffVM>(
        builder: (context, StuffVM vm, _) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: _appBar(
                context,
                vm.branch,
                vm.branches,
                vm.select,
                tabController,
                vm.notifyListeners,
                vm.initBranches,
              ),
              backgroundColor: c.white,
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      bottom: 10,
                    ),
                    child: _Top(
                      controller: tabController,
                      onTap: vm.notifyListeners,
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      physics: const BouncingScrollPhysics(),
                      controller: tabController,
                      children: [
                        FutureBuilder<List<TeacherModel>>(
                          future: fb.teachers(),
                          builder: (context, snap) {
                            final data = snap.data;
                            return data != null
                                ? ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    padding: const EdgeInsets.only(
                                      left: 5,
                                      right: 5,
                                      top: 5,
                                      bottom: 15,
                                    ),
                                    itemCount: data.length,
                                    itemBuilder: (_, int index) {
                                      final teacher = data[index];
                                      return _Item(teacher: teacher);
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
                                  );
                          },
                        ),
                        FutureBuilder<List<ReceptionModel>>(
                          future: fb.receptions(),
                          builder: (context, snap) {
                            final data = snap.data;
                            return data != null
                                ? ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    padding: const EdgeInsets.only(
                                      left: 5,
                                      right: 5,
                                      top: 5,
                                      bottom: 15,
                                    ),
                                    itemCount: data.length,
                                    itemBuilder: (_, int index) {
                                      final reception = data[index];
                                      return _ItemReception(
                                          reception: reception);
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
                                  );
                          },
                        ),
                        FutureBuilder<List<SupportModel>>(
                          future: fb.supports(),
                          builder: (context, snap) {
                            final data = snap.data;
                            return data != null
                                ? ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    padding: const EdgeInsets.only(
                                      left: 5,
                                      right: 5,
                                      top: 5,
                                      bottom: 15,
                                    ),
                                    itemCount: data.length,
                                    itemBuilder: (_, int index) {
                                      final support = data[index];
                                      return _ItemSupport(support: support);
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
                                  );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
