import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Controller/post_controller.dart';
import 'package:untitled2/HelperUtils/global_constant.dart';
import 'package:untitled2/Widget/create_post.dart';

import '../Response/post_response.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controller = Get.put(PostController());

  @override
  void initState() {
    HelperUtils.setToken('355ff67bd593824fea08eaef566e5c35');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.to(const CreatePostPage());
        },
        icon: const Icon(Icons.add),
        label: const Text('Add Post'),
        backgroundColor: Colors.red,
      ),
      appBar: AppBar(
        title: Text("Graphql Demo"),
      ),
      body: Obx(
          ()=> ListView.builder(
            itemCount: controller.postList.length,
            itemBuilder: (context,index){
              Datum post = controller.postList[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ID: ${post.id}"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text("Title: ${post.title}"),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
