import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'interviewpage.dart';

class DownloadsPage extends StatefulWidget {
  const DownloadsPage({super.key});

  @override
  State<DownloadsPage> createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  List<String> downloadedIndustries = [];

  @override
  void initState() {
    super.initState();
    _loadDownloadedIndustries();
  }

  Future<void> _loadDownloadedIndustries() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      downloadedIndustries = prefs.getStringList('downloaded_industries') ?? [];
    });
  }

  Future<void> _removeIndustry(String industry) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      downloadedIndustries.remove(industry);
    });
    await prefs.setStringList('downloaded_industries', downloadedIndustries);
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
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black54),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Downloads',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: downloadedIndustries.isEmpty
                    ? const Center(
                        child: Text(
                          'No downloaded industries yet.',
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                      )
                    : ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: downloadedIndustries.length,
                        itemBuilder: (context, index) {
                          final industry = downloadedIndustries[index];
                          return Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: ListTile(
                              title: Text(
                                industry,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _removeIndustry(industry),
                              ),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InterviewPage(
                                    industry: industry,
                                  ),
                                ),
                              ),
                              tileColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: const BorderSide(color: Colors.black),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}