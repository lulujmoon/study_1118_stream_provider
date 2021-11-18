import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_1118_stream_provider/model/post_model.dart';
import 'package:study_1118_stream_provider/screens/list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<QuerySnapshot?>(
          create: (_) => PostList().getPosts(),
          initialData: null,
        ),
        ChangeNotifierProvider(create: (_) => PostList())
      ],
      child: MaterialApp(
        home: ListScreen(),
      ),
    );
  }
}
