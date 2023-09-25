part of 'imports.dart';

class TablePage extends StatelessWidget {
  final GroupModel group;

  const TablePage({
    Key? key,
    required this.group,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TableVM>(
      create: (_) => TableVM(group: group),
      child: Scaffold(
        appBar: _appBar(context, group),
        body: Consumer<TableVM>(
          builder: (context, TableVM vm, _) {
            return Container(
              padding: const EdgeInsets.all(30),
              child: vm.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    )
                  : vm.table.isNotEmpty
                      ? PlutoGrid(
                          rowColorCallback: (a) {
                            return c.white;
                          },
                          columns: vm.columns,
                          rows: vm.rows,
                        )
                      : Center(
                          child: Text(
                            lan(
                              t.noLessons,
                            ),
                            style: const TextStyle(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 25,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
            );
          },
        ),
      ),
    );
  }
}
