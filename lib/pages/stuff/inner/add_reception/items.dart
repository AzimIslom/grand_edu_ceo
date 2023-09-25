part of 'imports.dart';

class _Features extends StatelessWidget {
  const _Features({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddReceptionVM>(
      builder: (context, AddReceptionVM vm, _) {
        return Row(
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
                color: vm.features.contains('account') ? null : kPrimaryColor,
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
                color: vm.features.contains('attendence') ? null : kPrimaryColor,
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
        );
      },
    );
  }
}

class _Branch extends StatelessWidget {
  const _Branch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddReceptionVM>(
      builder: (context, AddReceptionVM vm, _) {
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

class _Names extends StatelessWidget {
  const _Names({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddReceptionVM>(
      builder: (context, AddReceptionVM vm, _) {
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
    return Consumer<AddReceptionVM>(
      builder: (context, AddReceptionVM vm, _) {
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
    return Consumer<AddReceptionVM>(
      builder: (context, AddReceptionVM vm, _) {
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
    return Consumer<AddReceptionVM>(
      builder: (context, AddReceptionVM vm, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: vm.errors
              .map(
                (e) => Text(
                  "- ${lan(e)}",
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
