import 'package:flutter/material.dart';

import '../models/task.dart';
import '../services/size_config.dart';
import '../services/theme_services.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(
              SizeConfig.orientation == Orientation.landscape ? 4 : 20)),
      width: SizeConfig.orientation == Orientation.landscape
          ? SizeConfig.screenWidth / 2
          : SizeConfig.screenWidth,
      margin: EdgeInsets.only(bottom: getProportionateScreenHeight(12)),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: _getBGClr(task.color),
        ),
        child: Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(task.title!,
                        style: titleStyle.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[100])),
                    const SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.access_time_filled_rounded,
                          color: Colors.grey[200],
                          size: 18,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          '${task.startTime}-${task.endTime}',
                          style: titleStyle.copyWith(
                              fontSize: 13, color: Colors.grey[100]),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(task.note!,
                        style: titleStyle.copyWith(
                            fontSize: 13, color: Colors.grey[100]))
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 60,
              width: 0.5,
              color: Colors.grey[200]!.withOpacity(0.7),
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                task.isCompleted == 0 ? 'TODO' : 'Complected',
                style: titleStyle.copyWith(color: Colors.white, fontSize: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getBGClr(int? color) {
    switch (color) {
      case 0:
        return ThemeManager.deepBlue;

      case 1:
        return  ThemeManager.litteBlue;

      case 2:
        return  ThemeManager.deepBlue;

      default:
        ThemeManager.deepBlue;
    }
  }
}
