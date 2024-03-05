import 'package:flutter/material.dart';
import 'package:flutter_atoms/widgets/atoms/icon_label.dart';
import 'package:flutter_atoms/widgets/molecules/base_card.dart';
import 'package:flutter_atoms/widgets/molecules/spaced_row.dart';
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
        scaffoldBackgroundColor: Colors.white,
        cardTheme: const CardTheme(
          color: Colors.white,
        ),
        shadowColor: Colors.grey[300]!,
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
        collapsedWidget: AppBar(
          title: const Text('Atoms Demo'),
          backgroundColor: Colors.pinkAccent,
          centerTitle: true,
          foregroundColor: Colors.white,
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
            itemBuilder: (context, index) => BaseCard(
                  spacing: 10,
                  header: SpacedRow(children: [
                    Text('Title $index'),
                  ]),
                  body: Column(
                    children: [
                      Text('Description $index'),
                      Text("This is a description of the card $index")
                    ],
                  ),
                  footer: SpacedRow(
                    children: [
                      IconLabel(icon: Icons.people, label: '10'),
                      IconLabel(icon: Icons.people, label: '20')
                    ],
                  ),
                )));
  }
}
