import 'package:flutter/material.dart';

// packages
import 'package:firebase_core/firebase_core.dart';

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationCompelete;

  const SplashPage({
    required Key key,
    required this.onInitializationCompelete,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _setup().then((_) {
      widget.onInitializationCompelete();
    }).catchError(
      (e) {
        debugPrint('Initialization failed: $e');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gchat",
      theme: ThemeData(
        dialogBackgroundColor: const Color.fromRGBO(36, 35, 49, 1.0),
        scaffoldBackgroundColor: const Color.fromRGBO(36, 35, 49, 1.0),
      ),
      home: Scaffold(
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    "assets/images/backround_image.png",
                  )),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _setup() async {
    try {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp();
      _registerServices();
    } catch (e) {
      debugPrint('Error initializing Firebase: $e');
    }
  }

  void _registerServices() {}
}
