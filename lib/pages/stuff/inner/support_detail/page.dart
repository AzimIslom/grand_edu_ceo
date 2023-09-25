part of 'imports.dart';

class SupportDetailPage extends StatelessWidget {
  final SupportModel support;

  const SupportDetailPage({
    Key? key,
    required this.support,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SupportDetailVM>(
      create: (_) => SupportDetailVM(support: support),
      child: Scaffold(),
    );
  }
}
