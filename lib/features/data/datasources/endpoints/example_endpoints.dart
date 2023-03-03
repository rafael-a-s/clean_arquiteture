class ExampleEndPoints{
  static Uri getGitHub(String username) =>
      Uri.https('api.github.com/users/${username}');
}