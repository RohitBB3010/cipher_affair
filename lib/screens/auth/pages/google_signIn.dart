import 'package:auto_size_text/auto_size_text.dart';
import 'package:cipher_affair/consts/colors.dart';
import 'package:cipher_affair/consts/spacing_consts.dart';
import 'package:cipher_affair/screens/auth/auth_cubit.dart';
import 'package:cipher_affair/screens/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sign_in_button/sign_in_button.dart';

class GoogleSignIn extends StatefulWidget {
  const GoogleSignIn({super.key});

  @override
  State<GoogleSignIn> createState() => _GoogleSignInState();
}

class _GoogleSignInState extends State<GoogleSignIn> {
  // final AudioPlayer player = AudioPlayer();
  // late AppLifecycleState? state;
  // late final AppLifecycleListener _listener;

  // @override
  // void initState() {
  //   super.initState();
  //   player.setAsset('assets/music/backgroundMusic.mp3');
  //   player.play();
  //   player.setLoopMode(LoopMode.all);
  //   state = SchedulerBinding.instance.lifecycleState;
  //   _listener =
  //       AppLifecycleListener(onInactive: pauseMusic, onResume: playMusic);
  // }

  // Future<void> pauseMusic() async {
  //   debugPrint('pausing music');
  //   await player.pause();
  // }

  // Future<void> playMusic() async {
  //   await player.play();
  // }

  // Future<void> disposePlayer() async {
  //   player.dispose();
  // }

  // @override
  // void dispose() {
  //   player.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primary_3,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    image: DecorationImage(
                        image: AssetImage('assets/backgrounds/login_page.jpeg'),
                        opacity: 0.4,
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.08,
                      vertical: MediaQuery.of(context).size.height * 0.05),
                  child: Column(
                    children: [
                      SpacingConsts().customHeightBetweenFields(context, 0.15),
                      const AutoSizeText(
                        'Cipher Scape',
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.amber,
                            fontFamily: 'Legio',
                            fontSize: 55.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SpacingConsts().mediumHeightBetweenFields(context),
                      const AutoSizeText(
                        'Decipher',
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.amber,
                            fontFamily: 'Fira',
                            fontSize: 35),
                      ),
                      SpacingConsts().customHeightBetweenFields(context, 0.01),
                      const AutoSizeText(
                        'OR',
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.amber,
                            fontFamily: 'Fira',
                            fontSize: 25),
                      ),
                      SpacingConsts().customHeightBetweenFields(context, 0.01),
                      const AutoSizeText(
                        'Die',
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.amber,
                            fontFamily: 'Fira',
                            fontSize: 35),
                      ),
                      SpacingConsts().smallHeightBetweenFields(context),
                      SpacingConsts().mediumHeightBetweenFields(context),
                      SignInButton(Buttons.googleDark, onPressed: () {
                        context.read<AuthCubit>().googleSignIn();
                      })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
