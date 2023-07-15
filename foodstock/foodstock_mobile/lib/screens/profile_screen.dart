import 'package:flutter/material.dart';
import 'package:foodstock_mobile/models/user.dart';
import 'package:foodstock_mobile/services/api_service.dart';
import 'package:foodstock_mobile/screens/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<User> _userProfileFuture;

  @override
  void initState() {
    super.initState();
    _userProfileFuture =
        ApiService().getUser('800ff2de-c9a2-4c5d-a90b-c585728a13ff');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: FutureBuilder<User>(
        future: _userProfileFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User user = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.account_circle,
                    color: Color.fromARGB(237, 37, 169, 209),
                    size: 200.0,
                  ),
                  const Text(
                    'Email:',
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    user.email,
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'First Name:',
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    user.firstName,
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Surname:',
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    user.surname,
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 120.0),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 40.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 187, 12, 0),
                            padding: const EdgeInsets.fromLTRB(30, 15, 30, 15)),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                            (route) => false,
                          );
                        },
                        child: const Text('Logout'),
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Failed loading user page'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
