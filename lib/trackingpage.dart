import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'practicepage.dart';
import 'journalpage.dart';
import 'profilepage.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  List<Map<String, dynamic>> applications = [
    {
      'company': 'Tech Innovation Inc',
      'date': 'Applied on Sept 20, 2024',
      'position': 'Senior Software Engineer',
      'status': 'Under Review',
      'location': 'Makati City, Metro Manila',
    },
    {
      'company': 'Global Solutions Ltd.',
      'date': 'Applied on Sept 18, 2024',
      'position': 'Full Stack Developer',
      'status': 'Interview Scheduled',
      'location': 'Taguig City, Metro Manila',
    },
    {
      'company': 'Tech Innovation Inc',
      'date': 'Applied on Sept 16, 2024',
      'position': 'Frontend Developer',
      'status': 'Application Sent',
      'location': 'Taguig City, Metro Manila',
    },
    {
      'company': 'Future Dynamics Corp.',
      'date': 'Applied on Sept 16, 2024',
      'position': 'DevOps Engineer',
      'status': 'Rejected',
      'location': 'Pasig City, Metro Manila',
    },
    {
      'company': 'Pioneer Systems LLC',
      'date': 'Applied on Sept 11, 2024',
      'position': 'Mobile App Developer',
      'status': 'Under Review',
      'location': 'Cubao , Quezon City',
    },
  ];

  void _addNewApplication(Map<String, dynamic> newApp) {
    setState(() {
      applications.add(newApp);
    });
  }

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
                    'Applications',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.blue, size: 28),
                    onPressed: () => _showAddApplicationDialog(context),
                    tooltip: 'Add New Application',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  itemCount: applications.length,
                  itemBuilder: (context, index) {
                    final app = applications[index];
                    return GestureDetector(
                      onTap: () {
                        _showApplicationDetails(context, app);
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 0, 0, 0).withValues(alpha: 0.1),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    app['company']!,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    app['position']!,
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    app['date']!,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 88, 88, 88),
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    app['location']!,
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 88, 88, 88),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 12),
                            _getStatusIcon(app['status']!),
                          ],
                        ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 20),
                ),
              ),
              _BottomNavBar(currentPage: 'tracker'),
            ],
          ),
        ),
      ),
    );
  }

  void _showApplicationDetails(BuildContext context, Map<String, dynamic> app) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(app['company']!),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Position: ${app['position']}', style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Status: ${app['status']}'),
              const SizedBox(height: 8),
              Text('Applied: ${app['date']}'),
              const SizedBox(height: 8),
              Text('Location: ${app['location']}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  Widget _getStatusIcon(String status) {
    IconData iconData;
    Color iconColor;

    switch (status) {
      case 'Under Review':
        iconData = Icons.schedule;
        iconColor = Colors.orange;
        break;
      case 'Interview Scheduled':
        iconData = Icons.calendar_today;
        iconColor = Colors.blue;
        break;
      case 'Application Sent':
        iconData = Icons.send;
        iconColor = Colors.grey;
        break;
      case 'Rejected':
        iconData = Icons.cancel;
        iconColor = Colors.red;
        break;
      default:
        iconData = Icons.circle;
        iconColor = Colors.green;
    }

    return Icon(iconData, color: iconColor, size: 24);
  }

  void _showAddApplicationDialog(BuildContext context) {
    final companyController = TextEditingController();
    final positionController = TextEditingController();
    final locationController = TextEditingController();
    String selectedStatus = 'Application Sent';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add New Application'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: companyController,
                  decoration: const InputDecoration(
                    labelText: 'Company Name',
                    hintText: 'Enter company name',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: positionController,
                  decoration: const InputDecoration(
                    labelText: 'Position',
                    hintText: 'Enter position title',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: locationController,
                  decoration: const InputDecoration(
                    labelText: 'Location',
                    hintText: 'Enter location',
                  ),
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  initialValue: selectedStatus,
                  decoration: const InputDecoration(
                    labelText: 'Status',
                  ),
                  items: ['Application Sent', 'Under Review', 'Interview Scheduled', 'Rejected']
                      .map((status) => DropdownMenuItem(
                            value: status,
                            child: Text(status),
                          ))
                      .toList(),
                  onChanged: (value) {
                    selectedStatus = value!;
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (companyController.text.isNotEmpty && positionController.text.isNotEmpty) {
                  final newApp = {
                    'company': companyController.text,
                    'position': positionController.text,
                    'location': locationController.text.isNotEmpty ? locationController.text : 'Not specified',
                    'status': selectedStatus,
                    'date': 'Applied on ${DateTime.now().toString().split(' ')[0]}',
                  };
                  _addNewApplication(newApp);
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Application added successfully!')),
                  );
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
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
            onTap: () {
            },
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
              color: isActive ? const Color.fromRGBO(33, 150, 243, 1).withValues(alpha: 0.2) : Colors.transparent,
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
