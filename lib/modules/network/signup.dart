import 'dart:convert';
import 'package:http/http.dart' as http;
class SendSignUpData {
  static void sendData(String mail,String pass) async {
    final url = Uri.parse('http://localhost:8000/signup');
    final headers = {'Content-Type': 'application/json'};
    final data = {'name': 'John Doe', 'salary': '5000', 'age': '30'};
    final body = json.encode(data);

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      // Handle successful response
      final jsonResponse = json.decode(response.body);
      // ...
    } else {
      // Handle error response
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}