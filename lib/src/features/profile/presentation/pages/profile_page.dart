import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _ProfilePageBody(),
    );
  }
}

class _ProfilePageBody extends StatelessWidget {
  const _ProfilePageBody();

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        _ProfilePageHeader(),
        _ProfilePageContent(),
      ],
    );
  }
}

class _ProfilePageHeader extends StatelessWidget {
  const _ProfilePageHeader();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text("Profile"),
      actions: [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () => context.pushNamed('settings'),
        ),
      ],
    );
  }
}

class _ProfilePageContent extends StatelessWidget {
  const _ProfilePageContent();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final fullnameController = TextEditingController();

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 8, 5, 0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: fullnameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Fullname',
                  labelText: 'Fullname',
                ),
                onChanged: (value) {},
                validator: (value) {
                  final noValue = value == null || value.isEmpty;
                  return noValue ? 'Fullname is mandatory' : null;
                },
              ),
              TextFormField(
                controller: fullnameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  hintText: 'Role',
                  labelText: 'Role',
                ),
                onChanged: (value) {},
                validator: (value) {
                  final noValue = value == null || value.isEmpty;
                  return noValue ? 'Role is mandatory' : null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
