/*
  Enum representing different states of an API response.
  This helps in managing UI states based on API results.
*/
enum Status {
  /// Indicates that the API call was successful.
  success,  

  /// Indicates that an error occurred during the API call.
  error,    

  /// Indicates that the API call is still in progress.
  loading   
}
