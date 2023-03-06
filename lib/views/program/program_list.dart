import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xmanager/main.dart';
import 'package:xmanager/model/player_model.dart';
import 'package:xmanager/objectbox.g.dart';
import 'package:xmanager/views/program/program_create.dart';

class ProgramList extends StatefulWidget {
  const ProgramList({Key? key}) : super(key: key);

  @override
  State<ProgramList> createState() => _ProgramListState();
}

class _ProgramListState extends State<ProgramList> {


  /// Cards of players
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
            subtitle: Text(program.description),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProgramCreate(program: program)),
              );
            },
          );
        }), childCount: snapshot.hasData ? snapshot.data!.length : 0),
        );
      });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test Title"),
        ),
        body: CustomScrollView(
          slivers: [
            sessionProgramList()
          ],
        ),
        floatingActionButton: FloatingActionButton.small(
          onPressed: () => Navigator.pushNamed(context, RouteNames.programCreate),
          child: const Icon(Icons.add),
        )
    );
  }
}

