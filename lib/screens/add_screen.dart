import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_1118_stream_provider/model/post_model.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = TextEditingController();
    TextEditingController _contentController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          Text('제목'),
          TextField(
            controller: _titleController,
          ),
          Text('내용'),
          TextField(
            controller: _contentController,
          ),
          ElevatedButton(onPressed: (){
            Post post = Post(title: _titleController.text, content: _contentController.text, date: Timestamp.now());
            context.read<PostList>().addPost(post);
            Navigator.pop(context);
          }, child: Text('작성'))
        ],
      ),
    );
  }
}
