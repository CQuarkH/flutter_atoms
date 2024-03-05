import 'package:flutter/material.dart';
import 'package:flutter_atoms/widgets/organisms/sliver_appbar_scaffold.dart';

void main() {
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppbarScaffold(
        topSpace: 0,
        collapsedWidget: Container(
          color: Colors.pinkAccent,
        ),
        expandedWidget: Stack(children: [
          Container(
            color: Colors.deepPurple,
          ),
        ]),
        title: 'Atoms Demo',
        child: ListView.separated(
          padding: const EdgeInsets.all(8),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: 10,
          itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.deepPurpleAccent,
            ),
            height: 200,
          ),
        ));
  }
}
