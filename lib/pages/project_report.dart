import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipm/components/future_creator.dart';
import 'package:ipm/database.dart';

class ProjectReport extends StatelessWidget {
  const ProjectReport({super.key});

  @override
  Widget build(BuildContext context) {
    final projectId = Get.arguments["projectId"];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
            },
          ),
          backgroundColor: Colors.blue[300],
          title: const Text(
            "گزارش پروژه",
          ),
        ),
        body: FutureCreator(
          future: () async {
            final db = Get.find<AppDatabase>();

            int totalCost = 0;
            int totalDelay = 0;
            int totalTime = 0;
            int totalProgress = 0;
            var datesIncomplete = false;
            DateTime? projectFinish;

            var project = await db.select(db.project).get();
            var projectName = project
                .where((element) => element.id == projectId)
                .toList()[0]
                .name;
            var tasks = await db.select(db.task).get();
            var delay = await db.select(db.delay).get();

            List<DateTime> startDates = [];
            List<DateTime> finishDates = [];

            var projectTasks =
                tasks.where((e) => e.project == projectId).toList();

            var taskCount = projectTasks.length;

            for (var task in projectTasks) {
              totalCost = totalCost + task.costManHour * task.duration;
              totalTime = totalTime + task.duration;
              totalProgress = totalProgress + task.progress!;
              if (task.start != null) {
                startDates.add(task.start!);
              }
              if (task.finish != null) {
                finishDates.add(task.finish!);
              }
              var taskDelays = delay.where((e) => e.task == task.id).toList();
              for (var delay in taskDelays) {
                totalDelay = totalDelay + delay.time;
              }
            }
            if (startDates.length != projectTasks.length ||
                finishDates.length != projectTasks.length) {
              datesIncomplete = true;
            }
            if (!datesIncomplete && finishDates.length > 1) {
              projectFinish = finishDates.fold(
                  finishDates[0],
                  (previousValue, element) =>
                      element.difference(previousValue!).inMinutes > 0
                          ? element
                          : previousValue);
            }

            return {
              "name": projectName,
              "status": (totalProgress == totalTime ? true : false)
                  ? "به اتمام رسیده (نهایی شده)"
                  : "پروژه در حال انجام است",
              "final": totalProgress == totalTime ? true : false,
              "taskCount": taskCount,
              "totalCost": totalCost,
              "totalDelay": totalDelay,
              "totalTime": totalTime,
              "totalProgress": totalProgress,
              "datesIncomplete": datesIncomplete,
              "projectFinish": projectFinish
            };
          }(),
          builder: (snapshot) {
            if (snapshot.data["taskCount"] == 0) {
              return const Center(
                child: Text(
                  "فعالیتی برای پروژه تعریف نشده است",
                  style: TextStyle(fontSize: 32.0),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                // mainAxisAlignment: ma,
                children: [
                  Text(
                    "گزارش پروژه : ${snapshot.data["name"]}",
                    style: const TextStyle(fontSize: 24.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: snapshot.data["final"]
                        ? const Text(
                            "پروژه به اتمام رسیده است و مقادیر قطعی است.",
                            style: TextStyle(color: Colors.green, fontSize: 16),
                          )
                        : const Text(
                            "پروژه نهایی نشده است و در حال انجام است. مقادیر تخمینی است.",
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "نمای کلی",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Text(
                                  "تعداد کل فعالیت ها: ${snapshot.data["taskCount"]}",
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "تاریخ ها فاقد نواقصی هستند:",
                                    ),
                                    snapshot.data["datesIncomplete"]
                                        ? const Icon(
                                            Icons.close,
                                            color: Colors.red,
                                          )
                                        : const Icon(
                                            Icons.done,
                                            color: Colors.green,
                                          ),
                                  ],
                                ),
                                Text(
                                  "هزینه کل: ${snapshot.data['totalCost']} تومان",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    "زمانبندی",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Text(
                                  // ignore: prefer_if_null_operators
                                  "تاریخ پایان: ${snapshot.data["projectFinish"] == null ? "نامشخص" : snapshot.data["projectFinish"]}",
                                ),
                                Text(
                                  "پیشرفت کل: ${snapshot.data['totalTime']} ساعت",
                                ),
                                Text(
                                  "زمان کل: ${snapshot.data['totalTime']} ساعت",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text(
                      "پروژه دارای ${snapshot.data["totalDelay"]} ساعت تاخیر می باشد.",
                      style: const TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const ListTile(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
