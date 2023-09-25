part of 'imports.dart';

AppBar _appBar(BuildContext context) => AppBar(
      backgroundColor: kPrimaryLightColor,
      leading: IconButton(
        splashRadius: 25,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          CupertinoIcons.chevron_left,
          color: kPrimaryColor,
        ),
      ),
      title: Text(
        lan(t.payments),
        style: const TextStyle(
          color: kPrimaryColor,
          fontSize: 17.5,
          fontWeight: FontWeight.w500,
        ),
      ),
    );

class _Items extends StatelessWidget {
  final PayModel pay;
  final ReceptionModel reception;

  const _Items({
    Key? key,
    required this.pay,
    required this.reception,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/payer.png",
                    height: 30,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "${pay.sum} UZS",
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "+${pay.lessons}",
                    style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    'assets/icons/lesson.png',
                    height: 27.5,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Image.asset(
                'assets/icons/pay.png',
                height: 27.5,
              ),
              const SizedBox(width: 10),
              Text(
                "${reception.name} + ${reception.surname}",
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            pay.des,
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "${DateFormat.yMd().format(pay.time)}, ${DateFormat.Hm().format(pay.time)}",
            style: const TextStyle(
                color: kPrimaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
