import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent/features/home/controller/home_cubit.dart';
import 'package:parent/features/home/widgets/sons_list_item.dart';
import 'package:parent/features/shared/widgets/common_loading.dart';
import 'package:parent/l10n/l10n.dart';

class SonsList extends StatelessWidget {
  const SonsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const CommonLoading();
        }
        if (state is HomeLoaded) {
          return state.students.isEmpty
              ?  Center(
                  child: Text(context.l10n.noStudents),
                )
              : ListView.builder(
                  itemCount: state.students.length,
                  itemBuilder: (context, index) {
                    return SonsListItem(
                      student: state.students[index],
                    );
                  },
                );
        }
        if (state is HomeError) return Center(child: Text(context.localizeError(state.message)));
        return const SizedBox();
      },
    );
  }
}
