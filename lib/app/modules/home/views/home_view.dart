import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ini_labs/app/modules/userInputPage/controllers/user_input_page_controller.dart';
import '../../../auth/auth_controller.dart';
import '../../repositoryDetails/views/repository_details_view.dart';
import '../controllers/home_controller.dart';
import 'package:intl/intl.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final authcontroller = Get.put(AuthController());
  final controller = Get.put(HomeController());
  final inputController = Get.put(UserInputPageController());
  final Color gray = const Color.fromARGB(255, 65, 65, 65);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // This is the code to add the center icon

          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back)),
          flexibleSpace: SafeArea(
              child: Icon(
            FontAwesomeIcons.github,
            size: 50,
            color: Colors.white,
          )),
        ),
        body: Obx(() => authcontroller.isLoading == true
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width * .2,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                authcontroller.users[0].avatarUrl ?? ""),
                            backgroundColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: Get.width / 1.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                authcontroller.users[0].name ?? "",
                                softWrap: true,
                                style: Get.textTheme.titleLarge,
                              ),
                              Text(
                                authcontroller.users[0].login ?? "",
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 22,
                                  color: gray,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      authcontroller.users[0].bio ?? " ",
                      style: Get.textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Icon(Icons.link),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: Get.width - 50,
                          child: Text(
                            authcontroller.users[0].blog ?? " ",
                            softWrap: true,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(FontAwesomeIcons.twitter),
                        SizedBox(
                          width: 10,
                        ),
                        Text(authcontroller.users[0].twitterUsername ?? " ")
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.people_outline),
                        SizedBox(
                          width: 5,
                        ),
                        Text(authcontroller.users[0].followers.toString()),
                        Text(" followers"),
                        SizedBox(
                          width: 5,
                        ),
                        Text(authcontroller.users[0].following.toString()),
                        Text(" following"),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.gite,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Repositories",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                      authcontroller.users[0].publicRepos
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18))
                                ],
                              ),
                              Obx(() => IconButton(
                                    onPressed: () {
                                      controller.listToGrid();
                                    },
                                    icon: controller.grid != false
                                        ? Icon(Icons.list)
                                        : Icon(Icons.grid_view_outlined),
                                    color: Colors.white,
                                    iconSize: 32,
                                  ))
                            ],
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width / 2,
                            height: 50,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Find Repo...",
                                  focusColor: Colors.black,
                                  hintStyle: TextStyle(fontSize: 16),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.black))),
                              onChanged: (data) {
                                authcontroller.repoName.value = data;
                                authcontroller.getUserrepo(
                                    inputController.name.value,
                                    authcontroller.repoName.value,
                                    "",
                                    "");
                                authcontroller.repo.value = [];
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          DropdownButton<String>(
                              value: authcontroller.typeValu.value,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 2,
                                color: Colors.black,
                              ),
                              items: authcontroller.type
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? data) {
                                print(data);
                                authcontroller.typeValu.value = data!;
                                authcontroller.getUserrepo(
                                    inputController.name.value,
                                    authcontroller.repoName.value,
                                    authcontroller.typeValu.value,
                                    "");
                                authcontroller.repo.value = [];
                              }),
                          SizedBox(
                            width: 10,
                          ),
                          DropdownButton<String>(
                              value: authcontroller.sortValu.value,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 2,
                                color: Colors.black,
                              ),
                              items: authcontroller.sort
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? data) {
                                authcontroller.sortValu.value = data!;
                                print(inputController.name.value);
                                authcontroller.getUserrepo(
                                    inputController.name.value,
                                    authcontroller.repoName.value,
                                    authcontroller.typeValu.value,
                                    authcontroller.sortValu.value);
                                authcontroller.repo.value = [];
                              }),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    controller.grid != false ? repoGridview() : repoListView(),
                    SizedBox(
                      height: 15,
                    ),
            
                    authcontroller.page.value <= 1
                        ? TextButton(
                            onPressed: () {
                              authcontroller.page.value++;
                              authcontroller.getUserrepo(
                                  inputController.name.value, "", "", "");
                              authcontroller.repo.value = [];
                            },
                            child: Text("Next", style: TextStyle(fontSize: 22)))
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    authcontroller.page.value--;
                                    authcontroller.getUserrepo(
                                        inputController.name.value, "", "", "");
                                    authcontroller.repo.value = [];
                                  },
                                  child: Text(
                                    "Prev",
                                    style: TextStyle(fontSize: 22),
                                  )),
                              authcontroller.itemLength.value <= 30
                                  ? Visibility(
                                      visible: false, child: Text("Nothing"))
                                  : TextButton(
                                      onPressed: () {
                                        authcontroller.page.value++;
                                        authcontroller.getUserrepo(
                                            inputController.name.value,
                                            "",
                                            "",
                                            "");
                                        authcontroller.repo.value = [];
                                      },
                                      child: Text("Next",
                                          style: TextStyle(fontSize: 22)))
                            ],
                          ),
                  ]),
                ),
              )));
  }

  GridView repoGridview() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: authcontroller.repo.length,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 250,
      ),
      itemBuilder: (context, index) {
        final time =
            DateTime.parse(authcontroller.repo[index].updatedAt.toString());
        String formattedDate = DateFormat.yMd().format(time);

        String? title, fdescraption, descraption;
        try {
          title =
              "${authcontroller.repo[index].name.toString().substring(0, 15)}...";
        } catch (e) {
          if (e is RangeError) {
            title = "${authcontroller.repo[index].name}";

            print("Invalid index. Using fallback value.");
          } else {
            // Handle other types of exceptions
            print("An error occurred: $e");
          }
        }
        try {
          descraption = authcontroller.repo[index].description ?? " ";
          fdescraption = '${descraption.substring(0, 25)}...';
        } catch (e) {
          if (e is RangeError) {
            fdescraption = descraption;
            print("Invalid index. Using fallback value.");
          } else {
            // Handle other types of exceptions
            print("An error occurred: $e");
          }
        }

        return GestureDetector(
          onTap: () {
            Get.to(
              Repository(
                url: authcontroller.repo[index].htmlUrl.toString(),
              ),
            );
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.toString(),
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 22,
                        color: Color(0xff0969da),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    authcontroller.repo[index].visibility.toString(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    // fdescraption ?? "",
                    fdescraption.toString(),
                    softWrap: true,
                    style: TextStyle(
                      color: gray,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "${authcontroller.repo[index].language} Updated on $formattedDate",
                    softWrap: true,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  ListView repoListView() {
    return ListView.builder(
        itemCount: authcontroller.repo.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final time =
              DateTime.parse(authcontroller.repo[index].updatedAt.toString());
          String formattedDate = DateFormat.yMd().format(time);

          String? title;
          try {
            title =
                "${authcontroller.repo[index].name.toString().substring(0, 15)}"
                "...";
          } catch (e) {
            if (e is RangeError) {
              title = "${authcontroller.repo[index].name}";
              print("Invalid index. Using fallback value.");
            } else {
              // Handle other types of exceptions
              print("An error occurred: $e");
            }
          }

          return GestureDetector(
            onTap: () {
              Get.to(
                Repository(
                  url: authcontroller.repo[index].htmlUrl.toString(),
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title.toString(),
                          style: TextStyle(
                              fontSize: 22,
                              color: Color(0xff0969da),
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1, color: gray),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(authcontroller.repo[index].visibility
                                .toString()),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      authcontroller.repo[index].description != null
                          ? authcontroller.repo[index].description.toString()
                          : "",
                      style: TextStyle(
                        color: gray,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: Get.width / 3.5,
                          child: Text(
                            authcontroller.repo[index].language.toString(),
                            softWrap: true,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        SizedBox(
                          width: Get.width / 1.8,
                          child: Text(
                            "Updated on " + formattedDate,
                            softWrap: true,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
