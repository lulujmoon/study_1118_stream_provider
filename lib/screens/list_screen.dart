import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:study_1118_stream_provider/screens/add_screen.dart';
import 'package:provider/provider.dart';
import 'package:study_1118_stream_provider/screens/select_screen.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddScreen()));
        },
        child: Icon(Icons.add),
      ),
      body: buildListView(context),
    );
  }

  ListView buildListView(BuildContext context) {
    return ListView(
      children: context
          .watch<QuerySnapshot>()
          .docs
          .map((post) => buildInkWell(context, post))
          .toList(),
    );
  }

  InkWell buildInkWell(
      BuildContext context, QueryDocumentSnapshot<Object?> post) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SelectScreen(docId: post.id)));
      },
      child: Card(
        child: Column(
          children: [Text(post['title']), Text(post['content'])],
        ),
      ),
    );
  }
}
