import 'package:flutter/material.dart';
import 'package:parent/core/constants/colors.dart';
import 'package:parent/core/enums/slider_destination.dart';
import 'package:parent/features/student_details/widgets/active_trip_card/progress_slider_thum_shape.dart';

class ProgressSlider extends StatelessWidget {
  final String startLabel, endLabel;
  final double value;
  final SliderDestination destination;

  const ProgressSlider(
      {required this.startLabel,
      required this.endLabel,
      required this.value,
      this.destination = SliderDestination.end,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(builder: (context, constraints) {
          const double textWidth = 32;
          final double start =
              // full width - 48 (left, right padding) with a percentage of value
              ((constraints.maxWidth - 48) * value / 100) -
                  // minus half the space taken be the text
                  (textWidth / 2) +
                  // plus the space for the padding start
                  24;

          // print('value $value'
          //     ' max ${constraints.maxWidth}'
          //     ' start $start');
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(width: start),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Center(
                  child: FittedBox(
                    child: Text(
                      '${value.toInt()}%',
                      style: Theme.of(context)
                          .textTheme
                          .overline
                          ?.copyWith(color: AppColors.secondary),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
        SizedBox(
          height: 9,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              overlayColor: AppColors.secondary,
              activeTrackColor: AppColors.secondary,
              thumbColor: AppColors.secondary,
              inactiveTrackColor: AppColors.lighter,
              showValueIndicator: ShowValueIndicator.always,
              trackHeight: 10,
              valueIndicatorColor: AppColors.secondary,
              thumbShape: const SliderThumbShape(
                disabledThumbRadius: 1,
                enabledThumbRadius: 6,
              ),
            ),
            child: Slider(
              value: value,
              activeColor: AppColors.secondary,
              min: 0,
              max: 100,
              onChanged: (_) {},
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                startLabel,
                style: Theme.of(context).textTheme.caption?.copyWith(
                    color: destination == SliderDestination.start
                        ? AppColors.secondary
                        : AppColors.lightGrey),
              ),
              Text(endLabel , style: Theme.of(context).textTheme.caption?.copyWith(
                  color: destination == SliderDestination.end
                      ? AppColors.secondary
                      : AppColors.lightGrey),),
            ],
          ),
        )
      ],
    );
  }
}
