import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({
    required this.baseUrl,
  });

  Future<http.Response> get(String path) async {
    final response = await http.get(Uri.parse('$baseUrl$path'));
    return response;
  }

  Future<http.Response> post(String path, {required Map<String, dynamic> body}) async {
    final response = await http.post(
      Uri.parse('$baseUrl$path'),
      body: body,
    );
    return response;
  }
}
