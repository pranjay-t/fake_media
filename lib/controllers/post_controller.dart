import 'dart:math';
import 'package:fake_media/api/api_services.dart';
import 'package:fake_media/common/app_url.dart';
import 'package:fake_media/models/app_data.dart';
import 'package:fake_media/models/comment_model.dart';
import 'package:fake_media/models/post_model.dart';
import 'package:fake_media/models/user_model.dart';
import 'package:fake_media/response/status.dart';
import 'package:get/get.dart';

// Controller to manage posts, comments, and related data operations.
// Utilizes GetX for state management.
class PostController extends GetxController {
  // Singleton instance of PostController.
  static final PostController _instance = PostController._internal();
  factory PostController() => _instance;
  PostController._internal();

  // API service instance for making network requests.
  final ApiServices _apiServices = ApiServices();

  // URL configurations for API endpoints.
  final AppUrl _appUrl = AppUrl();

  // Observable status for request state management.
  final requestStatus = Status.loading.obs;
  
  // Observable string to store error messages.
  final errorMessage = ''.obs;

  // Application-wide data storage instance.
  final AppData _appData = AppData();

  // Sets the error message.
  void setError(String error) => errorMessage.value = error;

  // Updates the request status.
  void setRequestStatus(Status status) => requestStatus.value = status;

  // Fetches all posts from the API and updates the application data.
  Future<void> fetchPosts() async {
    try {
      final res = await _apiServices.getApi(_appUrl.post);
      var postList =
          (res as List).map((json) => PostModel.fromJson(json)).toList();
      _appData.setPosts(postList);
      setRequestStatus(Status.success);
    } catch (e) {
      setRequestStatus(Status.error);
      setError(e.toString());
    }
  }

  // Fetches a specific post by ID, caches it, and updates the state.
  Future<void> fetchPostById(String postId) async {
    if (_appData.postById.containsKey(postId)) {
      return;
    }
    try {
      final res = await _apiServices.getApi(_appUrl.post + postId.toString());
      if (res != null && res is Map<String, dynamic>) {
        final post = PostModel.fromJson(res);
        _appData.setPost(post, postId);
        setRequestStatus(Status.success);
      }
    } catch (e) {
      setRequestStatus(Status.error);
      setError(e.toString());
    }
  }

  // Fetches comments for a given post ID and updates the state.
  Future<void> fetchCommentsByPostId(String postId) async {
    try {
      final res =
          await _apiServices.getApi(_appUrl.comments(postId.toString()));
      var commentList =
          (res as List).map((json) => CommentModel.fromJson(json)).toList();
      _appData.setComments(commentList);
      setRequestStatus(Status.success);
    } catch (e) {
      setRequestStatus(Status.error);
      setError(e.toString());
    }
  }

  // Creates a new post with a randomly assigned user ID and updates the state.
  Future<void> createPost(String title, String body) async {
    final newUserId = Random().nextInt(1000);
    try {
      setRequestStatus(Status.loading);
      final res = await _apiServices.postApi(
        _appUrl.post,
        {
          "title": title,
          "body": body,
          "userId": newUserId,
        },
      );

      if (res != null && res is Map<String, dynamic>) {
        final newPost = PostModel.fromJson(res);
        _appData.setNewPost(newPost);
        _appData.setPost(newPost, newPost.postId);

        UserModel newUser = UserModel(
          userId: newUserId.toString(),
          name: 'newUser',
          username: 'newUser',
        );
        _appData.setUser(newUser, newUserId.toString());
        setRequestStatus(Status.success);
      } else {
        setRequestStatus(Status.error);
        setError("Failed to create post");
      }
    } catch (e) {
      setRequestStatus(Status.error);
      setError(e.toString());
    }
  }

  // Getter for retrieving all posts.
  List<PostModel> get posts => _appData.posts;

  // Getter for retrieving all comments.
  List<CommentModel> get comments => _appData.comments;

  // Getter for retrieving posts by their ID.
  Map<String, PostModel> get postById => _appData.postById;

   // Getter for retrieving postId.
  Rxn<String> get postId => _appData.selectedPostId;

  
}
