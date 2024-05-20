import 'package:audio_video_calling/flow/login_page/controller/login_page_state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPageAuthenticationProviders extends StatelessWidget {
  static const _bodyWidthPercent = 0.8;
  const LoginPageAuthenticationProviders({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: width * _bodyWidthPercent,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          LoginPageFacebookButton(),
          LoginPageGoogleButton(),
          LoginPageTwitterButton(),
        ],
      ),
    );
  }
}

class LoginPageGoogleButton extends ConsumerWidget {
  static const _iconPadding = 10.0, _borderRadius = 50.0;
  const LoginPageGoogleButton({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final notifier = ref.read(loginPageStateNotifierProvider.notifier);
    return InkWell(
      onTap: () {
        notifier.loginWithGoogle();
      },
      borderRadius: BorderRadius.circular(_borderRadius),
      child: Padding(
        padding: const EdgeInsets.all(_iconPadding),
        child: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          child: Icon(
            FontAwesomeIcons.google,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}

class LoginPageFacebookButton extends StatelessWidget {
  static const _iconPadding = 10.0, _borderRadius = 50.0;
  const LoginPageFacebookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(_borderRadius),
      child: Padding(
        padding: const EdgeInsets.all(_iconPadding),
        child: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Icon(
            FontAwesomeIcons.facebookF,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}

class LoginPageTwitterButton extends StatelessWidget {
  static const _iconPadding = 10.0, _borderRadius = 50.0;
  const LoginPageTwitterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(_borderRadius),
      child: Padding(
        padding: const EdgeInsets.all(_iconPadding),
        child: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Icon(
            FontAwesomeIcons.twitter,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
