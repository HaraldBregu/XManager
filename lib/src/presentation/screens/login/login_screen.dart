import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/presentation/bloc/bloc.dart';
import 'package:xmanager/src/presentation/screens/login/bloc/login_bloc.dart';
import 'package:xmanager/src/presentation/screens/login/bloc/login_event.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _LoginAppBar(),
            _LoginContainer(),
          ],
        ),
      ),
    );
  }
}

class _LoginAppBar extends StatelessWidget {
  const _LoginAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.help_outline),
          onPressed: () => showInfoDialog(context),
        ),
      ],
    );
  }

  Future<void> showInfoDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Information!'),
          content: SizedBox(
            height: 400,
            width: 300,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 20),
                  Text(
                    loremIpsum(words: 360, paragraphs: 3, initWithLorem: true),
                  )
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => context.pop(),
              child: const Text("Done"),
            ),
          ],
        );
      },
    );
  }
}

class _LoginContainer extends StatelessWidget {
  const _LoginContainer();

  @override
  Widget build(BuildContext context) {
    final loginEnabled = context.watch<LoginBloc>().state.loginButtonEnabled;

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
              "Wellcome back!",
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
              "Sign in to your account!",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: context.textTheme.bodyLarge?.fontSize,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 30.0),
            TextFormField(
                initialValue: context.read<LoginBloc>().state.email,
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(top: 16, bottom: 16, left: 16),
                  prefixIcon: const Icon(Icons.email_outlined),
                  hintText: 'Enter email address',
                  labelText: 'Email address',
                  errorText: context.watch<LoginBloc>().state.emailError,
                ),
                onTapOutside: (value) {
                  FocusScope.of(context).unfocus();
                  context.read<LoginBloc>().add(InputEmailFinishedEvent());
                },
                onChanged: (value) {
                  //emailController.text = value;
                  context.read<LoginBloc>().add(InputEmailEvent(email: value));
                }),
            const SizedBox(height: 20.0),
            TextFormField(
              initialValue: context.read<LoginBloc>().state.password,
              obscureText: !context.watch<LoginBloc>().state.passwordVisible,
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
                  onPressed: () => context
                      .read<LoginBloc>()
                      .add(TogglePasswordVisibilityEvent()),
                  icon: context.watch<LoginBloc>().state.passwordVisible
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
              ),
              onTapOutside: (value) {
                FocusScope.of(context).unfocus();
                context.read<LoginBloc>().add(InputPasswordFinishedEvent());
              },
              onTap: () {
                context.read<LoginBloc>().add(InputPasswordFinishedEvent());
              },
              onChanged: (value) async => context
                  .read<LoginBloc>()
                  .add(InputPasswordEvent(password: value)),
            ),
            const SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerRight,
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Forgot password?',
                      style: TextStyle(
                        color: context.colorScheme.primary,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.pushNamed("recovery screen"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25.0),
            BlocListener<UserBloc, UserState>(
              listenWhen: (context, state) {
                return state is UserNetworkErrorState ||
                    state is UserLoginErrorState ||
                    state is UserAuthenticatingState;
              },
              listener: (context, state) {
                if (state is UserAuthenticatingState) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                } else if (state is UserNetworkErrorState) {
                  context.pop();

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Network"),
                        content: const Text("This is my message."),
                        actions: [
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              context.pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else if (state is UserLoginErrorState) {
                  context.pop();

                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Login error"),
                        content: const Text("login error"),
                        actions: [
                          TextButton(
                            child: Text("OK"),
                            onPressed: () {
                              context.pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(55),
                ),
                onPressed: loginEnabled
                    ? () {
                        TextInput.finishAutofillContext();
                        final loginBloc = context.read<LoginBloc>();
                        final email = loginBloc.state.email;
                        final password = loginBloc.state.password;
                        final event = LogInWithEmailEvent(
                          email: email ?? '',
                          password: password ?? '',
                        );

                        final userBloc = context.read<UserBloc>();
                        userBloc.add(event);
                      }
                    : null,
                child: Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: context.textTheme.bodyLarge?.fontSize,
                    fontFamily: context.textTheme.bodyLarge?.fontFamily,
                    fontWeight: FontWeight.w900,
                  ),
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
                      text: 'Dont have an account?',
                      style: TextStyle(
                        color: context.colorScheme.primary,
                        fontSize: context.textTheme.titleMedium?.fontSize,
                        fontFamily: context.textTheme.titleMedium?.fontFamily,
                      ),
                    ),
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: 'Sign Up',
                      style: TextStyle(
                        color: context.colorScheme.primary,
                        fontSize: context.textTheme.titleMedium?.fontSize,
                        fontFamily: context.textTheme.titleMedium?.fontFamily,
                        fontWeight: FontWeight.w900,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context.goNamed("signup screen"),
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
