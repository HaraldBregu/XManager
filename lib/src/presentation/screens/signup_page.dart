import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _SignupHeader(),
            _SignupContainer(),
          ],
        ),
      ),
    );
  }
}

class _SignupHeader extends StatelessWidget {
  const _SignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      backgroundColor: Colors.transparent,
      title: Icon(Icons.place),
      centerTitle: true,
    );
  }
}

class _SignupContainer extends StatelessWidget {
  const _SignupContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final ColorScheme colorScheme = theme.colorScheme;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final fullnameController = TextEditingController();

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign Up",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: textTheme.headlineLarge?.fontSize,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Create an account and start using xmanager app with all features",
              textAlign: TextAlign.left,
              style: TextStyle(
                //color: Colors.white,
                fontSize: textTheme.bodyLarge?.fontSize,
                //fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                prefixIcon: Icon(Icons.person_rounded),
                hintText: 'Full name',
                labelText: 'Full name',
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 10.0),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                prefixIcon: Icon(Icons.email_rounded),
                hintText: 'Enter email address',
                labelText: 'Email',
              ),
              onChanged: (value) {},
            ),
            //const SizedBox(height: 20.0),

            const SizedBox(height: 25.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {},
              child: Text("CONTINUE WITH EMAIL"),
            ),
          ],
        ),
      ),
    );
  }
}
