import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../shared/widgets/circle_marker.dart';

class StudentStep extends StatelessWidget {
  final String title;
  final Widget child;
  final bool hideVerticalLine;

  const StudentStep(
      {required this.title,
      required this.child,
      this.hideVerticalLine = false,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Container(
                width: 2,
                margin: const EdgeInsets.only(left: 4, top: 4),
                color:
                    hideVerticalLine ?  Colors.transparent:AppColors.lighter,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: CircleMarker(color: AppColors.secondary, size: 10),
              ),
            ],
          ),
          const SizedBox(width: 24),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .button
                        ?.copyWith(color: AppColors.lightGrey),
                  ),
                  const SizedBox(height: 8),
                  child,
                  const SizedBox(height: 24),
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
