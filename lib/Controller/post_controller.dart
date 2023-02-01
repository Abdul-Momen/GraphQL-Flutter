import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:untitled2/Repository/post_repository.dart';

import '../Response/create_post.dart';



class PostController extends GetxController {
  final PostRepository userRepository = Get.put(PostRepository());
  final postList = [].obs;

  final title = "".obs;


  Future<void> getAllPost() async {
    var response = await userRepository.getAllPost(1, 105); // paginate
    if(response.posts.data.isNotEmpty)
      {
        postList.value = response.posts.data;
      }
    else
      {
        print("empty data!");
      }
  }
  Future<void> createPost() async {
    var result = await userRepository.createPost(title.value); // paginate
    print(result.createPost.title);
  }



  @override
  void onInit() async {
    await getAllPost();
  }
}
