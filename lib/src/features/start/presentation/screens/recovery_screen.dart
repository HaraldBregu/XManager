import 'package:flutter/material.dart';
import '../../../../core/theme_extension.dart';

class RecoveryScreen extends StatelessWidget {
  const RecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _RecoveryAppBar(),
            _RecoveryContainer(),
          ],
        ),
      ),
    );
  }
}

class _RecoveryAppBar extends StatelessWidget {
  const _RecoveryAppBar();

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.transparent,
      title: Icon(Icons.key),
      centerTitle: true,
    );
  }
}

class _RecoveryContainer extends StatelessWidget {
  const _RecoveryContainer();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Recover account!",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: context.textTheme.headlineLarge?.fontSize,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Input your username or email!",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: context.textTheme.bodyLarge?.fontSize,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 30.0),
            TextFormField(
                //initialValue: context.read<LoginBloc>().state.email,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(top: 16, bottom: 16, left: 16),
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: 'Enter email address',
                  labelText: 'Email address',
                  //  errorText: context.watch<LoginBloc>().state.emailError,
                ),
                onTapOutside: (value) {
                  FocusScope.of(context).unfocus();
                  // context.read<LoginBloc>().add(InputEmailFinishedEvent());
                },
                onChanged: (value) {
                  //emailController.text = value;
                  //context.read<LoginBloc>().add(InputEmailEvent(email: value));
                }),
            const SizedBox(height: 25.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(55),
              ),
              onPressed: () {},
              child: Text(
                "Send email",
                style: TextStyle(
                  fontSize: context.textTheme.bodyLarge?.fontSize,
                  fontFamily: context.textTheme.bodyLarge?.fontFamily,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
