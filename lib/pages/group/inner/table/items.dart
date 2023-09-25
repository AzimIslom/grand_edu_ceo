part of 'imports.dart';

AppBar _appBar(BuildContext context, GroupModel group) {
  return AppBar(
    backgroundColor: kPrimaryLightColor,
    title: Text(
      "${group.name}. ${lan(group.odd ? t.odd : t.even)}, ${DateFormat.Hm().format(group.start)}.",
      style: const TextStyle(
        color: kPrimaryColor,
        fontSize: 17,
        fontWeight: FontWeight.w700,
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