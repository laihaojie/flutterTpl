import 'package:flutter/material.dart';
import 'package:flutter_tpl/utils/util.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("代办车务"),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Utils.color("#FFF"),
      body: const Center(
        child: Text("详情页"),
      ),
    );
  }
}
