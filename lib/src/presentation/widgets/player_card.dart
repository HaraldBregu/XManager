import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class PlayerCard extends StatelessWidget {
  final void Function() onTap;

  const PlayerCard({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
      child: Card(
        elevation: 1,
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              height: 50.0,
              width: 50.0,
              color: context.colorScheme.primaryContainer,
              //color: Color(0xffFF0E58),
              child: const Icon(
                Icons.person,
                //color: Colors.white,
                size: 25.0,
              ),
            ),
          ),
          title: Text("Marco Materazzi"),
          subtitle: Text("Player role"),
          onTap: onTap,
        ),
      ),
    );
  }
}
