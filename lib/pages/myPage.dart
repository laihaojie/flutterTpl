import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: Text("")),
        Container(
          width: double.infinity,
          margin: const EdgeInsets.all(10),
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(Icons.access_alarm_outlined),
              Icon(Icons.access_alarm_outlined),
              Icon(Icons.access_alarm_outlined),
              Icon(Icons.access_alarm_outlined),
            ],
          ),
        ),
        Container(
          width: 100,
          decoration: const BoxDecoration(color: Colors.red),
          child: const Text(
            "423",
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
