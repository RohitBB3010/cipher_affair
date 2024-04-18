import 'package:cipher_affair/firebase_options.dart';
import 'package:cipher_affair/screens/auth/auth_cubit.dart';
import 'package:cipher_affair/screens/auth/auth_state.dart';
import 'package:cipher_affair/screens/auth/pages/enter_page.dart';
import 'package:cipher_affair/screens/auth/pages/otp_page.dart';
import 'package:cipher_affair/screens/mandatory_fields/mandatory_fields_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
        if (state is AuthUnauthenticatedState) {
          return EnterPage();
        }

        if (state is OtpSentState) {
          return OtpPage();
        }

        if (state is AuthAuthenticatedState) {
          return const MandatoryFieldsPage();
        }
        return Container();
      }),
    );
  }
}
