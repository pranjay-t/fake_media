import 'package:fake_media/models/comment_model.dart';
import 'package:fake_media/models/post_model.dart';
import 'package:fake_media/models/user_model.dart';
import 'package:get/get.dart';

class AppData {
  // Singleton instance of AppData
  static final AppData _instance = AppData._internal();
  
  // Factory constructor to return the same instance
  factory AppData() => _instance;
  
  // Private named constructor
  AppData._internal();

  // List of all posts, observable
  final RxList<PostModel> posts = <PostModel>[].obs;
  
  // List of all comments for specific post, observable
  final RxList<CommentModel> comments = <CommentModel>[].obs;
  
  // Map of posts indexed by post ID, observable
  final RxMap<String, PostModel> postById = <String, PostModel>{}.obs;
  
  // Map of users indexed by user ID, observable
  final RxMap<String, UserModel> users = <String, UserModel>{}.obs;
  
  // Selected post ID, observable
  final selectedPostId = Rxn<String>();
  
  // Selected user ID, observable
  final selectedUserId = Rxn<String>();

  // Sets the list of posts
  void setPosts(List<PostModel> postList) => posts.assignAll(postList);
  
  // Sets the list of comments
  void setComments(List<CommentModel> commentList) => comments.assignAll(commentList);
  
  // Adds/updates a post in the postById map
  void setPost(PostModel post, String postId) => postById[postId] = post;
  
  // Adds/updates a user in the users map
  void setUser(UserModel user, String userId) => users[userId] = user;
  
  // Inserts a new post at the beginning of the posts list
  void setNewPost(PostModel post) => posts.insert(0, post);
}
