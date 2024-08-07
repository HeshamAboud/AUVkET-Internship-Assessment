import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressIndicatorWidget extends StatefulWidget {
  @override
  _ProgressIndicatorWidgetState createState() =>
      _ProgressIndicatorWidgetState();
}

class _ProgressIndicatorWidgetState extends State<ProgressIndicatorWidget> {
  int currentStep = 1;

  void _nextStep() {
    setState(() {
      if (currentStep < 2) {
        currentStep++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Divider(
                color: currentStep > 0 ? Colors.green : Colors.grey,
                thickness: 2,
              ),
            ),
            _buildStepIndicator(step: 1, label: 'Register'),
            Expanded(
              child: Divider(
                color: currentStep > 1 ? Colors.green : Colors.grey,
                thickness: 2,
              ),
            ),
            _buildStepIndicator(step: 2, label: 'Complete Data'),
            Expanded(
              child: Divider(
                color: currentStep > 1 ? Colors.green : Colors.grey,
                thickness: 2,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStepIndicator({required int step, required String label}) {
    return Column(
      children: [
        // Text(
        //   label,
        //   style: TextStyle(
        //     color: currentStep >= step ? Colors.green : Colors.grey,
        //   ),
        // ),
        Container(
          width: 50.w,
          height: 50.h,
          // Height of the circle
          decoration: BoxDecoration(

            shape: BoxShape.circle,
            border: Border.all(
              color: currentStep >= step ? Colors.green : Colors.grey, // Border color
               // Border width
            ),
          ),
          child: Center(
            child: Text(
              currentStep >= step ? '$step' : "",
              style: TextStyle(color: Colors.green),
            )
          ),
        ),

      ],
    );
  }
}
