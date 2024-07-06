import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent/core/constants/colors.dart';
import 'package:parent/core/constants/images.dart';
import 'package:parent/features/auth/widgets/auth_form.dart';
import 'package:parent/features/auth/widgets/page_background.dart';
import 'package:parent/l10n/l10n.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const PageBackground(),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 72),
                  Text(
                    context.l10n.welcome,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(color: AppColors.white),
                  ),
                  FittedBox(
                    child: Text(
                    context.l10n.welcomeSub,
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          color: AppColors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 72),
                  Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: double.infinity,
                            //  margin: const EdgeInsets.only(top: 64),
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.all(Radius.circular(18)),
                            ),
                            child: const AuthForm(),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: -42,
                            child: Container(
                              width: 84,
                              height: 84,
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  Images.parentsSVG,
                                  width: 43,
                                  height: 43,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height:64+ MediaQuery.of(context).viewInsets.bottom),

                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
