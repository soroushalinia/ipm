import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipm/components/future_creator.dart';
import 'package:ipm/database.dart';
import 'package:shamsi_date/shamsi_date.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

class TaskDetail extends StatefulWidget {
  const TaskDetail({super.key});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  final task = Get.arguments["task"];
  @override
  Widget build(BuildContext context) {
    final List<String> tags = task.tags.split(",").toList();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          title: Text("${task.name}"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: FutureCreator(
          future: () async {
            final db = Get.find<AppDatabase>();
            var operators = await db.select(db.operator).get();
            var projects = await db.select(db.project).get();
            final projectName =
                projects.where((e) => e.id == task.project).toList()[0].name;
            final operatorName = operators
                .where((e) => e.id == task.operatorName)
                .toList()[0]
                .name;
            return {"operatorName": operatorName, "projectName": projectName};
          }(),
          builder: (snapshot) {
            String startString = "تعریف نشده";
            String finishString = "تعریف نشده";
            if (task.start != null) {
              DateTime utcStart = task.start.toUtc();
              Gregorian gStart = Gregorian(utcStart.year, utcStart.month,
                  utcStart.day, utcStart.hour, utcStart.minute);
              Jalali jStart = gStart.toJalali();
              startString =
                  "${jStart.year}/${jStart.month}/${jStart.day} ${jStart.hour}:${jStart.minute}";
            }
            if (task.finish != null) {
              DateTime utcFinish = task.finish.toUtc();

              Gregorian gFinish = Gregorian(utcFinish.year, utcFinish.month,
                  utcFinish.day, utcFinish.hour, utcFinish.minute);

              Jalali jFinish = gFinish.toJalali();
              finishString =
                  "${jFinish.year}/${jFinish.month}/${jFinish.day} ${jFinish.hour}:${jFinish.minute}";
            }

            var percent = (task.progress / task.duration) * 100;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    title: const Text("پروژه"),
                    subtitle: Text("${snapshot.data["projectName"]}"),
                    leading: const Icon(Icons.assessment_rounded),
                  ),
                  ListTile(
                    title: const Text("اپراتور"),
                    subtitle: Text("${snapshot.data["operatorName"]}"),
                    leading: const Icon(Icons.account_circle),
                  ),
                  ListTile(
                    title: const Text("شماره نقشه"),
                    subtitle: Text("${task.schematicId}"),
                    leading: const Icon(Icons.schema_rounded),
                  ),
                  ListTile(
                    title: const Text("شماره قطعه"),
                    subtitle: Text("${task.part}"),
                    leading: const Icon(Icons.schema_rounded),
                  ),
                  ListTile(
                    title: const Text("مدت زمان (ساعت)"),
                    subtitle: Text("${task.duration}"),
                    leading: const Icon(Icons.watch_later_rounded),
                  ),
                  ListTile(
                    title: const Text("اولویت"),
                    subtitle: Text("${task.priority}"),
                    leading: const Icon(Icons.priority_high_rounded),
                  ),
                  ListTile(
                    title: const Text("هزینه نفر ساعت"),
                    subtitle: Text("${task.costManHour}"),
                    leading: const Icon(Icons.price_change_rounded),
                  ),
                  ListTile(
                    title: const Text("شروع"),
                    subtitle: Text(startString),
                    leading: const Icon(Icons.calendar_today_rounded),
                  ),
                  ListTile(
                    title: const Text("پایان"),
                    subtitle: Text(finishString),
                    leading: const Icon(Icons.calendar_today_rounded),
                  ),
                  ListTile(
                    title: const Text("پیشرفت"),
                    subtitle: Text(
                        "${task.progress} از ${task.duration} ساعت (${percent.toStringAsFixed(3)} %)"),
                    leading: const Icon(Icons.percent),
                  ),
                  ListTile(
                    title: const Text("پایان"),
                    subtitle: Text(task.done ? "انجام شده" : "انجام نشده"),
                    leading: const Icon(Icons.done),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.only(right: 28),
                    child: Text(
                      "برچسب ها",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      children: tags.mapIndexed((index, element) {
                        if (element != "") {
                          return Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  element,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      }).toList(),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
