part of 'imports.dart';

class _Search extends StatelessWidget {
  const _Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TeacherDetailVM>(
      builder: (context, TeacherDetailVM vm, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: AnimSearchBar(
            textFieldColor: kPrimaryLightColor,
            color: kPrimaryLightColor,
            width: 400,
            rtl: true,
            autoFocus: true,
            textController: vm.search,
            style: const TextStyle(
              color: kPrimaryColor,
            ),
            onSuffixTap: () {},
            onSubmitted: (String) {},
          ),
        );
      },
    );
  }
}

class _Top extends StatelessWidget {
  final TabController controller;

  const _Top({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<TeacherDetailVM>(
      builder: (context, TeacherDetailVM vm, _) {
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
              onTap: (int index) {},
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
                  child: Image.asset("assets/icons/info.png"),
                ),
                Tab(
                  child: Image.asset("assets/icons/students.png"),
                ),
                Tab(
                  child: Image.asset("assets/icons/group.png"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  final GroupModel group;
  final TeacherModel teacher;

  const _Item({
    Key? key,
    required this.group,
    required this.teacher,
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
              child: GroupDetailPage(
                group: group,
                teacher: teacher,
              ),
              type: PageTransitionType.rightToLeft,
            ),
          );
        },
        splashColor: c.white.withOpacity(.5),
        hoverColor: c.white,
        minLeadingWidth: 55,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              DateFormat.Hm().format(group.start),
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '${lan(
                group.odd ? t.odd : t.even,
              )}, ${group.unit}',
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        title: Text(
          group.name,
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 17.5,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          "${group.students.length} ${lan(t.students2)}",
          style: const TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.w500,
            fontSize: 14,
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

class _Info extends StatelessWidget {
  const _Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TeacherDetailVM>(
      builder: (context, TeacherDetailVM vm, _) {
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              margin: const EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${vm.students.length} ${lan(t.students2)}",
                    style: const TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                  Text(
                    "${vm.groups.length} ${lan(t.groups2)}",
                    style: const TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/location.png",
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "${lan(t.branch)}: ${vm.branch.short} ",
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 17.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Student extends StatelessWidget {
  final StudentModel student;
  final MaskTextInputFormatter mask;
  final GroupModel group;

  const _Student({
    Key? key,
    required this.student,
    required this.mask,
    required this.group,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "student.${student.tel}",
      child: Card(
        color: kPrimaryLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          minLeadingWidth: 10,
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                child: StudentDetailPage(
                  student: student,
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
          leading: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                DateFormat.Hm().format(group.start),
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                lan(
                  group.odd ? t.odd : t.even,
                ),
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          title: Text(
            "${student.name} ${student.surname}",
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 17.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            mask.maskText(student.tel),
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

class _Teacher extends StatelessWidget {
  final TeacherModel teacher;

  const _Teacher({
    Key? key,
    required this.teacher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryLightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
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
      ),
    );
  }
}
