part of 'imports.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<InfoVM>(
      create: (_) => InfoVM(),
      child: Scaffold(),
    );
  }
}
