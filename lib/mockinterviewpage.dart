import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'practicepage.dart';
import 'trackingpage.dart';
import 'journalpage.dart';
import 'profilepage.dart';

class MockInterviewPage extends StatefulWidget {
  final String question;
  final String industry;

  const MockInterviewPage({super.key, required this.question, required this.industry});

  @override
  State<MockInterviewPage> createState() => _MockInterviewPageState();
}

class _MockInterviewPageState extends State<MockInterviewPage> {
  int _rating = 0;
  bool _isRecording = false;

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
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Mock Interview',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  widget.question,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 60),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isRecording = !_isRecording;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(_isRecording ? 'Recording started' : 'Recording stopped'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: _isRecording ? Colors.red.withValues(alpha: 0.1) : Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: _isRecording ? Colors.red : Colors.grey.withValues(alpha: 0.3),
                      width: _isRecording ? 3 : 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: _isRecording
                            ? Colors.red.withValues(alpha: 0.3)
                            : Colors.grey.withValues(alpha: 0.2),
                        spreadRadius: _isRecording ? 4 : 2,
                        blurRadius: _isRecording ? 8 : 4,
                      ),
                    ],
                  ),
                  child: Icon(
                    _isRecording ? Icons.stop : Icons.mic,
                    size: 80,
                    color: _isRecording ? Colors.red : const Color.fromARGB(255, 88, 87, 87),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _isRecording ? 'Tap to stop recording' : 'Tap microphone to record',
                style: TextStyle(
                  fontSize: 16,
                  color: _isRecording ? Colors.red : Colors.grey,
                  fontWeight: _isRecording ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Rate your Answer',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return IconButton(
                    icon: Icon(
                      index < _rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 32,
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = index + 1;
                      });
                    },
                  );
                }),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Interview saved!')),
                      );
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'SAVE',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              _BottomNavBar(currentPage: 'interview'),
            ],
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