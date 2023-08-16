import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/localizations_extension.dart';
import 'package:xmanager/src/core/presentation/bloc/user/bloc.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class CoachCard extends StatelessWidget {
  const CoachCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
          child: Card(
            elevation: 1,
            child: Column(
              children: [
                BlocBuilder<UserBloc, UserState>(
                  builder: (bloc, state) {
                    if (state is UserAuthorizedState) {
                      return ListTile(
                        title: const Text("Massimo Allegri"),
                        subtitle: const Text("FiFa Pro"),
                        leading: const FittedBox(
                          child: CircleAvatar(
                            child: Icon(
                              Icons.person,
                            ),
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.east,
                          ),
                          onPressed: () => {},
                        ),
                        onTap: () => context.pushNamed("Profile page"),
                      );
                    }
                    if (state is UserUnAuthorizedState) {
                      return ListTile(
                        title: const Text("Massimo Allegri"),
                        subtitle: const Text("FiFa Pro"),
                        leading: const FittedBox(
                          child: CircleAvatar(
                            child: Icon(
                              Icons.person,
                            ),
                          ),
                        ),
                        onTap: () => context.pushNamed("Profile page"),
                      );
                    }

                    return const Text("NO STATE");
                  },
                ),
              ],
            ),
          )),
    );
  }
}
