import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:puvoms/models/test_model.dart';
import 'package:puvoms/views/widgets/test_tile_widget.dart';

class TestList extends StatefulWidget {
  const TestList({super.key});

  @override
  State<TestList> createState() => _TestListState();
}

class _TestListState extends State<TestList> {
  @override
  Widget build(BuildContext context) {
    
    final test = Provider.of<List<Test>>(context);
    
    return ListView.builder(
      itemCount: test.length,
      itemBuilder: ((context, index) {
        return CustomTile(test: test[index],);
      }),
    );
  }
}