import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectScreen extends StatelessWidget {
  final String docId;
  const SelectScreen({Key? key, required this.docId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QueryDocumentSnapshot data = context.read<QuerySnapshot>().docs.singleWhere((element) => element.id == docId);

    return Scaffold(
      body: Column(
        children: [
          Text(data['title']),
          Text(data['content'])
        ],
      ),
    );
  }
}
