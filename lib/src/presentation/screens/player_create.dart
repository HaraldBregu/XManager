import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/presentation/bloc/player_bloc.dart';
import 'package:xmanager/src/presentation/bloc/player_event.dart';
import 'package:xmanager/src/presentation/bloc/player_state.dart';

class PlayerCreate extends StatelessWidget {
  const PlayerCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlayerBloc, PlayerState>(
      listenWhen: (context, state) {
        return state is SavedPlayerSuccess;
      },
      listener: (context, state) {
        if (state is SavedPlayerSuccess) {
          context.pop();
        }
      },
      child: Scaffold(
        body: const _PlayerCreateBody(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
            onPressed: () {
              final playerBloc = context.read<PlayerBloc>();
              final userState = playerBloc.state;
              if (userState is PlayerFullnameAdded) {
                playerBloc.add(SavePlayer(userState.fullName));
              }
            },
            child: const Center(
              child: Text('SAVE'),
            ),
          ),
        ),
      ),
    );
  }
}

class _PlayerCreateBody extends StatelessWidget {
  const _PlayerCreateBody();

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        _PlayerCreateHeader(),
        _PlayerCreateContainer(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 120,
          ),
        ),
      ],
    );
  }
}

class _PlayerCreateHeader extends StatelessWidget {
  const _PlayerCreateHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      title: Text("Player create"),
    );
  }
}

class _PlayerCreateContainer extends StatelessWidget {
  const _PlayerCreateContainer({super.key});

  @override
  Widget build(BuildContext context) {
    //final PlayerBloc playerBloc = context.read<PlayerBloc>();

    return SliverToBoxAdapter(
      child: Padding(
        //padding: const EdgeInsets.fromLTRB(5, 8, 5, 0),
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
        child: Column(
          children: <Widget>[
            TextField(
              //controller: fullnameController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Fullname',
                labelText: 'Fullname',
                errorText: null,
              ),
              onChanged: (value) =>
                  context.read<PlayerBloc>().add(SetPlayerFullName(value)),
            ),
          ],
        ),
      ),
    );
  }
}
