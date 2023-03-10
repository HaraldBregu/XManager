import 'package:flutter/material.dart';
import 'package:xmanager/app.dart';
import 'package:xmanager/data/models/models.dart';
import 'package:xmanager/main.dart';
import 'package:xmanager/presentation/pages/program/program_create.dart';

import '../../../core/constants/common.dart';


class ProgramList extends StatefulWidget {
  const ProgramList({Key? key}) : super(key: key);

  @override
  State<ProgramList> createState() => _ProgramListState();
}

class _ProgramListState extends State<ProgramList> {

  @override
  Widget build(BuildContext context) {
    AppLocalizations? localize = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    Widget sessionProgramList() => StreamBuilder<List<SessionProgram>>(
        key: UniqueKey(),
        stream: objectBox.getSessionPrograms(),
        builder: (context, snapshot) {
          return SliverList(delegate: SliverChildBuilderDelegate(((BuildContext context, int index) {
            if (snapshot.data == null || snapshot.data?.isEmpty == true) {
              return const SizedBox(height: 0);
            }

            SessionProgram program = snapshot.data![index];

            return ListTile(
              title: Text(program.title),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgramCreate(program: program)),
                );
              },
              onLongPress: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text("${localize?.program_list_alert_title}"),
                    content: Text("${localize?.program_list_alert_description} \n${program.title}"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: Text("${localize?.program_list_alert_cancel}"),
                      ),
                      TextButton(
                        onPressed: () {
                          objectBox.sessionProgramBox.remove(program.id);
                          Navigator.pop(context, 'OK');
                        },
                        child: Text(
                            "${localize?.program_list_alert_delete}",
                            style: TextStyle(color: colorScheme.error)),
                      ),
                    ],
                  )),
            );
          }), childCount: snapshot.hasData ? snapshot.data!.length : 0),
          );
        });

    return Scaffold(
        appBar: AppBar(
          title: Text(localize?.program_list_title ?? "-"),
        ),
        body: CustomScrollView(
          slivers: [
            sessionProgramList()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, RouteNames.programCreate),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100.0))),
          child: const Icon(Icons.add),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

