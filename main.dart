
import 'package:flutter/material.dart';

void main() {
  runApp(const MatinVPN());
}

class MatinVPN extends StatelessWidget {
  const MatinVPN({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Matin VPN',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _showSupportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('اتصال به پشتیبانی'),
        content: const Text('آیدی تلگرام: @seniormatthew'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('باشه'),
          ),
        ],
      ),
    );
  }

  void _showVIPCodeDialog(BuildContext context) {
    TextEditingController codeController = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('وارد کردن کد اشتراک ویژه'),
        content: TextField(
          controller: codeController,
          decoration: const InputDecoration(hintText: 'کد را وارد کنید'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // TODO: اعتبارسنجی و ذخیره‌سازی کد
              Navigator.of(context).pop();
            },
            child: const Text('تایید'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Matin VPN')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text('منوی برنامه', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              title: const Text('اتصال به پشتیبانی'),
              onTap: () => _showSupportDialog(context),
            ),
            ListTile(
              title: const Text('خرید اشتراک'),
              onTap: () {
                // بازکردن تلگرام برای خرید اشتراک
                // در نسخه کامل از url_launcher استفاده خواهد شد
              },
            ),
            ListTile(
              title: const Text('وارد کردن کد اشتراک'),
              onTap: () => _showVIPCodeDialog(context),
            ),
          ],
        ),
      ),
      body: const Center(child: Text('به Matin VPN خوش آمدید')),
    );
  }
}
