import 'package:flutter/material.dart';

class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage({super.key});

  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  final TextEditingController _studentIDController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLogin ? 'My Campus Marketplace' : 'Sign Up'),
      ),
      backgroundColor: Colors.grey[800],
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (!_isLogin)
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
            if (!_isLogin)
              TextFormField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
            if (!_isLogin)
              TextFormField(
                controller: _studentIDController,
                decoration: InputDecoration(
                  labelText: 'StudentID',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
            if (!_isLogin)
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
              ),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
              ),
              obscureText: true,
              style: const TextStyle(color: Colors.white),
            ),
            if (!_isLogin)
              TextFormField(
                controller: _confirmPasswordController,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
                obscureText: true,
                style: const TextStyle(color: Colors.white),
              ),
            const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _isLogin ? _login : _signup,
                 child: Text(_isLogin ? 'Login' : 'Sign Up'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                   _isLogin = !_isLogin;
                  });
               },
                child: Text(
                    _isLogin ? 'Create an account' : 'Have an account? Sign in'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() async {
    // Implement login logic here
    if (_isLogin) {
      String username = _usernameController.text.trim();
      String passwordHash = _passwordController.text.trim();

      if (username.isEmpty) {
        _showErrorDialog("Please enter your username.");
      } else if (passwordHash.isEmpty) {
        _showErrorDialog("Please enter your password.");
        return;
      }

      //Checking login logic
      /*
      var response = await http.post(
          Uri.parse('Insert server http here'),
          body: json.encode({'username': username,
                             'passwordHash': passwordHash}),
          headers: {'Content-Type': 'application/json},
        );

        if (response.statusCode == 200) {
          Navigator.push to application home
        } else {
          _showErrorDialog("Invalid username or password. Please try again.")
        }
      */
    }
  }

  void _signup() async {
    // Implement signup logic here
    if (!_isLogin) {
      String firstName = _firstNameController.text.trim();
      String lastName = _lastNameController.text.trim();
      String studentID = _studentIDController.text.trim();
      String studentEmail = _emailController.text.trim();
      String passwordHash = _passwordController.text.trim();
      String username = _usernameController.text.trim();
      String confirmPassword = _confirmPasswordController.text.trim();

      if (firstName.isEmpty) {
        _showErrorDialog("Please enter your first name.");
      } else if (!(lastName.isNotEmpty)) {
        _showErrorDialog("Please enter your last name.");
      } else if (int.tryParse(studentID) == null) {
        _showErrorDialog("Student ID must be numeric.");
      } else if (passwordHash.length < 8) {
        _showErrorDialog("Password must be at least 8 characters");
      } else if (passwordHash.isEmpty || confirmPassword.isEmpty) {
        _showErrorDialog("Please enter password and confirm password");
      } else if (passwordHash != confirmPassword) {
        _showErrorDialog("Passwords do not match.");
      } else if (studentEmail.isEmpty ||
          !studentEmail.endsWith('@my.sctcc.edu')) {
        _showErrorDialog(studentEmail.isEmpty
            ? "Please enter email"
            : "Please enter valid SCTCC email address ending in @my.sctcc.edu");
      } else if (username.isEmpty) {
        _showErrorDialog("Please enter a username");
      } else {
        // Continue with sign up process
        //Verify that the email & username don't already exist in the database

        /* Posting to http server
        var response = await http.post(
          Uri.parse('Insert server http here'),
          body: json.encode({'firstName': firstName,
                             'lastName': lastName,
                             'studentID': studentID,
                             'studentEmail': studentEmail,
                             'passwordHash': passwordHash,
                             'username': username}),
          headers: {'Content-Type': 'application/json},
        );

        if (response.statusCode == 200) {
          Navigator.push to application login screen
        } else {
          _showErrorDialog("Account already exists")
          Navigator.push to login screen
        }


        */

        //Success snackbar of valid sign up
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Center(child: Text('Sign up successful.')),
            duration: Duration(seconds: 3),
          ),
        );
        // Navigate to login page
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const LoginSignupPage(),
          ),
        );
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login/Signup Page',
      theme: ThemeData(
        hintColor: Colors.lightBlueAccent,
      ),
      home: const LoginSignupPage(),
    );
  }
}
