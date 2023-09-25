part of 'imports.dart';

AppBar _appBar(
  BuildContext context,
  TeacherModel teacher,
  GroupModel group,
) {
  return AppBar(
    backgroundColor: kPrimaryLightColor,
    leading: IconButton(
      splashRadius: 25,
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        CupertinoIcons.chevron_left,
        color: kPrimaryColor,
        size: 30,
      ),
    ),
    title: Text(
      "${teacher.name} ${teacher.surname}",
      style: const TextStyle(
        color: kPrimaryColor,
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        splashRadius: 25,
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              child: TablePage(group: group),
              type: PageTransitionType.rightToLeft,
            ),
          );
        },
        icon: Image.asset(
          "assets/icons/attendence.png",
          height: 30,
        ),
      ),
      const SizedBox(width: 10),
    ],
  );
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
    return Hero(
      tag: "group.${group.id}",
      child: Card(
        color: kPrimaryLightColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          onTap: () {},
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
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentVM>(
      builder: (context, StudentVM vm, _) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            children: [
              Expanded(
                child: AnimSearchBar(
                  rtl: true,
                  textFieldColor: kPrimaryLightColor,
                  color: kPrimaryLightColor,
                  width: 400,
                  autoFocus: true,
                  textController: vm.search,
                  onSuffixTap: () {},
                  onSubmitted: (String) {},
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Future<List<StudentModel>> _getStudents(List<String> stu) async {
  final List<StudentModel> students = [];
  for (var i in stu) {
    students.add(await fb.specialStudent(i));
  }
  return students;
}

class _Student extends StatelessWidget {
  final StudentModel student;
  final MaskTextInputFormatter mask;

  const _Student({
    Key? key,
    required this.student,
    required this.mask,
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
