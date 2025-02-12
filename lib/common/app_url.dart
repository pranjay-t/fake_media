/* 
A utility class that contains API endpoint URLs.
This class provides predefined endpoints for fetching posts,comments related to a specific post, and user details.
*/

class AppUrl {

  // Base URL for fetching posts.

   final String post = 'https://jsonplaceholder.typicode.com/posts/';

  /* 
   Returns the URL for fetching comments of a specific post.
    - **Parameters:**  
    - [postId]: The ID of the post for which comments are to be retrieved.
    - **Returns:** A formatted URL string for fetching comments of that specified post.
  */

   String comments(String postId) => 'https://jsonplaceholder.typicode.com/posts/$postId/comments/';

  /*
   Returns the URL for fetching user details.
    - **Parameters:**  
    - [userId]: The ID of the user whose details are to be retrieved.
    - **Returns:** A formatted URL string for fetching user details.
  */
   String user(String userId) => 'https://jsonplaceholder.typicode.com/users/$userId';
}