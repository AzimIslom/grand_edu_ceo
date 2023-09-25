part of 'imports.dart';

class _SelectGroups extends StatelessWidget {
  const _SelectGroups({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<AddStudentVM>(
      builder: (context, AddStudentVM vm, _) {
        return vm.group == null
            ? ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    builder: (_) => vm.groups.isEmpty
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
                              itemCount: vm.groups.length,
                              itemBuilder: (_, int index) {
                                final group = vm.groups[index];
                                return _Item(
                                  group: group,
                                  onTap: () {
                                    vm.selectGroup(group);
                                    Navigator.pop(context);
                                  },
                                  teacher: vm.currentTeacher(group.teacherId),
                                );
                              },
                            ),
                          ),
                  );
                },
                child: Text(
                  lan(t.selectGroup),
                  style: const TextStyle(
                    color: kPrimaryLightColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            : _Item(
                group: vm.group!,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    builder: (_) => vm.groups.isEmpty
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
                              itemCount: vm.groups.length,
                              itemBuilder: (_, int index) {
                                final group = vm.groups[index];
                                return _Item(
                                  group: group,
                                  onTap: () {
                                    vm.selectGroup(group);
                                    Navigator.pop(context);
                                  },
                                  teacher: vm.currentTeacher(group.teacherId),
                                );
                              },
                            ),
                          ),
                  );
                },
                teacher: vm.currentTeacher(
                  vm.group!.teacherId,
                ),
              );
      },
    );
  }
}

class _Item extends StatelessWidget {
  final GroupModel group;
  final VoidCallback onTap;
  final String teacher;

  const _Item({
    Key? key,
    required this.group,
    required this.onTap,
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
        onTap: onTap,
        splashColor: c.white.withOpacity(.5),
        hoverColor: c.white,
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
          group.name,
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 17.5,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          teacher,
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          CupertinoIcons.checkmark_alt_circle,
          color: kPrimaryColor,
        ),
      ),
    );
  }
}


class _Names extends StatelessWidget {
  const _Names({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddStudentVM>(
      builder: (context, AddStudentVM vm, _) {
        return Column(
          children: [
            TextField(
              textInputAction: TextInputAction.next,
              controller: vm.firstName,
              autocorrect: false,
              cursorColor: kPrimaryColor,
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 16,
              ),
              maxLength: vm.firstName.text.length >= 12 ? 15 : null,
              onChanged: vm.onChanged,
              decoration: InputDecoration(
                hintText: lan(t.firstName),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: vm.lastName,
              cursorColor: kPrimaryColor,
              autocorrect: false,
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 16,
              ),
              textInputAction: TextInputAction.next,
              maxLength: vm.lastName.text.length >= 12 ? 15 : null,
              onChanged: vm.onChanged,
              decoration: InputDecoration(
                hintText: lan(t.lastName),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Tel extends StatelessWidget {
  const _Tel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddStudentVM>(
      builder: (context, AddStudentVM vm, _) {
        return TextField(
          onChanged: vm.onChanged,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.phone,
          autocorrect: false,
          cursorColor: kPrimaryColor,
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 16,
          ),
          inputFormatters: [
            vm.mask,
          ],
          decoration: InputDecoration(
            hintText: lan(t.tel),
          ),
        );
      },
    );
  }
}


class _Create extends StatelessWidget {
  const _Create({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddStudentVM>(
      builder: (context, AddStudentVM vm, _) {
        return Column(
          children: [
            ElevatedButton(
              onPressed: () {
                vm.add(context);
              },
              child: Text(
                lan(t.save),
              ),
            ),
            const SizedBox(height: 20),
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
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
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
    return Consumer<AddStudentVM>(
      builder: (context, AddStudentVM vm, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
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
        );
      },
    );
  }
}


