part of 'imports.dart';

class _Field extends StatelessWidget {
  const _Field({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddBranchVM>(
      builder: (context, AddBranchVM vm, _) {
        return Column(
          children: [
            TextField(
              controller: vm.short,
              maxLength: vm.short.text.length > 20 ? 30 : null,
              autocorrect: false,
              onChanged: (val) {
                vm.notifyListeners();
              },
              style: const TextStyle(
                color: kPrimaryColor,
              ),
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: lan(t.name),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: vm.long,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              onChanged: (val) {
                vm.notifyListeners();
              },
              maxLength: vm.short.text.length > 400 ? 500 : null,
              style: const TextStyle(
                color: kPrimaryColor,
              ),
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                hintText: lan(t.address),
              ),
            )
          ],
        );
      },
    );
  }
}

class _Tels extends StatelessWidget {
  const _Tels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddBranchVM>(
      builder: (context, AddBranchVM vm, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            vm.tels.isEmpty
                ? Column(
                    children: [
                      Text(
                        lan(t.tel),
                        style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 5),
                    ],
                  )
                : const SizedBox.shrink(),
            ...List.generate(
              vm.tels.length,
              (index) {
                final controller = vm.tels[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: controller,
                          inputFormatters: [vm.mask],
                          autocorrect: false,
                          style: const TextStyle(
                            color: kPrimaryColor,
                          ),
                          onChanged: (val) {
                            vm.notifyListeners();
                          },
                          cursorColor: kPrimaryColor,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: lan(t.tel),
                          ),
                        ),
                      ),
                      IconButton(
                        splashRadius: 25,
                        onPressed: () {
                          vm.removeMask(controller);
                        },
                        icon: const Icon(
                          CupertinoIcons.delete,
                          color: kPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            vm.tels.length < 4 &&
                    vm.tels
                        .where((element) => element.text.length != 12)
                        .isEmpty
                ? ElevatedButton(
                    onPressed: vm.addMask,
                    child: Text(
                      lan(t.add),
                      style: const TextStyle(),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddBranchVM>(
      builder: (context, AddBranchVM vm, _) {
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
    return Consumer<AddBranchVM>(
      builder: (context, AddBranchVM vm, _) {
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
