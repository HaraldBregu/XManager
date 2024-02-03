import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xmanager/src/core/theme_extension.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});
  /*Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: LinearProgressIndicator(
                value: context.watch<LoginBloc>()..passwordStrengthPerc,
                semanticsLabel: 'Linear progress indicator',
              ),
            ),*/
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _SignupAppBar(),
            _SignupContainer(),
          ],
        ),
      ),
    );
  }
}

class _SignupAppBar extends StatelessWidget {
  const _SignupAppBar();

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
  const _SignupContainer();

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
              "Sign In!",
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
              "Join Now Xmanager Community!",
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
            const SizedBox(height: 20.0),
            TextFormField(
              // initialValue: context.read<LoginBloc>().state.password,
              // obscureText: !context.watch<LoginBloc>().state.passwordVisible,
              enableSuggestions: false,
              autofillHints: const [AutofillHints.password],
              autocorrect: false,
              obscuringCharacter: "*",
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(top: 16, bottom: 16, left: 16),
                prefixIcon: const Icon(Icons.password_outlined),
                hintText: 'Password',
                labelText: 'Password',
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_off),
                ),
              ),
              onTapOutside: (value) {
                FocusScope.of(context).unfocus();
                //context.read<LoginBloc>().add(InputPasswordFinishedEvent());
              },
              onTap: () {
                //context.read<LoginBloc>().add(InputPasswordFinishedEvent());
              },
              onChanged: (value) {},
            ),
            const SizedBox(height: 25.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(55),
              ),
              onPressed: () {},
              child: Text(
                "Register with email",
                style: TextStyle(
                  fontSize: context.textTheme.bodyLarge?.fontSize,
                  fontFamily: context.textTheme.bodyLarge?.fontFamily,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Already have an account?',
                      style: TextStyle(
                        color: context.colorScheme.primary,
                        fontSize: context.textTheme.titleMedium?.fontSize,
                        fontFamily: context.textTheme.titleMedium?.fontFamily,
                      ),
                    ),
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: 'Sign In',
                      style: TextStyle(
                        color: context.colorScheme.primary,
                        fontSize: context.textTheme.titleMedium?.fontSize,
                        fontFamily: context.textTheme.titleMedium?.fontFamily,
                        fontWeight: FontWeight.w900,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.goNamed("login screen"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
