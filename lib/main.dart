import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chat_app/cubit/profiles/profiles_cubit.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:chat_app/pages/splash_page.dart';
import 'package:chat_app/utils/secrets.dart' as secret;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    // TODO: Replace credentials with your own
    //url: 'SUPABASE_URL',
    //anonKey: 'SUPABASE_ANON_KEY',

    url: secret.url,
    anonKey: secret.anonKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfilesCubit>(
      create: (context) => ProfilesCubit(),
      child: MaterialApp(
        title: 'SupaChat',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: const SplashPage(),
      ),
    );
  }
}
