import "package:http/http.dart" as http;


class WalkGuide {
  final String url = 'http://localhost:8888/';

  //class constructor
  WalkGuide();

  Future<http.Response> fetchRoutes() {
    return http.get(url + 'routes/');
  }
}
