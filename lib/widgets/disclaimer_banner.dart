import 'package:flutter/material.dart';
import '../core/constants.dart';

class DisclaimerBanner extends StatelessWidget {
  const DisclaimerBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.amber.shade100,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.amber.shade900, size: 20),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(AppStrings.disclaimer, style: TextStyle(fontSize: 12)),
          ),
        ],
      ),
    );
  }
}
