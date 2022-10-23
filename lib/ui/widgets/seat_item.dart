import 'package:airplane/cubit/seat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/theme.dart';

class SeatItem extends StatelessWidget {
  //NOTE: 0.available 1.selected 2.unavailable

  final int status;
  final String id;

  const SeatItem({
    Key? key,
    required this.status,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    backgroundCalor() {
      switch (status) {
        case 0:
          return kAvailableColor;
        case 1:
          return kPrimaryColor;
        case 2:
          return kUnavailableColor;
        default:
          return kUnavailableColor;
      }
    }

    borderCalor() {
      switch (status) {
        case 0:
          return kPrimaryColor;
        case 1:
          return kPrimaryColor;
        case 2:
          return kUnavailableColor;
        default:
          return kUnavailableColor;
      }
    }

    child() {
      switch (status) {
        case 0:
          return const SizedBox();
        case 1:
          return Center(
            child: Text(
              'YOU',
              style: whiteTextStyle.copyWith(
                fontWeight: semibold,
              ),
            ),
          );
        case 2:
          return const SizedBox();
        default:
          return const SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        context.read<SeatCubit>().selectSeat(id);
      },
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: backgroundCalor(),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderCalor(),
            width: 2,
          ),
        ),
        child: child(),
      ),
    );
  }
}
