import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BilgiAlButton extends StatelessWidget {
  final BuildContext context;

  // Sabitler ve metinler
  static const Color buttonColor = Color(0xFF140C47);
  static const Color iconAndTextColor = Colors.white;
  static const double borderWidth = 1.5;
  static const double borderRadius = 35;
  static const String phoneNumber = '+90 500 500 00 00';
  static const String buttonText = 'Bilgi al';
  static const String sheetTitle = 'Aramak istiyor musunuz?';
  static const String callActionText = 'Ara';
  static const String cancelActionText = 'Vazgeç';
  static const String callErrorText = 'Arama başlatılamadı.';

  const BilgiAlButton({super.key, required this.context});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: iconAndTextColor, width: borderWidth),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: FloatingActionButton.extended(
        onPressed: () => _showCallSheet(context),
        backgroundColor: buttonColor,
        label: Row(
          children: [
            const Icon(Icons.call, color: iconAndTextColor),
            const SizedBox(width: 10),
            Text(
              buttonText,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: iconAndTextColor),
            ),
          ],
        ),
      ),
    );
  }

  void _showCallSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text(sheetTitle),
        message: const Text(phoneNumber),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              _makePhoneCall(phoneNumber);
            },
            child: const Text(callActionText),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text(cancelActionText),
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text(callErrorText)),
        );
      }
    }
  }
}
