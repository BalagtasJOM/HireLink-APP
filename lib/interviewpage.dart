import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'practicepage.dart';
import 'trackingpage.dart';
import 'journalpage.dart';
import 'profilepage.dart';
import 'mockinterviewpage.dart';

class InterviewPage extends StatelessWidget {
  final String industry;

  const InterviewPage({super.key, required this.industry});

  List<String> getQuestionsForIndustry(String industry) {
    switch (industry.toLowerCase()) {
      case 'information technology':
        return [
          'Tell me about your technical background and experience?',
          'What programming languages are you most proficient in?',
          'Describe a challenging technical problem you solved recently.',
          'How do you stay updated with the latest technology trends?',
          'What is your experience with agile development methodologies?',
          'Tell me about a project where you worked with a team.',
          'What motivates you to work in tech?',
          'Where do you see yourself in five years in IT?',
        ];

      case 'healthcare':
        return [
          'Why did you choose a career in healthcare?',
          'Tell me about your experience with patient care.',
          'How do you handle stressful situations in healthcare?',
          'What is your approach to maintaining patient confidentiality?',
          'Describe your experience with medical documentation.',
          'How do you stay current with healthcare regulations?',
          'Tell me about a time you worked in a team environment.',
          'What are your strengths as a healthcare professional?',
        ];

      case 'finance':
        return [
          'Tell me about your experience in financial analysis.',
          'How do you stay updated with financial regulations?',
          'Describe a complex financial model you created.',
          'What is your approach to risk management?',
          'Tell me about your experience with financial reporting.',
          'How do you handle confidential financial information?',
          'What motivates you in the finance industry?',
          'Where do you see yourself in five years in finance?',
        ];

      case 'education':
        return [
          'Why did you choose a career in education?',
          'Tell me about your teaching philosophy.',
          'Describe your experience with curriculum development.',
          'How do you handle classroom management?',
          'What is your approach to student assessment?',
          'Tell me about a challenging student situation you handled.',
          'How do you incorporate technology in teaching?',
          'What are your strengths as an educator?',
        ];

      case 'automotive':
        return [
          'Tell me about your experience in the automotive industry.',
          'What technical skills do you have related to automotive work?',
          'Describe a complex automotive repair you completed.',
          'How do you stay updated with automotive technology?',
          'What is your approach to vehicle diagnostics?',
          'Tell me about your experience with customer service.',
          'What safety protocols do you follow?',
          'Where do you see yourself in five years in automotive?',
        ];

      default:
        return [
          'Tell me about yourself?',
          'What are your strengths and weaknesses?',
          'Why do you want this job?',
          'Where do you see yourself in five years?',
          'What motivates you?',
          'How do you handle stress or pressure?',
          'What is your greatest accomplishment?',
          'Tell me about a challenging situation you overcame.',
        ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final questions = getQuestionsForIndustry(industry);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Interview Questions',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Industry: $industry',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: questions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        questions[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      trailing: const Icon(Icons.chevron_right, size: 28),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MockInterviewPage(
                            question: questions[index],
                            industry: industry,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 8),
                ),
              ),
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