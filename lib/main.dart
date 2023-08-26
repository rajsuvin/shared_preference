// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Login Page with Shared Preferences',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: LoginPage(),
//     );
//   }
// }
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   bool _rememberMe = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _loadSavedData();
//   }
//
//   _loadSavedData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _usernameController.text = prefs.getString('username') ?? '';
//       _passwordController.text = prefs.getString('password') ?? '';
//       _rememberMe = prefs.getBool('rememberMe') ?? false;
//     });
//   }
//
//   _saveData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     if (_rememberMe) {
//       prefs.setString('username', _usernameController.text);
//       prefs.setString('password', _passwordController.text);
//     } else {
//       prefs.remove('username');
//       prefs.remove('password');
//     }
//     prefs.setBool('rememberMe', _rememberMe);
//   }
//
//   _login() {
//     // Perform your login logic here
//     // For now, let's just print the entered username and password
//     print('Username: ${_usernameController.text}');
//     print('Password: ${_passwordController.text}');
//
//     _saveData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login Page'),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextField(
//                 controller: _usernameController,
//                 decoration: InputDecoration(labelText: 'Username'),
//               ),
//               TextField(
//                 controller: _passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(labelText: 'Password'),
//               ),
//               Row(
//                 children: [
//                   Checkbox(
//                     value: _rememberMe,
//                     onChanged: (value) {
//                       setState(() {
//                         _rememberMe = value!;
//                       });
//                     },
//                   ),
//                   Text('Remember me'),
//                 ],
//               ),
//               ElevatedButton(
//                 onPressed: _login,
//                 child: Text('Login'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Example',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    });
  }

  void _login() async {
    // Simulate a login process
    if (_usernameController.text == 'suvin' && _passwordController.text == 'password') {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      setState(() {
        _isLoggedIn = true;
      });
    }
  }

  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Example'),
      ),
      body: Center(
        child: _isLoggedIn
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, suvin!'),
            ElevatedButton(
              onPressed: _logout,
              child: Text('Logout'),
            ),
          ],
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}





