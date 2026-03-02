import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isPasswordHidden = true;
  bool isConfirmHidden = true;

  final PageController _avatarController =
      PageController(viewportFraction: 0.45);

  double currentPage = 1;
  int selectedAvatar = 1;

  final List<String> avatars = [
    "assets/icons/gamer (1).png",
    "assets/icons/gamer (1) (2).png",
    "assets/icons/gamer (1) (1).png",
  ];

  @override
  void initState() {
    super.initState();
    _avatarController.addListener(() {
      setState(() {
        currentPage = _avatarController.page ?? 1;
        selectedAvatar = currentPage.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.amber),
        title: const Text(
          "Register",
          style: TextStyle(
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            /// Avatar Selector
            SizedBox(
              height: 160,
              child: PageView.builder(
                controller: _avatarController,
                itemCount: avatars.length,
                itemBuilder: (context, index) {
                  double scale =
                      1 - (currentPage - index).abs() * 0.35;
                  scale = scale.clamp(0.7, 1.0);

                  return Transform.scale(
                    scale: scale,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: selectedAvatar == index
                              ? Colors.amber
                              : Colors.transparent,
                          width: 3,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage(avatars[index]),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Avatar",
              style: TextStyle(color: Colors.white),
            ),

            const SizedBox(height: 25),

            buildField("Name", Icons.person),
            buildField("Email", Icons.email),

            buildPasswordField(
              "Password",
              Icons.lock,
              isPasswordHidden,
              () {
                setState(() {
                  isPasswordHidden = !isPasswordHidden;
                });
              },
            ),

            buildPasswordField(
              "Confirm Password",
              Icons.lock,
              isConfirmHidden,
              () {
                setState(() {
                  isConfirmHidden = !isConfirmHidden;
                });
              },
            ),

            buildField("Phone Number", Icons.phone),

            const SizedBox(height: 20),

            /// Create Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Create Account",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Already Have Account ? Login",
              style: TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 15),

            Image.asset(
              "assets/icons/Language Switch.png",
              width: 80,
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildField(String hint, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xff1C1C1C),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white54),
          prefixIcon: Icon(icon, color: Colors.white70),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget buildPasswordField(
    String hint,
    IconData icon,
    bool isHidden,
    VoidCallback toggle,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        obscureText: isHidden,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xff1C1C1C),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.white54),
          prefixIcon: Icon(icon, color: Colors.white70),
          suffixIcon: IconButton(
            icon: Icon(
              isHidden ? Icons.visibility_off : Icons.visibility,
              color: Colors.white54,
            ),
            onPressed: toggle,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}