import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'trackingpage.dart';
import 'journalpage.dart';
import 'profilepage.dart';
import 'interviewpage.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> industries = [
    'Automotive',
    'Healthcare',
    'Education',
    'Information Technology',
    'Telecommunications',
    'Finance',
    'Real Estate',
    'Transportation & Logistics',
    'Hospitality & Tourism',
    'Entertainment & Media',
    'Legal Services',
    'Security Services',
    'Government & Public Administration',
    'Robotics & Automation',
    'Gaming & Esports',
    'Agriculture & Farming',
  ];

  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    final filteredIndustries = industries
        .where((industry) =>
            industry.toLowerCase().contains(_searchText.toLowerCase()))
        .toList();

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
                    'Practice Page',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search For an Industry',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchText = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredIndustries.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            side: const BorderSide(color: Colors.black),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                          ),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InterviewPage(
                                industry: filteredIndustries[index],
                              ),
                            ),
                          ),
                          child: Text(
                            filteredIndustries[index],
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 16),
                  ),
                ),
              ),
              _BottomNavBar(currentPage: 'practice'),
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
            onTap: () {
              // Practice button is already on practice page, no navigation needed
            },
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