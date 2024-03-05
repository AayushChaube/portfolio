import 'package:flutter/material.dart';

import 'dashed_circle.dart';
import 'dashed_line.dart';

List<String> titleList =
    List<String>.generate(30, (index) => 'Title ${index + 1}');
List<String> subtitleList =
    List<String>.generate(30, (index) => 'Subtitle ${index + 1}');

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('PoC'),
        ),
        body: ListView.builder(
          itemCount: titleList.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: TileLeadingWidget(
                tileIndex: index,
              ),
              title: Text(titleList.elementAt(index)),
              subtitle: Text(subtitleList.elementAt(index)),
            );
          },
        ),
      ),
    );
  }
}

class TileLeadingWidget extends StatelessWidget {
  final int tileIndex;

  const TileLeadingWidget({super.key, required this.tileIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        tileIndex == 0
            ? const SizedBox.shrink()
            : const DashedLine(
                height: 10.0,
                color: Colors.deepOrangeAccent,
              ),
        const DashedCircle(
          color: Colors.deepOrangeAccent,
          child: Padding(
            padding: EdgeInsets.all(6.0),
            child: Icon(Icons.money),
          ),
        ),
        tileIndex == titleList.length - 1
            ? const SizedBox.shrink()
            : const DashedLine(
                height: 10.0,
                color: Colors.deepOrangeAccent,
              )
      ],
    );
  }
}
