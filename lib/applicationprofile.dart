import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'practicepage.dart';
import 'trackingpage.dart';
import 'journalpage.dart';
import 'profilepage.dart';
import 'editapplicationprofile.dart';


class _AppShadows {

  static const Color _shadowColor = Colors.black;
  static const double _shadowOpacity = 0.1;


  static List<BoxShadow> get cardShadow => [
    BoxShadow(
      color: _shadowColor.withValues(alpha: _shadowOpacity),
      blurRadius: 8.0,
      offset: const Offset(0, 2),
    ),
  ];
}


class ApplicationProfilePage extends StatelessWidget {
  const ApplicationProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE3F2FD),
              Color(0xFFBBDEFB),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black54),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Back',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Color(0xFF1976D2)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EditApplicationProfilePage()),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

            
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                   
                     Container(
                       width: double.infinity,
                       padding: const EdgeInsets.all(20),
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(16),
                         boxShadow: _AppShadows.cardShadow,
                       ),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           const Text(
                             'Personal Information',
                             style: TextStyle(
                               fontSize: 18,
                               fontWeight: FontWeight.bold,
                               color: Colors.black,
                             ),
                           ),
                           const SizedBox(height: 16),

                           
                           _InfoRow(
                             icon: Icons.person,
                             label: 'Full Name',
                             value: 'Juan T. Dela Cruz',
                           ),
                           const SizedBox(height: 12),

                          
                           _InfoRow(
                             icon: Icons.phone,
                             label: 'Phone Number',
                             value: '+63 987 654 3210',
                           ),
                           const SizedBox(height: 12),

                          
                           _InfoRow(
                             icon: Icons.email,
                             label: 'Email',
                             value: 'JuanDelaCruz123@gmail.com',
                           ),
                           const SizedBox(height: 12),

                      
                           _InfoRow(
                             icon: Icons.calendar_today,
                             label: 'Date of Birth',
                             value: '27/06/2000',
                           ),
                         ],
                       ),
                     ),

                     const SizedBox(height: 20),

                     Container(
                       width: double.infinity,
                       padding: const EdgeInsets.all(20),
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(16),
                         boxShadow: _AppShadows.cardShadow,
                       ),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           const Text(
                             'Job Experience',
                             style: TextStyle(
                               fontSize: 18,
                               fontWeight: FontWeight.bold,
                               color: Colors.black,
                             ),
                           ),
                           const SizedBox(height: 16),

                           
                           _JobCard(
                             position: 'Software Developer',
                             company: 'Tech Solutions Inc.',
                             duration: '2022 - Present',
                           ),

                          
                           _JobCard(
                             position: 'Junior Developer',
                             company: 'Digital Innovations Ltd.',
                             duration: '2021 - 2022',

                           ),

                           
                           _JobCard(
                             position: 'Software Engineering Intern',
                             company: 'StartupHub Philippines',
                             duration: '2020 - 2021',
                          
                           ),
                         ],
                       ),
                     ),

                     const SizedBox(height: 20),

                    
                     Container(
                       width: double.infinity,
                       padding: const EdgeInsets.all(20),
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(16),
                         boxShadow: _AppShadows.cardShadow,
                       ),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           const Text(
                             'Education',
                             style: TextStyle(
                               fontSize: 18,
                               fontWeight: FontWeight.bold,
                               color: Colors.black,
                             ),
                           ),
                           const SizedBox(height: 16),

                           _EducationCard(
                             level: 'College',
                           ),

                           
                           _EducationCard(
                             level: 'Senior High School',
                           ),

                           
                           _EducationCard(
                             level: 'Junior High School',
                           ),

                           
                           _EducationCard(
                             level: 'Elementary Education',
                           ),
                         ],
                       ),
                     ),
                    ],
                  ),
                ),
              ),

              
              _BottomNavBar(currentPage: 'application'),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF1976D2).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 20,
            color: const Color(0xFF1976D2),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _JobCard extends StatelessWidget {
  final String position;
  final String company;
  final String duration;

  const _JobCard({
    required this.position,
    required this.company,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.work,
                size: 20,
                color: Color(0xFF1976D2),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  position,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF1976D2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  duration,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Text(
              company,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF1976D2),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EducationCard extends StatelessWidget {
  final String level;

  const _EducationCard({
    required this.level,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.school,
                size: 20,
                color: Color(0xFF1976D2),
              ),
              const SizedBox(width: 8),
              Text(
                level,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
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
            icon: Icons.analytics,
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
            onTap: () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
              (route) => false,
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