import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Post {
  String title;
  String content;
  Timestamp date;

  Post({required this.title, required this.content, required this.date});
}

class PostList extends ChangeNotifier {
  List<Post> list = [];

  void addPost(Post post){
    CollectionReference posts = FirebaseFirestore.instance.collection('posts');
    posts.add({
      'title':post.title,
      'content':post.content,
      'date':post.date
    }).catchError((error)=>print('Failed to add post: $error'));
  }

  Stream<QuerySnapshot> getPosts(){
    return FirebaseFirestore.instance.collection('posts').snapshots();
  }
}