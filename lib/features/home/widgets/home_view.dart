import 'package:flutter/material.dart';
import 'package:parent/core/constants/colors.dart';
import 'package:parent/features/home/widgets/sons_list.dart';
import 'package:parent/l10n/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // used to force [Column] widget to always take full width of the screen
        const SizedBox(width: double.infinity),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            context.l10n.sonsList,
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: AppColors.primary),
          ),
        ),
        const Expanded(child: SonsList())
      ],
    );
  }
}
