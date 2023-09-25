part of 'imports.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeVM>(
      create: (_) => HomeVM(),
      child: Consumer<HomeVM>(
        builder: (context, HomeVM vm, _) {
          return Scaffold(
            backgroundColor: c.white,
            // appBar: AppBar(),
            body: [
              const StuffPage(),
              const StudentPage(),
              const PayPage(),
              const GroupPage(),
              const InfoPage(),
            ][vm.currentIndex],
            bottomNavigationBar: const _BNB(),
          );
        },
      ),
    );
  }
}
