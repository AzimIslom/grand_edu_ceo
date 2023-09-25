part of 'imports.dart';

class _Branch extends StatelessWidget {
  const _Branch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddGroupVM>(
      builder: (context, AddGroupVM vm, _) {
        return DropdownButton<String>(
          dropdownColor: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(12),
          isExpanded: true,
          value: vm.branch?.short,
          icon: const Icon(
            Icons.arrow_downward,
            color: kPrimaryColor,
          ),
          hint: Text(
            lan(t.branch),
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
          onChanged: vm.select,
          items: vm.branches.map<DropdownMenuItem<String>>((BranchModel value) {
            return DropdownMenuItem<String>(
              value: value.short,
              child: Text(
                value.short,
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

class _Name extends StatelessWidget {
  const _Name({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddGroupVM>(
      builder: (context, AddGroupVM vm, _) {
        return TextField(
          controller: vm.name,
          autocorrect: false,
          style: const TextStyle(
            color: kPrimaryColor,
          ),
          cursorColor: kPrimaryColor,
          onChanged: (a) {
            vm.notifyListeners();
          },
          maxLength: vm.name.text.length >= 15 ? 20 : null,
          decoration: InputDecoration(
            hintText: lan(t.groupName),
          ),
        );
      },
    );
  }
}

class _SelectTeacher extends StatelessWidget {
  const _SelectTeacher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<AddGroupVM>(
      builder: (context, AddGroupVM vm, _) {
        return ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              builder: (_) => vm.teachers.isEmpty
                  ? Container(
                      decoration: const BoxDecoration(
                        color: kPrimaryLightColor,
                      ),
                      child: const Center(
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: size.height * .8,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        physics: const BouncingScrollPhysics(),
                        itemCount: vm.teachers.length,
                        itemBuilder: (_, int index) {
                          final teacher = vm.teachers[index];
                          return _Item(
                            teacher: teacher,
                            onTap: () {
                              vm.selectTeacher(teacher);
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
            );
          },
          child: Text(
            vm.teacher == null
                ? lan(t.selectTeacher)
                : '${vm.teacher!.name} ${vm.teacher!.surname}',
            style: const TextStyle(
              color: kPrimaryLightColor,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}

class _SelectSupport extends StatelessWidget {
  const _SelectSupport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<AddGroupVM>(
      builder: (context, AddGroupVM vm, _) {
        return ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              builder: (_) => vm.supports.isEmpty
                  ? Container(
                      decoration: const BoxDecoration(
                        color: kPrimaryLightColor,
                      ),
                      child: const Center(
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: size.height * .8,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 15,
                        ),
                        physics: const BouncingScrollPhysics(),
                        itemCount: vm.supports.length,
                        itemBuilder: (_, int index) {
                          final support = vm.supports[index];
                          final t = TeacherModel(
                            tel: '',
                            surname: support.surname,
                            password: '',
                            name: support.name,
                            branch: '',
                            students: [],
                            groups: [],
                          );
                          return _Item(
                            teacher: t,
                            onTap: () {
                              vm.selectSupport(support);
                              Navigator.pop(context);
                            },
                          );
                        },
                      ),
                    ),
            );
          },
          child: Text(
            vm.support == null
                ? lan(t.selectSupport)
                : '${vm.support!.name} ${vm.support!.surname}',
            style: const TextStyle(
              color: kPrimaryLightColor,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}

class _Item extends StatelessWidget {
  final TeacherModel teacher;
  final VoidCallback onTap;

  const _Item({
    Key? key,
    required this.teacher,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryLightColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: onTap,
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
          CupertinoIcons.check_mark_circled,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}

class _DayLesson extends StatelessWidget {
  const _DayLesson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddGroupVM>(
      builder: (context, AddGroupVM vm, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lan(t.dayLesson),
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    vm.selectDay(true);
                  },
                  child: Ink(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color:
                          vm.isOdd != true ? kPrimaryLightColor : kPrimaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      lan(t.odd),
                      style: TextStyle(
                        color: vm.isOdd == true
                            ? kPrimaryLightColor
                            : kPrimaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    vm.selectDay(false);
                  },
                  child: Ink(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: vm.isOdd != false
                          ? kPrimaryLightColor
                          : kPrimaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      lan(t.even),
                      style: TextStyle(
                        color: vm.isOdd == false
                            ? kPrimaryLightColor
                            : kPrimaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _Start extends StatelessWidget {
  const _Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddGroupVM>(
      builder: (context, AddGroupVM vm, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lan(t.startTime),
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    vm.selectTime(1);
                  },
                  child: Ink(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: vm.time != 1 ? kPrimaryLightColor : kPrimaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "14:00",
                      style: TextStyle(
                        color:
                            vm.time == 1 ? kPrimaryLightColor : kPrimaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    vm.selectTime(2);
                  },
                  child: Ink(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: vm.time != 2 ? kPrimaryLightColor : kPrimaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "16:00",
                      style: TextStyle(
                        color:
                            vm.time == 2 ? kPrimaryLightColor : kPrimaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    vm.selectTime(3);
                  },
                  child: Ink(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: vm.time != 3 ? kPrimaryLightColor : kPrimaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "18:00",
                      style: TextStyle(
                        color:
                            vm.time == 3 ? kPrimaryLightColor : kPrimaryColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _Homework extends StatelessWidget {
  const _Homework({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<AddGroupVM>(
      builder: (context, AddGroupVM vm, _) {
        return ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              builder: (_) => SizedBox(
                height: size.height * .8,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  physics: const BouncingScrollPhysics(),
                  itemCount: vm.themes.length,
                  itemBuilder: (_, int index) {
                    final theme = vm.themes[index];
                    return Card(
                      color: kPrimaryLightColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        onTap: () {
                          vm.selectUnit(theme.unit);
                          Navigator.pop(context);
                        },
                        minLeadingWidth: 10,
                        leading: Text(
                          theme.unit.toString(),
                          style: const TextStyle(
                            color: kPrimaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        title: Text(
                          theme.title,
                          style: const TextStyle(
                            color: kPrimaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
          child: Text(
            vm.unit == 0
                ? lan(t.selectUnit)
                : vm.themes
                    .firstWhere(
                      (element) => element.unit == vm.unit,
                      orElse: () => ThemeModel(unit: 10, title: "${vm.unit}"),
                    )
                    .title,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}

class _Add extends StatelessWidget {
  const _Add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddGroupVM>(
      builder: (context, AddGroupVM vm, _) {
        return Column(
          children: [
            ElevatedButton(
              onPressed: () {
                vm.save(context);
              },
              child: Text(
                lan(t.save),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryLightColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                lan(t.back),
                style: const TextStyle(
                  color: kPrimaryColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Errors extends StatelessWidget {
  const _Errors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddGroupVM>(
      builder: (context, AddGroupVM vm, _) {
        return Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: vm.errors
                .map(
                  (e) => Text(
                    "    - ${lan(e)}",
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
