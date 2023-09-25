part of 'imports.dart';

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
        // onTap: () {
        //   Navigator.push(
        //     context,
        //     PageTransition(
        //       child: ReceptionDetailPage(
        //         reception: reception,
        //       ),
        //       type: PageTransitionType.rightToLeft,
        //     ),
        //   );
        // },
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
      ),
    );
  }
}

class _Location extends StatelessWidget {
  final BranchModel branch;

  const _Location({
    Key? key,
    required this.branch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/icons/location.png",
            height: 30,
          ),
          const SizedBox(width: 10),
          Text(
            "${lan(t.branch)}: ${branch.short} ",
            style: const TextStyle(
              color: kPrimaryColor,
              fontSize: 17.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _Features extends StatelessWidget {
  const _Features({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ReceptionDetailVM>(
      builder: (context, ReceptionDetailVM vm, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                lan(t.feature),
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    vm.addFeature("call");
                  },
                  splashRadius: 25,
                  icon: Image.asset(
                    "assets/icons/call.png",
                    height: 30,
                    color: vm.features.contains('call') ? null : kPrimaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    vm.addFeature("pay");
                  },
                  splashRadius: 25,
                  icon: Image.asset(
                    "assets/icons/pay.png",
                    height: 30,
                    color: vm.features.contains('pay') ? null : kPrimaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    vm.addFeature("account");
                  },
                  splashRadius: 25,
                  icon: Image.asset(
                    "assets/icons/account.png",
                    height: 30,
                    color:
                        vm.features.contains('account') ? null : kPrimaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    vm.addFeature("attendence");
                  },
                  splashRadius: 25,
                  icon: Image.asset(
                    "assets/icons/attendence.png",
                    height: 30,
                    color: vm.features.contains('attendence')
                        ? null
                        : kPrimaryColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    vm.addFeature("test");
                  },
                  splashRadius: 25,
                  icon: Image.asset(
                    "assets/icons/test.png",
                    height: 30,
                    color: vm.features.contains('test') ? null : kPrimaryColor,
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

class _Create extends StatelessWidget {
  final VoidCallback onTap;

  const _Create({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onTap,
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
  }
}
