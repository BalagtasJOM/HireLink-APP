import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'practicepage.dart';
import 'trackingpage.dart';
import 'journalpage.dart';
import 'profilepage.dart';

class EditApplicationProfilePage extends StatefulWidget {
  const EditApplicationProfilePage({super.key});

  @override
  State<EditApplicationProfilePage> createState() => _EditApplicationProfilePageState();
}

class _EditApplicationProfilePageState extends State<EditApplicationProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController(text: 'Juan T. Dela Cruz');
  final TextEditingController _phoneController = TextEditingController(text: '+63 987 654 3210');
  final TextEditingController _emailController = TextEditingController(text: 'JuanDelaCruz123@gmail.com');
  DateTime _selectedDate = DateTime(2000, 6, 27);

  final List<JobController> _jobControllers = [
    JobController(
      positionController: TextEditingController(text: 'Software Developer'),
      companyController: TextEditingController(text: 'Tech Solutions Inc.'),
      startDateController: TextEditingController(text: '2022'),
      endDateController: TextEditingController(text: 'Present'),
    ),
    JobController(
      positionController: TextEditingController(text: 'Junior Developer'),
      companyController: TextEditingController(text: 'Digital Innovations Ltd.'),
      startDateController: TextEditingController(text: '2021'),
      endDateController: TextEditingController(text: '2022'),
    ),
    JobController(
      positionController: TextEditingController(text: 'Software Engineering Intern'),
      companyController: TextEditingController(text: 'StartupHub Philippines'),
      startDateController: TextEditingController(text: '2020'),
      endDateController: TextEditingController(text: '2021'),
    ),
  ];

  final List<EducationController> _educationControllers = [
    EducationController(
      levelController: TextEditingController(text: 'College'),
      schoolController: TextEditingController(text: 'University of the Philippines'),
      yearController: TextEditingController(text: '2018-2022'),
    ),
    EducationController(
      levelController: TextEditingController(text: 'Senior High School'),
      schoolController: TextEditingController(text: 'Philippine Science High School'),
      yearController: TextEditingController(text: '2016-2018'),
    ),
    EducationController(
      levelController: TextEditingController(text: 'Junior High School'),
      schoolController: TextEditingController(text: 'St. Mary\'s Academy'),
      yearController: TextEditingController(text: '2012-2016'),
    ),
    EducationController(
      levelController: TextEditingController(text: 'Elementary Education'),
      schoolController: TextEditingController(text: 'Manila Elementary School'),
      yearController: TextEditingController(text: '2006-2012'),
    ),
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _addJob() {
    setState(() {
      _jobControllers.add(JobController());
    });
  }

  void _removeJob(int index) {
    if (_jobControllers.length > 1) {
      setState(() {
        _jobControllers.removeAt(index);
      });
    }
  }

  void _addEducation() {
    setState(() {
      _educationControllers.add(EducationController());
    });
  }

  void _removeEducation(int index) {
    if (_educationControllers.length > 1) {
      setState(() {
        _educationControllers.removeAt(index);
      });
    }
  }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Application profile updated successfully!'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
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
                    'Edit Application Profile',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Personal Information',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 16),

                        TextFormField(
                          controller: _fullNameController,
                          decoration: InputDecoration(
                            labelText: 'Full Name',
                            prefixIcon: const Icon(Icons.person),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your full name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        TextFormField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            prefixIcon: const Icon(Icons.phone),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),

                        GestureDetector(
                          onTap: () => _selectDate(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.calendar_today),
                                const SizedBox(width: 12),
                                Text(
                                  'Date of Birth: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const Spacer(),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Job Experience',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextButton.icon(
                              onPressed: _addJob,
                              icon: const Icon(Icons.add),
                              label: const Text('Add Job'),
                              style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFF1976D2),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _jobControllers.length,
                          itemBuilder: (context, index) {
                            return _JobFormCard(
                              controller: _jobControllers[index],
                              onRemove: () => _removeJob(index),
                              canRemove: _jobControllers.length > 1,
                            );
                          },
                        ),
                        const SizedBox(height: 24),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Education',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            TextButton.icon(
                              onPressed: _addEducation,
                              icon: const Icon(Icons.add),
                              label: const Text('Add Education'),
                              style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFF1976D2),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _educationControllers.length,
                          itemBuilder: (context, index) {
                            return _EducationFormCard(
                              controller: _educationControllers[index],
                              onRemove: () => _removeEducation(index),
                              canRemove: _educationControllers.length > 1,
                            );
                          },
                        ),
                        const SizedBox(height: 40),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1976D2),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: _saveProfile,
                            child: const Text(
                              'Save Changes',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
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

class JobController {
  final TextEditingController positionController;
  final TextEditingController companyController;
  final TextEditingController startDateController;
  final TextEditingController endDateController;

  JobController({
    TextEditingController? positionController,
    TextEditingController? companyController,
    TextEditingController? startDateController,
    TextEditingController? endDateController,
  }) :
    positionController = positionController ?? TextEditingController(),
    companyController = companyController ?? TextEditingController(),
    startDateController = startDateController ?? TextEditingController(),
    endDateController = endDateController ?? TextEditingController();
}

class EducationController {
  final TextEditingController levelController;
  final TextEditingController schoolController;
  final TextEditingController yearController;

  EducationController({
    TextEditingController? levelController,
    TextEditingController? schoolController,
    TextEditingController? yearController,
  }) :
    levelController = levelController ?? TextEditingController(),
    schoolController = schoolController ?? TextEditingController(),
    yearController = yearController ?? TextEditingController();
}

class _JobFormCard extends StatelessWidget {
  final JobController controller;
  final VoidCallback onRemove;
  final bool canRemove;

  const _JobFormCard({
    required this.controller,
    required this.onRemove,
    required this.canRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Job Entry',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (canRemove)
                  IconButton(
                    onPressed: onRemove,
                    icon: const Icon(Icons.delete, color: Colors.red),
                    iconSize: 20,
                  ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: controller.positionController,
              decoration: InputDecoration(
                labelText: 'Position',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter position';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: controller.companyController,
              decoration: InputDecoration(
                labelText: 'Company',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter company';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.startDateController,
                    decoration: InputDecoration(
                      labelText: 'Start Year',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade50,
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: controller.endDateController,
                    decoration: InputDecoration(
                      labelText: 'End Year',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade50,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _EducationFormCard extends StatelessWidget {
  final EducationController controller;
  final VoidCallback onRemove;
  final bool canRemove;

  const _EducationFormCard({
    required this.controller,
    required this.onRemove,
    required this.canRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Education Entry',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (canRemove)
                  IconButton(
                    onPressed: onRemove,
                    icon: const Icon(Icons.delete, color: Colors.red),
                    iconSize: 20,
                  ),
              ],
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: controller.levelController,
              decoration: InputDecoration(
                labelText: 'Education Level',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter education level';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: controller.schoolController,
              decoration: InputDecoration(
                labelText: 'School/Institution',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter school/institution';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: controller.yearController,
              decoration: InputDecoration(
                labelText: 'Year/s Attended',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
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