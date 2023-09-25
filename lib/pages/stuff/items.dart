part of 'imports.dart';

AppBar _appBar(
  BuildContext context,
  BranchModel? branch,
  List<BranchModel> branches,
  Function(String?) select,
  TabController controller,
  VoidCallback onBack,
  VoidCallback onBackBranch,
) =>
    AppBar(
      backgroundColor: kPrimaryLightColor,
      title: SizedBox(
        height: 50,
        width: 310,
        child: DropdownButton<String>(
          isExpanded: true,
          dropdownColor: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(12),
          value: branch?.short,
          icon: const Icon(
            Icons.arrow_downward,
            color: kPrimaryColor,
          ),
          hint: Text(
            lan(t.allBranches),
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          elevation: 16,
          style: const TextStyle(
            color: kPrimaryColor,
          ),
          underline: Container(
            height: 1,
            color: kPrimaryColor,
          ),
          onChanged: select,
          items: branches.map<DropdownMenuItem<String>>((BranchModel value) {
            return DropdownMenuItem<String>(
              value: value.short,
              child: Text(
                value.short,
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
        ),
      ),
      actions: [
        SubmenuButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          menuStyle: MenuStyle(
            backgroundColor: MaterialStateProperty.all(kPrimaryLightColor),
          ),
          menuChildren: <Widget>[
            MenuItemButton(
              leadingIcon: Image.asset(
                "assets/icons/teacher.png",
                height: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: AddTeacherPage(
                      branch: branch,
                      branches: branches,
                    ),
                    type: PageTransitionType.rightToLeft,
                  ),
                ).then((value) {
                  onBack();
                });
              },
              child: MenuAcceleratorLabel(
                lan(t.teacher),
              ),
            ),
            MenuItemButton(
              leadingIcon: Image.asset(
                "assets/icons/reception.png",
                height: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: AddReceptionPage(
                      branch: branch,
                      branches: branches,
                    ),
                    type: PageTransitionType.rightToLeft,
                  ),
                ).then((value) {
                  onBack();
                });
              },
              child: MenuAcceleratorLabel(lan(t.reception)),
            ),
            MenuItemButton(
              leadingIcon: Image.asset(
                "assets/icons/support.png",
                height: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: AddSupportPage(
                      branch: branch,
                      branches: branches,
                    ),
                    type: PageTransitionType.rightToLeft,
                  ),
                ).then((value) {
                  onBack();
                });
              },
              child: MenuAcceleratorLabel(
                lan(t.support),
              ),
            ),
            MenuItemButton(
              leadingIcon: Image.asset(
                "assets/icons/branch.png",
                height: 30,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: const AddBranchPage(),
                    type: PageTransitionType.rightToLeft,
                  ),
                ).then((value) {
                  onBackBranch();
                });
              },
              child: MenuAcceleratorLabel(
                lan(t.branch),
              ),
            ),
          ],
          child: const Icon(
            CupertinoIcons.add,
            color: kPrimaryColor,
            size: 30,
          ),
        ),
      ],
    );

class _Top extends StatelessWidget {
  final TabController controller;
  final VoidCallback onTap;

  const _Top({
    Key? key,
    required this.controller,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider<StuffVM>(
      create: (_) => StuffVM(),
      child: Consumer<StuffVM>(
        builder: (context, StuffVM vm, _) {
          return Ink(
            height: size.height * .065,
            width: size.width * .65,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(
                size.width * .08,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: TabBar(
                onTap: (int index) {
                  onTap();
                },
                physics: const BouncingScrollPhysics(),
                splashBorderRadius: BorderRadius.circular(
                  size.width * .08,
                ),
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    // Use the default focused overlay color
                    return states.contains(MaterialState.focused)
                        ? null
                        : kPrimaryColor.withOpacity(.2);
                  },
                ),
                controller: controller,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    size.width * .08,
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 3),
                      color: kPrimaryColor.withOpacity(.4),
                      spreadRadius: 1.5,
                      blurRadius: 4,
                    ),
                    BoxShadow(
                      offset: const Offset(0, -1),
                      color: kPrimaryColor.withOpacity(.1),
                      spreadRadius: 1.5,
                      blurRadius: 4,
                    ),
                    BoxShadow(
                      offset: const Offset(-1, 0),
                      color: kPrimaryColor.withOpacity(.1),
                      spreadRadius: 1.5,
                      blurRadius: 4,
                    ),
                    BoxShadow(
                      offset: const Offset(1, 0),
                      color: kPrimaryColor.withOpacity(.1),
                      spreadRadius: 1.5,
                      blurRadius: 4,
                    ),
                  ],
                  color: kPrimaryLightColor,
                ),
                tabs: [
                  Tab(
                    child: Image.asset("assets/icons/teacher.png"),
                  ),
                  Tab(
                    child: Image.asset("assets/icons/reception.png"),
                  ),
                  Tab(
                    child: Image.asset("assets/icons/support.png"),
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

class _Item extends StatelessWidget {
  final TeacherModel teacher;

  const _Item({
    Key? key,
    required this.teacher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "teacher.${teacher.tel}",
      child: Card(
        color: kPrimaryLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                child: TeacherDetailPage(
                  teacher: teacher,
                ),
                type: PageTransitionType.rightToLeft,
              ),
            );
          },
          splashColor: c.white.withOpacity(.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          hoverColor: c.white,
          title: Text(
            "${teacher.name} ${teacher.surname}",
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 17.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            teacher.tel,
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: const Icon(
            CupertinoIcons.chevron_right,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}

class _ItemReception extends StatelessWidget {
  final ReceptionModel reception;

  const _ItemReception({
    Key? key,
    required this.reception,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryLightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              child: ReceptionDetailPage(
                reception: reception,
              ),
              type: PageTransitionType.rightToLeft,
            ),
          );
        },
        splashColor: c.white.withOpacity(.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hoverColor: c.white,
        title: Text(
          "${reception.name} ${reception.surname}",
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 17.5,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          reception.tel,
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          CupertinoIcons.chevron_right,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}

class _ItemSupport extends StatelessWidget {
  final SupportModel support;

  const _ItemSupport({
    Key? key,
    required this.support,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryLightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            PageTransition(
              child: SupportDetailPage(
                support: support,
              ),
              type: PageTransitionType.rightToLeft,
            ),
          );
        },
        splashColor: c.white.withOpacity(.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        hoverColor: c.white,
        title: Text(
          "${support.name} ${support.surname}",
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 17.5,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          support.tel,
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          CupertinoIcons.chevron_right,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}
