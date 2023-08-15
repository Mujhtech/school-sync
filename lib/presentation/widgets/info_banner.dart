import 'package:flutter/material.dart';
import 'package:school_sync/presentation.dart';

class InfoBanner extends StatelessWidget {
  const InfoBanner({super.key, required this.content});
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: context.cardColor,
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: -50,
            right: 20,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(width: 1.5, color: context.buttonColor),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ),
          Positioned(
            bottom: -30,
            right: 135,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(width: 1.5, color: context.buttonColor),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            right: 200,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(width: 1.5, color: context.buttonColor),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ),
          Positioned(
            top: -30,
            right: 110,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(width: 1.5, color: context.buttonColor),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ),
          Positioned(
            top: -60,
            right: -15,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: context.buttonColor,
                border: Border.all(width: 1.5, color: context.buttonColor),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: content,
          ),
        ],
      ),
    );
  }
}
