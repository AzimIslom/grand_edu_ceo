part of 'imports.dart';

class _BNB extends StatelessWidget {
  const _BNB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeVM>(
      builder: (context, HomeVM vm, _) {
        return FlashyTabBar(
          selectedIndex: vm.currentIndex,
          height: 55,
          backgroundColor: kPrimaryLightColor,
          showElevation: true,
          onItemSelected: vm.changeIndex,
          iconSize: 20,
          items: [
            FlashyTabBarItem(
              activeColor: kPrimaryColor,
              icon: Image.asset(
                "assets/icons/teacher.png",
                height: 35,
              ),
              title: Text(
                lan(t.stuff),
              ),
            ),
            FlashyTabBarItem(
              activeColor: kPrimaryColor,
              icon: Image.asset(
                "assets/icons/student.png",
                height: 35,
              ),
              title: Text(
                lan(t.students),
              ),
            ),
            FlashyTabBarItem(
              activeColor: kPrimaryColor,
              icon: Image.asset(
                "assets/icons/pay.png",
                height: 35,
              ),
              title: Text(
                lan(t.pay),
              ),
            ),
            FlashyTabBarItem(
              activeColor: kPrimaryColor,
              icon: Image.asset(
                "assets/icons/group.png",
                height: 35,
              ),
              title: Text(lan(t.group)),
            ),
            FlashyTabBarItem(
              activeColor: kPrimaryColor,
              icon: Image.asset(
                "assets/icons/info.png",
                height: 35,
              ),
              title: Text(lan(t.info)),
            ),
          ],
        );
      },
    );
  }
}
