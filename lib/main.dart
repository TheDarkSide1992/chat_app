import 'package:flutter/material.dart';
import 'package:chat_app/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:chat_app/pages/splash_page.dart';
import 'package:chat_app/utils/secrets.dart' as secret;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    // TODO: Replace credentials with your own
    //url: 'SUPABASE_URL',
    url: secret.url,
    //anonKey: 'SUPABASE_ANON_KEY',
    anonKey: secret.anonKey,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'It Is A Chat App',
      theme: appTheme,
      home: const SplashPage(),
    );
  }
}
