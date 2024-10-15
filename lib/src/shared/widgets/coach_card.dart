import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../presentation/bloc/user/user_bloc.dart';
import '../presentation/bloc/user/user_state.dart';

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
                    if (state is UserAuthenticatedState) {
                      return ListTile(
                        title: const Text("Massimo Allegri"),
                        subtitle: const Text("Manager"),
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
                        // onTap: () => context.pushNamed("Profile page"),
                      );
                    }
                    if (state is UserInitialState) {
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
