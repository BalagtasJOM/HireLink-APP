import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'practicepage.dart';
import 'trackingpage.dart';
import 'journalpage.dart';
import 'editprofile.dart';
import 'applicationprofile.dart';
import 'loginpage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE0F7FA),
              Color(0xFFB2EBF2),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
             
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black54),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                  
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Color.fromARGB(255, 65, 64, 64),
                      ),
                    ),
                    const SizedBox(height: 16),

                    const Text(
                      'Juan T. Dela Cruz',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),


                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black),
                            ),
                            child: const Text(
                              'Phone Number',
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.black),
                            ),
                            child: const Text(
                              'Email Address',
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ListView(
                    children: [
                      _ProfileButton(
                        text: 'Application Profile',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ApplicationProfilePage()),
                        ),
                      ),
                      const SizedBox(height: 12),
                      _ProfileButton(
                        text: 'Downloads',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ProfilePage()),
                        )
                      ),
                      const SizedBox(height: 12),
                      _ProfileButton(
                        text: 'Edit Profile',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const EditProfilePage()),
                        ),
                      ),
                      const SizedBox(height: 12),
                      _ProfileButton(
                        text: 'Log Out',
                        onPressed: () => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                          (route) => false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _BottomNavBar(currentPage: 'profile'),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _ProfileButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: const Color.fromARGB(255, 0, 0, 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(color: Colors.black),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  final String currentPage;

  const _BottomNavBar({required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavIcon(
            icon: Icons.home,
            label: 'Home',
            isActive: currentPage == 'home',
            onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const Homepage()),
              (route) => false,
            ),
          ),
          _NavIcon(
            icon: Icons.assignment,
            label: 'Practice',
            isActive: currentPage == 'practice',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PracticePage()),
            ),
          ),
          _NavIcon(
            icon: Icons.track_changes,
            label: 'Tracker',
            isActive: currentPage == 'tracker',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const TrackingPage()),
            ),
          ),
          _NavIcon(
            icon: Icons.menu_book,
            label: 'Journal',
            isActive: currentPage == 'journal',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const JournalPage()),
            ),
          ),
          _NavIcon(
            icon: Icons.person,
            label: 'Profile',
            isActive: currentPage == 'profile',
            onTap: () {
              // Profile button is already on profile page, no navigation needed
            },
          ),
        ],
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isActive;

  const _NavIcon({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: isActive ? Colors.blue.withValues(alpha: 0.2) : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 28,
              color: isActive ? Colors.blue : Colors.black,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isActive ? Colors.blue : Colors.black,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}