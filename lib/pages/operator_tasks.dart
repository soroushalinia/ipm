import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipm/components/future_creator.dart';
import 'package:ipm/components/snackbar.dart';
import 'package:ipm/components/tags.dart';
import 'package:ipm/database.dart';
import 'package:drift/drift.dart' as drift;

class OperatorTaskView extends StatefulWidget {
  const OperatorTaskView({super.key});

  @override
  State<OperatorTaskView> createState() => _OperatorTaskViewState();
}

class _OperatorTaskViewState extends State<OperatorTaskView> {
  String searchQuery = "";
  final operator = Get.arguments["operator"];
  @override
  Widget build(BuildContext context) {
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
          title: Text(
            "گزارش: ${operator.name}",
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'جستجو',
                ),
                onChanged: (value) {
                  setState(
                    () {
                      searchQuery = value;
                    },
                  );
                },
              ),
            ),
            FutureCreator(future: () async {
              final db = Get.find<AppDatabase>();
              var operators = await db.select(db.operator).get();
              var projects = await db.select(db.project).get();
              var tasks = await db.select(db.task).get();
              var operatorTasks =
                  tasks.where((e) => e.operatorName == operator.id).toList();
              operatorTasks.sort((a, b) => a.operatorOrder - b.operatorOrder);
              if (searchQuery == "") {
                return {
                  "operators": operators,
                  "projects": projects,
                  "tasks": operatorTasks,
                };
              } else {
                return {
                  "operators": operators,
                  "projects": projects,
                  "tasks": operatorTasks
                      .where((element) => element.name.contains(searchQuery))
                      .toList(),
                };
              }
            }(), builder: (snapshot) {
              return Column(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data["tasks"].length,
                        itemBuilder: (BuildContext context, int index) {
                          final task = snapshot.data["tasks"][index];
                          String operatorName = "undefined";
                          String projectName = "undefined";

                          final projects = snapshot.data["projects"]
                              .where((e) => e.id == task.project)
                              .toList();
                          final operators = snapshot.data["operators"]
                              .where((e) => e.id == task.operatorName)
                              .toList();
                          if (projects.length > 0 && operators.length > 0) {
                            operatorName = operators[0].name;
                            projectName = projects[0].name;
                          }

                          return ListTile(
                            title: Text(
                                "${task.name}: (پروژه: $projectName) [$operatorName]"),
                            subtitle: LayoutBuilder(
                              builder: (context, constraints) {
                                if (constraints.minWidth > 300) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Tag(
                                        text: "اولویت: ${task.priority}",
                                        color: Colors.lightBlue[800],
                                      ),
                                      Tag(
                                        text: "مدت: ${task.duration} ساعت",
                                        color: Colors.lightBlue[800],
                                      ),
                                      Tag(
                                        text: task.done
                                            ? "تمام شده"
                                            : "انجام نشده",
                                        color: task.done
                                            ? Colors.greenAccent[400]
                                            : Colors.red[800],
                                      )
                                    ],
                                  );
                                } else {}
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Tag(
                                      text:
                                          task.done ? "تمام شده" : "انجام نشده",
                                      color: task.done
                                          ? Colors.greenAccent[400]
                                          : Colors.red[800],
                                    )
                                  ],
                                );
                                // print()
                              },
                            ),
                            onTap: () {
                              Get.toNamed(
                                '/detail',
                                arguments: {
                                  'task': task,
                                },
                              );
                            },
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    final db = Get.find<AppDatabase>();
                                    final currentOrder = task.operatorOrder;
                                    final newOrder = task.operatorOrder - 1;
                                    var tasks = await db.select(db.task).get();
                                    var orderTasks = tasks
                                        .map((e) => e.operatorOrder)
                                        .toList();

                                    var latestOrder = orderTasks.fold(
                                            1,
                                            (previousValue, element) =>
                                                element > previousValue
                                                    ? element
                                                    : previousValue) +
                                        1;

                                    if (newOrder <= latestOrder &&
                                        newOrder >= 1) {
                                      var stream = db.update(db.task)
                                        ..where((tbl) =>
                                            tbl.operatorOrder.equals(newOrder));

                                      await stream.write(
                                        TaskCompanion(
                                          operatorOrder:
                                              drift.Value(currentOrder),
                                        ),
                                      );

                                      var taskStream = db.update(db.task)
                                        ..where(
                                            (tbl) => tbl.id.equals(task.id));

                                      await taskStream.write(
                                        TaskCompanion(
                                          order: drift.Value(newOrder),
                                        ),
                                      );

                                      setState(() {});
                                    }
                                  },
                                  icon: const Icon(Icons.arrow_upward_sharp),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    final db = Get.find<AppDatabase>();
                                    final currentOrder = task.operatorOrder;
                                    final newOrder = task.operatorOrder + 1;
                                    var tasks = await db.select(db.task).get();
                                    var orderTasks = tasks
                                        .map((e) => e.operatorOrder)
                                        .toList();

                                    var latestOrder = orderTasks.fold(
                                        1,
                                        (previousValue, element) =>
                                            element > previousValue
                                                ? element
                                                : previousValue);
                                    if (newOrder <= latestOrder &&
                                        newOrder >= 1) {
                                      var stream = db.update(db.task)
                                        ..where((tbl) =>
                                            tbl.operatorOrder.equals(newOrder));

                                      await stream.write(
                                        TaskCompanion(
                                          operatorOrder:
                                              drift.Value(currentOrder),
                                        ),
                                      );

                                      var taskStream = db.update(db.task)
                                        ..where(
                                            (tbl) => tbl.id.equals(task.id));

                                      await taskStream.write(
                                        TaskCompanion(
                                          operatorOrder: drift.Value(newOrder),
                                        ),
                                      );

                                      setState(() {});
                                    }
                                  },
                                  icon: const Icon(Icons.arrow_downward_sharp),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.toNamed(
                                      '/add_task',
                                      arguments: {
                                        'task': task,
                                        'projectName': projectName,
                                        'operatorName': operatorName,
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    Get.defaultDialog(
                                      title: "حدف",
                                      content: const Text(
                                          "!آبا از حذف اطمینان دارید؟ این عمل غیر قابل بازگشت بوده و تمامی اقلام مربوطه حذف خواهند شد"),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () async {
                                              final db =
                                                  Get.find<AppDatabase>();
                                              var stream = db.delete(db.task)
                                                ..where((tbl) =>
                                                    tbl.id.equals(task.id));
                                              await stream.go();
                                              setState(() {});
                                              Get.back();
                                              // ignore: use_build_context_synchronously
                                              successSnackbar(
                                                  context, "حذف شد");
                                              setState(() {});
                                            },
                                            child: Text(
                                              "حذف",
                                              style: TextStyle(
                                                color: Colors.red[400],
                                              ),
                                            )),
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text("لغو"),
                                        ),
                                      ],
                                    );
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.toNamed(
                                      '/update',
                                      arguments: {
                                        'task': task,
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.update),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              );
            }),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed('/add_task');
          },
          backgroundColor: Colors.greenAccent[400],
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}
