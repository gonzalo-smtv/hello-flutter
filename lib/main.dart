import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:particle_auth_core/particle_auth_core.dart';

void main() {
  ParticleInfo.set("174deb86-6371-4b53-a05a-64271df51eab",
      "c9QGqJAAL6KUmJZSvyq87CZLJhcdkwZFGL5a0tpb");
  ParticleBase.init(
      ChainInfo.Ethereum, Environment.production); // or Environment.debug
  ParticleAuthCore.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Flutter', style: TextStyle(color: Colors.green)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('A random:'),
            Text(appState.current.asLowerCase),
            ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text("Next")),
          ],
        ),
      ),
    );
  }
}
