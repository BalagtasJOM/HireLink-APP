import 'package:flutter/material.dart';
import 'practicepage.dart';
import 'trackingpage.dart';
import 'journalpage.dart';
import 'profilepage.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE0F7FA), Color(0xFFB2EBF2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 30),
              SizedBox(
                height: 110,
                child: Image.asset(
                  'assets/images/APP Hirelink  logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                'Welcome to Hirelink',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  '"The key to a successful interview is preparation. Practice your answers, research the company, and be confident in your abilities."',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 70),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  children: [
                    _HomeButton(
                      text: 'Start Mock Interview',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PracticePage()),
                      ),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      textColor: const Color.fromARGB(255, 0, 0, 0),
                      borderColor: const Color.fromARGB(255, 0, 0, 0),
                      icon: Icons.play_arrow,
                    ),
                    const SizedBox(height: 12),
                    _HomeButton(
                      text: 'View Application Tracker',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TrackingPage()),
                      ),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      textColor: const Color.fromARGB(255, 0, 0, 0),
                      borderColor: const Color.fromARGB(255, 0, 0, 0),
                      icon: Icons.track_changes,
                    ),
                    const SizedBox(height: 12),
                    _HomeButton(
                      text: 'Review Feedback Journal',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const JournalPage()),
                      ),
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      textColor: const Color.fromARGB(255, 0, 0, 0),
                      borderColor: const Color.fromARGB(255, 0, 0, 0),
                      icon: Icons.menu_book,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              _BottomNavBar(currentPage: 'home'),
            ],
          ),
        ),
      ),
    );
  }
}

class _HomeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final IconData? icon;

  const _HomeButton({
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.borderColor = Colors.black,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: borderColor, width: 1),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          elevation: 3,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
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
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavIcon(
            icon: Icons.home,
            label: 'Home',
            isActive: currentPage == 'home',
            onTap: () {

            },
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
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            ),
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