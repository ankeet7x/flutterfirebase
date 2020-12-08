import 'dart:convert';

// import 'package:http/http.dart' as http;

// class Authentication {
//   Future<void> signUp(String email, String password) async {
//     const url =
//         'https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=AIzaSyD4qsZY1YG9v59nOn_IDmu7h6iZJwnWztw';
//     final response = await http.post(url,
//         body: json.encode(
//             {'email': email, 'password': password, 'returnSecureToken': true}));
//     final responseData = json.decode(response.body);
//     print(responseData);
//   }
// }
