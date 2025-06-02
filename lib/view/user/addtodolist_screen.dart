import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:todo_api_test/constant/appcolors.dart';
import 'package:todo_api_test/constant/appimages.dart';
import 'package:todo_api_test/controller/backend/todomodel_controller.dart';
import 'package:todo_api_test/view/user/home_screen.dart';
import 'package:todo_api_test/widget/Button/Custom_Buton.dart';
import 'package:todo_api_test/widget/Fields/custom_textfield.dart';

class AddtodolistScreen extends StatefulWidget {
  const AddtodolistScreen({super.key});

  @override
  State<AddtodolistScreen> createState() => _AddtodolistScreenState();
}

class _AddtodolistScreenState extends State<AddtodolistScreen> {
  TextEditingController titlecontroler = TextEditingController();
  TextEditingController descriptioncontroler = TextEditingController();
  TodomodelController todomodelController = Get.put(TodomodelController());

  final _formkey = GlobalKey<FormState>();
  bool Loading = false;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: todomodelController.isloading.value,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 172.h),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome Onboard!',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 31.h),
                    Image.asset(Appimages.addto),
                    SizedBox(height: 25.h),
                    Text(
                      'Add What your want to do later on..',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: Appcolors.Colorgreen,
                      ),
                    ),
                    SizedBox(height: 35.h),
                    Form(
                      key: _formkey,
                      child: Column(
                        spacing: 26.h,
                        children: [
                          CustomTextfield(
                            controller: titlecontroler,
                            width: 320.w,
                            color: Appcolors.Colorweight,
                            labeltext: 'title',
                            inputType: TextInputType.text,
                            obscuretext: false,
                            validator: (value) {
                              if (value == '' || value == null) {
                                return 'Please enter your title';
                              }
                              return null;
                            },
                          ),
                          CustomTextfield(
                            controller: descriptioncontroler,
                            width: 320.w,
                            color: Appcolors.Colorweight,
                            labeltext: 'Description',
                            inputType: TextInputType.text,
                            obscuretext: false,
                            validator: (value) {
                              if (value == '' || value == null) {
                                return 'Please enter your descipton';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 15.h),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            },
                            child: Obx(
                              () => Custombuton(
                                isLoading: todomodelController.isloading.value,
                                width: 220.w,
                                height: 44.h,
                                backgroundColor: Appcolors.Colorgreen,
                                ontap: () {
                                  todomodelController.addtodo(
                                    titlecontroler.text,
                                    descriptioncontroler.text,
                                  );
                                  // todomodelController.addtodo(
                                  //     titlecontroler,
                                  //     descriptioncontroler,
                                  //     DateTime.now().toString(),
                                  //     _formkey);
                                  // todomodelController.gettodo();
                                },
                                title: 'Add to list',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Future Createdata() async {
  //   if (_formkey.currentState!.validate()) {
  //     try {
  //       Loading = true;
  //       setState(() {});
  //       DocumentReference docref =
  //           FirebaseFirestore.instance.collection('Todo').doc();
  //       final userid = FirebaseAuth.instance.currentUser!.uid;

  //       TodolistModel todolistModel = TodolistModel(
  //         docid: docref.id,
  //         userid: userid,
  //         title: titlecontroler.text,
  //         description: descriptioncontroler.text,
  //         Time: DateTime.now().toString(),
  //       );

  //       await docref.set(todolistModel.tofirestore());
  //       Get.to(HomeScreen());
  //       Loading = false;
  //       setState(() {});
  //       ToastUtil.success('you hvae Succesfuly add data');
  //     } on FirebaseException catch (e) {
  //       ToastUtil.error(e.toString());
  //       Loading = false;
  //       setState(() {});
  //     }
  //   }
}
