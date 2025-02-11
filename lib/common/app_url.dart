class AppUrl {
   final String post = 'https://jsonplaceholder.typicode.com/posts/';
   String comments(String postId) => 'https://jsonplaceholder.typicode.com/posts/$postId/comments/';
   String user(String userId) => 'https://jsonplaceholder.typicode.com/users/$userId';
}