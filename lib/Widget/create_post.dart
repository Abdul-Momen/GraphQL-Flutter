import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled2/Controller/post_controller.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller  = Get.put(PostController());
    final key = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Create Post"),
        ),
        body: Center(
          child: Form(
            key: key, child:
          Column(
            children: [
              TextFormField(
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                onSaved: (value){
                  controller.title.value=value!;
                },
              ),
              OutlinedButton(
                onPressed: (){
                  if(key.currentState!.validate())
                    {
                      key.currentState!.save();
                      controller.createPost();
                    }
                },
                child: Text("Add"),
              )
            ],
          ),
          ),
        ),
      ),
    );
  }
}
