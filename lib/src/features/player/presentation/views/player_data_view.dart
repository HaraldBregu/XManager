import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/features/player/data/datasources/player_datasource.dart';
import 'package:xmanager/src/features/player/data/repositories/player_repository_impl.dart';
import 'package:xmanager/src/features/player/domain/repositories/player_repository.dart';
import 'package:xmanager/src/features/player/presentation/bloc/bloc.dart';

/*
class PlayerDataView extends StatelessWidget {
  const PlayerDataView({required this.player});
  final Player player;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? localize = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surfaceVariant,
      appBar: AppBar(
        title: Text(localize?.player_detail_title ?? "-"),
      ),
      body: RepositoryProvider(
        create: PlayerRepositoryImpl(PlayerDataSourceImpl()),
        child: BlocProvider(
          create: (_) => PlayerBloc(
              RepositoryProvider.of<PlayerRepository>(context),
          )..add(LoadPlayerEvent(player)),
          child: BlocBuilder<PlayerBloc, PlayerState>(
            builder: (context, state) {
              if (state is PlayerStateEmpty) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is PlayerStateLoaded) {
                final name = state.playerEntity.fullname;
                return Center(child: Text(name));
              }
              return const Placeholder();
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //BlocProvider.of<PlayerBloc>(context).add(const GetPlayerEvent("fefc"));

        },
        backgroundColor: Colors.green,
        icon: const Icon(Icons.play_circle),
        label: const Text('do something'),
      ),
    );
  }
}
*/