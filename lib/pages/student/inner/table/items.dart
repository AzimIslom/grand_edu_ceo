part of 'imports.dart';

AppBar _appBar(BuildContext context) {
  return AppBar(
    backgroundColor: kPrimaryLightColor,
    title: Text(
      lan(t.attendance),
      style: const TextStyle(
        color: kPrimaryColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
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
  );
}

class _Item extends StatelessWidget {
  final AttendanceModel table;

  const _Item({
    Key? key,
    required this.table,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<StudentTableVM>(
      builder: (context, StudentTableVM vm, _) {
        return Container(
          margin: const EdgeInsets.symmetric(
            vertical: 7.5,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 17.5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: table.status != true ? kPrimaryColor : kPrimaryLightColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "${DateFormat.yMd().format(table.time)}   ${DateFormat.Hm().format(table.time)}",
                    style: TextStyle(
                      color: table.status != true
                          ? kPrimaryLightColor
                          : kPrimaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  table.status == null
                      ? Text(
                          lan(
                            t.haveReason,
                          ),
                          style: const TextStyle(
                            color: kPrimaryLightColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              Text(
                vm.name(table.by),
                style: TextStyle(
                  color:
                      table.status != true ? kPrimaryLightColor : kPrimaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Column(
                children: table.des
                    .map(
                      (e) => __Des(
                        des: e,
                        name: vm.name(e.by),
                        status: table.status,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class __Des extends StatelessWidget {
  final TableDesModel des;
  final String name;
  final bool? status;

  const __Des({
    Key? key,
    required this.des,
    required this.name,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          color: status != true ? kPrimaryLightColor : kPrimaryColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              des.by.startsWith("t")
                  ? "assets/icons/teacher.png"
                  : des.by.startsWith("r")
                      ? "assets/icons/reception.png"
                      : "assets/icons/support.png",
              height: 30,
            ),
            const SizedBox(width: 5),
            Text(
              name,
              style: TextStyle(
                color: status != true ? kPrimaryLightColor : kPrimaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(
              DateFormat.Hm().format(des.time),
              style: TextStyle(
                color: status != true ? kPrimaryLightColor : kPrimaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Text(
          des.des,
          style: TextStyle(
            color: status != true ? kPrimaryLightColor : kPrimaryColor,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
