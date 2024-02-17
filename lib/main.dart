import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ipm/components/drawer.dart';
import 'package:get/get.dart';
import 'package:ipm/components/future_creator.dart';
import 'package:ipm/components/snackbar.dart';
import 'package:ipm/database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:ipm/pages/operator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AppDatabase());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blueAccent[300],
        textTheme: GoogleFonts.vazirmatnTextTheme(),
      ),
      getPages: [
        GetPage(name: '/operator', page: () => const OperatorPage()),
      ],
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          drawer: const NavDrawer(),
          appBar: AppBar(
            backgroundColor: Colors.blue[300],
            title: const Text(
              "مدیریت پروژه",
            ),
          ),
          body: FutureCreator(
            builder: (snapshot) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) {
                  var project = snapshot.data?[index];
                  return ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    leading: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Text(
                        "${index + 1}",
                        style: const TextStyle(
                            color: Colors.white, fontSize: 14.0),
                      ),
                    ),
                    title: Text("${project?.name}"),
                    onTap: () {
                      Get.dialog(
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: AlertDialog(
                            backgroundColor: Colors.blue[50],
                            title: const Text("ویرایش پروژه"),
                            content: TextField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "نام",
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () async {
                                  if (nameController.text == "") {
                                    Get.back();
                                    errorSnackbar("نام نمی تواند خالی باشد ");
                                  } else {
                                    final db = Get.find<AppDatabase>();
                                    var stream = db.update(db.project)
                                      ..where(
                                          (tbl) => tbl.id.equals(project.id));
                                    await stream.write(
                                      ProjectCompanion(
                                        name: drift.Value(nameController.text),
                                      ),
                                    );
                                    Get.back();
                                    // ignore: use_build_context_synchronously
                                    successSnackbar(
                                        context, "تغییرات ذخیره شد  ");
                                    setState(() {});
                                  }
                                },
                                child: const Text("ثبت"),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red[600],
                      ),
                      // color: Colors.red,
                      onPressed: () {
                        Get.defaultDialog(
                          title: "حدف",
                          content: const Text(
                              "!آبا از حذف اطمینان دارید؟ این عمل غیر قابل بازگشت بوده و تمامی اقلام مربوطه حذف خواهند شد"),
                          actions: [
                            ElevatedButton(
                                onPressed: () async {
                                  final db = Get.find<AppDatabase>();
                                  var stream = db.delete(db.project)
                                    ..where((tbl) => tbl.id.equals(project.id));
                                  await stream.go();
                                  Get.back();
                                  // ignore: use_build_context_synchronously
                                  successSnackbar(context, "حذف شد");
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
                    ),
                  );
                },
              );
            },
            future: () async {
              final db = Get.find<AppDatabase>();
              var records = await db.select(db.project).get();
              return records;
            }(),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.greenAccent[400],
            onPressed: () {
              Get.dialog(
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: AlertDialog(
                    backgroundColor: Colors.blue[50],
                    title: const Text("تعریف پروژه"),
                    content: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "نام",
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () async {
                          if (nameController.text == "") {
                            Get.back();
                            errorSnackbar("نام نمی تواند خالی باشد ");
                          } else {
                            final db = Get.find<AppDatabase>();
                            await db.into(db.project).insert(
                                  ProjectCompanion(
                                    name: drift.Value(nameController.text),
                                  ),
                                );
                            Get.back();
                            // ignore: use_build_context_synchronously
                            successSnackbar(context, "پروژه ایجاد شد");
                            setState(() {});
                          }
                        },
                        child: const Text("ثبت"),
                      ),
                    ],
                  ),
                ),
              );
            },
            child: const Icon(
              Icons.add,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniStartFloat,
        ),
      ),
    );
  }
}
