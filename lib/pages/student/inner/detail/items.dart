part of 'imports.dart';

class _Info extends StatelessWidget {
  const _Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentDetailVM>(
      builder: (context, StudentDetailVM vm, _) {
        return Hero(
          tag: "student.${vm.student.tel}",
          child: Card(
            color: kPrimaryLightColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              onTap: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              subtitle: Text(
                '${vm.student.name} ${vm.student.surname}',
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              title: InkWell(
                onLongPress: () {},
                child: Text(
                  vm.mask.maskText(vm.student.tel),
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              trailing: Text(
                "${vm.student.xp} XP",
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Group extends StatelessWidget {
  const _Group({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentDetailVM>(
      builder: (context, StudentDetailVM vm, _) {
        return Card(
          color: kPrimaryLightColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            onTap: () {},
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
                  DateFormat.Hm().format(vm.group.start),
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  lan(
                    vm.group.odd ? t.odd : t.even,
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
              vm.group.name,
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 17.5,
                fontWeight: FontWeight.w700,
              ),
            ),
            subtitle: Text(
              "${vm.teacher.name} ${vm.teacher.surname}",
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Text(
              vm.group.unit.toString(),
              style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Table extends StatelessWidget {
  const _Table({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentDetailVM>(
      builder: (context, StudentDetailVM vm, _) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: kPrimaryLightColor,
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  child: const StudentTablePage(),
                  type: PageTransitionType.rightToLeft,
                ),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            minLeadingWidth: 25,
            leading: Image.asset(
              "assets/icons/attendence.png",
              height: 30,
            ),
            title: Text(
              lan(t.attendance),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: kPrimaryColor,
              ),
            ),
            trailing: const Icon(
              CupertinoIcons.chevron_right,
              color: kPrimaryColor,
            ),
          ),
        );
      },
    );
  }
}

class _Pay extends StatelessWidget {
  const _Pay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentDetailVM>(
      builder: (context, StudentDetailVM vm, _) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: kPrimaryLightColor,
          child: ListTile(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  child: const StudentPaymentDetailPage(),
                  type: PageTransitionType.rightToLeft,
                ),
              );
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            minLeadingWidth: 25,
            leading: Image.asset(
              "assets/icons/pay.png",
              height: 30,
            ),
            title: Text(
              vm.student.lessons > 0
                  ? "${lan(t.payed)}."
                  : "${lan(t.notPayed)}!!!",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: kPrimaryColor,
              ),
            ),
            trailing: const Icon(
              CupertinoIcons.chevron_right,
              color: kPrimaryColor,
            ),
          ),
        );
      },
    );
  }
}


class _Button extends StatelessWidget {
  const _Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
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
    );
  }
}
