import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipm/components/future_creator.dart';
import 'package:ipm/components/snackbar.dart';
import 'package:ipm/database.dart';
import 'package:ipm/util/validator.dart';
import 'package:drift/drift.dart' as drift;
import 'package:shamsi_date/shamsi_date.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({super.key});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final task = Get.arguments["task"];
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController finishDateController = TextEditingController();
  final TextEditingController finishTimeController = TextEditingController();
  final TextEditingController progressController = TextEditingController();
  final TextEditingController delayController = TextEditingController();
  final TextEditingController delayDateController = TextEditingController();
  final TextEditingController delayDurationController = TextEditingController();
  // final TextEditingController durationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          title: const Text("به روز رسانی"),
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
            var delays = await db.select(db.delay).get();
            var taskDelays = delays.where((e) => e.task == task.id);
            return taskDelays.toList();
          }(),
          builder: (snapshot) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: startDateController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "تاریخ شروع",
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: startTimeController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "ساعت شروع",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: finishDateController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "تاریخ اتمام",
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: finishTimeController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "ساعت اتمام",
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: progressController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "پیشرفت (ساعت)",
                        ),
                      ),
                    ),
                    const Divider(),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.dialog(
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: AlertDialog(
                                  backgroundColor: Colors.blue[50],
                                  title: const Text("ثبت تاخیر"),
                                  actions: [
                                    TextButton(
                                      onPressed: () async {
                                        final date = tryParseDate(
                                            delayDateController.text);
                                        final delayDuration = int.tryParse(
                                            delayDurationController.text);
                                        if (date == null ||
                                            delayDuration == null) {
                                          Get.back();
                                          errorSnackbar(
                                              "تاریخ یا زمان تاخیر صحیح نیست");
                                        } else {
                                          final db = Get.find<AppDatabase>();
                                          await db.into(db.delay).insert(
                                                DelayCompanion(
                                                  task: drift.Value(task.id),
                                                  description: drift.Value(
                                                      "[${delayDateController.text}] ${delayController.text}"),
                                                  time: drift.Value(
                                                      delayDuration),
                                                ),
                                              );
                                          Get.back();
                                          setState(() {});
                                          // ignore: use_build_context_synchronously
                                          successSnackbar(
                                              context, "تاخیر ثبت شد");
                                          setState(() {});
                                        }
                                      },
                                      child: const Text("ثبت"),
                                    ),
                                  ],
                                  content: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller: delayController,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: "علت تاخیر",
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller: delayDateController,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: "تاریخ تاخیر",
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextField(
                                          controller: delayDurationController,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: "مدت تاخیر (ساعت)",
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.add),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            "تاخیرات",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(snapshot.data[index].description),
                          subtitle: Text("${snapshot.data[index].time} ساعت"),
                          trailing: IconButton(
                            onPressed: () async {
                              final db = Get.find<AppDatabase>();
                              var stream = db.delete(db.delay)
                                ..where((tbl) =>
                                    tbl.id.equals(snapshot.data[index].id));
                              await stream.go();
                              setState(() {});
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final startTime = tryParseTime(startTimeController.text);
            final finishTime = tryParseTime(finishTimeController.text);
            final startDate = tryParseDate(startDateController.text);
            final finishDate = tryParseDate(finishDateController.text);
            final progress = int.tryParse(progressController.text);

            if (startDate != null && startTime == null) {
              errorSnackbar("تاریخ و ساعت باید هر دو تکمیل شوند");
              return;
            } else if (startDate == null && startTime != null) {
              errorSnackbar("تاریخ و ساعت باید هر دو تکمیل شوند");
              return;
            }
            if (finishDate != null && finishTime == null) {
              errorSnackbar("تاریخ و ساعت باید هر دو تکمیل شوند");
              return;
            } else if (finishDate == null && finishTime != null) {
              errorSnackbar("تاریخ و ساعت باید هر دو تکمیل شوند");
              return;
            }

            final db = Get.find<AppDatabase>();
            var stream = db.update(db.task)
              ..where((tbl) => tbl.id.equals(task.id));
            if (progressController.text != "") {
              if (progress == null) {
                errorSnackbar("عدد پیشرفت صحیح نیست");
                return;
              } else {
                if (progress > task.duration) {
                  errorSnackbar(
                      "زمان پیشرفت از کل مدت بزرگتر است. در صورت نیاز می توانید تاخیر ثبت کنید");

                  return;
                }
                await stream.write(
                  TaskCompanion(progress: drift.Value(progress)),
                );
              }
            }
            if (startDate != null && startTime != null) {
              Jalali j = Jalali(
                startDate[0],
                startDate[1],
                startDate[2],
                startTime[0],
                startTime[1],
              );
              Gregorian g = j.toGregorian();
              DateTime datetime = g.toUtcDateTime();
              await stream.write(
                TaskCompanion(
                  start: drift.Value(datetime),
                ),
              );
            }
            if (finishDate != null && finishTime != null) {
              Jalali j = Jalali(
                finishDate[0],
                finishDate[1],
                finishDate[2],
                finishTime[0],
                finishTime[1],
              );
              Gregorian g = j.toGregorian();
              DateTime datetime = g.toUtcDateTime();
              await stream.write(
                TaskCompanion(
                  finish: drift.Value(datetime),
                ),
              );
            }
            Get.toNamed("/tasks");
            setState(() {});
            // ignore: use_build_context_synchronously
            successSnackbar(context, "بروز رسانی ثبت شد");
            setState(() {});
          },
          backgroundColor: Colors.greenAccent[400],
          child: const Icon(Icons.done),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}
