import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipm/components/auto_complete.dart';
import 'package:ipm/components/future_creator.dart';
import 'package:ipm/components/snackbar.dart';
import 'package:ipm/database.dart';
import 'package:drift/drift.dart' as drift;

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController projectController = TextEditingController();
  final TextEditingController operatorController = TextEditingController();
  final TextEditingController schematicController = TextEditingController();
  final TextEditingController partController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController priorityController = TextEditingController();
  final TextEditingController manHourController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (Get.arguments != null) {
      final taskEdit = Get.arguments["task"];
      final operatorName = Get.arguments["operatorName"];
      final projectName = Get.arguments["projectName"];
      projectController.text = projectName;
      operatorController.text = operatorName;
      nameController.text = taskEdit.name;
      schematicController.text = taskEdit.schematicId;
      partController.text = taskEdit.part;
      durationController.text = "${taskEdit.duration}";
      priorityController.text = "${taskEdit.priority}";
      manHourController.text = "${taskEdit.costManHour}";
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
          title: Text(
            Get.arguments == null ? "تعریف فعالیت" : "ویرایش فعالیت",
          ),
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
            var projects = await db.select(db.project).get();
            var operators = await db.select(db.operator).get();
            return {
              "projects": projects.map((e) => e.name).toList(),
              "operators": operators.map((e) => e.name).toList()
            };
          }(),
          builder: (snapshot) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomAutoComplete(
                      textEditingController: projectController,
                      options: snapshot.data['projects'],
                      label: "پروژه",
                    ),
                    CustomAutoComplete(
                      textEditingController: operatorController,
                      options: snapshot.data['operators'],
                      label: "اپراتور",
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "نام",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: schematicController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "شماره نقشه",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: partController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "قطعه",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: durationController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "مدت (ساعت)",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: priorityController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "الویت",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: manHourController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "نفر ساعت",
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(50.0),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            if (schematicController.text == "" ||
                durationController.text == "" ||
                priorityController.text == "" ||
                manHourController.text == "" ||
                nameController.text == "" ||
                partController.text == "") {
              errorSnackbar("مقادیر نمی توانند خالی باشند");
            } else {
              final db = Get.find<AppDatabase>();
              var projects = await db.select(db.project).get();
              var operators = await db.select(db.operator).get();
              var operator = operators
                  .where((e) => e.name == operatorController.text)
                  .toList();
              var project = projects
                  .where((e) => e.name == projectController.text)
                  .toList();
              if (operator.isEmpty || project.isEmpty) {
                errorSnackbar("پروژه یا اپراتور صحیح نیست");
              } else {
                // ignore: use_build_context_synchronously
                int? duration = int.tryParse(durationController.text);
                int? priority = int.tryParse(priorityController.text);
                int? manHour = int.tryParse(manHourController.text);
                if (duration == null || priority == null || manHour == null) {
                  errorSnackbar("مقادیر عددی نیستند.");
                } else {
                  if (Get.arguments == null) {
                    var tasks = await db.select(db.task).get();
                    var orderTasks = tasks.map((e) => e.order!).toList();

                    var latestOrder = 1;
                    if (orderTasks.isNotEmpty) {
                      latestOrder = orderTasks.fold(
                              1,
                              (previousValue, element) =>
                                  element > previousValue
                                      ? element
                                      : previousValue) +
                          1;
                    }

                    await db.into(db.task).insert(
                          TaskCompanion(
                            name: drift.Value(nameController.text),
                            part: drift.Value(partController.text),
                            project: drift.Value(project[0].id),
                            operatorName: drift.Value(operator[0].id),
                            schematicId: drift.Value(schematicController.text),
                            duration: drift.Value(duration),
                            priority: drift.Value(priority),
                            costManHour: drift.Value(manHour),
                            order: drift.Value(latestOrder),
                            done: const drift.Value(false),
                            progress: const drift.Value(0),
                          ),
                        );
                    Get.toNamed('/tasks');
                    // ignore: use_build_context_synchronously
                    successSnackbar(context, "فعالیت ایجاد شد");
                    setState(() {});
                  } else {
                    var stream = db.update(db.task)
                      ..where((tbl) => tbl.id.equals(Get.arguments["task"].id));
                    await stream.write(
                      TaskCompanion(
                        name: drift.Value(nameController.text),
                        part: drift.Value(partController.text),
                        project: drift.Value(project[0].id),
                        operatorName: drift.Value(operator[0].id),
                        schematicId: drift.Value(schematicController.text),
                        duration: drift.Value(duration),
                        priority: drift.Value(priority),
                        costManHour: drift.Value(manHour),
                        done: const drift.Value(false),
                      ),
                    );
                    setState(() {});
                    Get.toNamed('/tasks');
                    // ignore: use_build_context_synchronously
                    successSnackbar(context, "تغییرات ذخیره شد");
                    setState(() {});
                  }
                }
              }
            }
          },
          backgroundColor: Colors.greenAccent[400],
          child: const Icon(Icons.done),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }
}
