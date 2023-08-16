import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          _ProfileHeader(),
          _ProfileContent(),
        ],
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      title: Text("Profile"),
    );
  }
}

class _ProfileContent extends StatelessWidget {
  const _ProfileContent();

  @override
  Widget build(BuildContext context) {

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                prefixIcon: Icon(Icons.phone),
                hintText: 'Enter email address',
                labelText: 'Email',
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 10.0),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                prefixIcon: Icon(Icons.email),
                hintText: 'Enter email address',
                labelText: 'Email',
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 10.0),
            TextField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              obscuringCharacter: "*",
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                prefixIcon: Icon(Icons.key),
                hintText: 'Password',
                labelText: 'Password',
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 25.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {},
              child: Text("SAVE"),
            ),
          ],
        ),
      ),
   
    );
  }
}
