import 'package:flutter/material.dart';
import 'package:parent/features/shared/widgets/custom_appbar.dart';
import 'package:parent/l10n/l10n.dart';

import '../../../core/constants/colors.dart';

class AboutAppPage extends StatelessWidget {
  static const String routeName = '/about';

  const AboutAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: context.l10n.aboutApp,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Text(
            context.l10n.aboutAppContent,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                ?.copyWith(color: AppColors.lightGrey),
          ),
        ),
      ),
    );
  }
}
