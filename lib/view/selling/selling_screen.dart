import 'dart:typed_data';
import '../../controller/user_detial_bar_controller.dart';
import '../../core/constants.dart';
import '../../core/utils.dart';
import '../../services/sell_product_service.dart';
import 'widgets/radio_button_widget.dart';
import '../../widgets/cutom_textform_field.dart';
import '../../widgets/gradient_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../core/colors.dart';
import '../../widgets/appbar_widget.dart';

class SellingScreen extends StatefulWidget {
  const SellingScreen({Key? key}) : super(key: key);

  @override
  State<SellingScreen> createState() => _SellingScreenState();
}

class _SellingScreenState extends State<SellingScreen> {
  final _formKey = GlobalKey<FormState>();
  ValueNotifier<Uint8List?> image = ValueNotifier(null);
  bool isLoading = false;
  ValueNotifier<int> selectedRadio = ValueNotifier(0);
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemCostController = TextEditingController();

  @override
  void dispose() {
    itemNameController.dispose();
    itemCostController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(AppConstants.kAppBarHeight),
        child: AppBarWidget(showActionButton: false),
      ),
      body: SafeArea(
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: AppConstants.screenSize.height * 0.03,
                    ),
                    Center(
                      child: ValueListenableBuilder(
                        valueListenable: image,
                        builder: (BuildContext context, Uint8List? imgData,
                            Widget? _) {
                          return Container(
                            height: AppConstants.screenSize.height * 0.30,
                            width: AppConstants.screenSize.width * 0.90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: imgData == null
                                    ? const AssetImage(
                                        AppConstants.defaultImage,
                                      )
                                    : MemoryImage(
                                        imgData,
                                      ) as ImageProvider,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: AppConstants.screenSize.height * 0.02,
                    ),
                    GradientElevatedButton(
                      width: AppConstants.screenSize.width / 2.5,
                      borderRadius: BorderRadius.circular(10),
                      onPressed: () async {
                        var galleryStatus = await Permission.storage.status;

                        if (!galleryStatus.isGranted) {
                          await Permission.storage.request();
                        }
                        if (await Permission.storage.isGranted) {
                          final img = await AppUtils.pickImage(
                              source: ImageSource.gallery);
                          if (img != null) {
                            image.value = img;
                          }
                        } else {
                          return;
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Upload Image',
                            style: GoogleFonts.aBeeZee(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: UiColors.blackColor,
                            ),
                          ),
                          SizedBox(
                            height: AppConstants.screenSize.height * 0.01,
                          ),
                          const Icon(
                            Icons.upload,
                            color: UiColors.blackColor,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: AppConstants.screenSize.height * 0.01,
                        left: AppConstants.screenSize.width * 0.07,
                        right: AppConstants.screenSize.width * 0.07,
                        bottom: AppConstants.screenSize.height * 0.01,
                      ),
                      child: Container(
                        height: AppConstants.screenSize.height * 0.50,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              CustomTextFoemField(
                                controller: itemNameController,
                                title: 'Item Name',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Item Name Required Field';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              CustomTextFoemField(
                                keyboardType: TextInputType.number,
                                controller: itemCostController,
                                title: 'Item Cost',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Item Cost Required Field';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(
                                height: AppConstants.screenSize.height * 0.02,
                              ),
                              ValueListenableBuilder(
                                  valueListenable: selectedRadio,
                                  builder: (BuildContext context,
                                      int selectedValue, Widget? _) {
                                    return LimitedBox(
                                      maxHeight:
                                          AppConstants.screenSize.height * 0.10,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: [
                                          RadioButtonWidget(
                                            value: 0,
                                            groupValue: selectedValue,
                                            onChanged: (value) {
                                              selectedRadio.value = value;
                                            },
                                            label: 'None',
                                          ),
                                          RadioButtonWidget(
                                            value: 1,
                                            groupValue: selectedValue,
                                            onChanged: (value) {
                                              selectedRadio.value = value;
                                            },
                                            label: '10%',
                                          ),
                                          RadioButtonWidget(
                                            value: 2,
                                            groupValue: selectedValue,
                                            onChanged: (value) {
                                              selectedRadio.value = value;
                                            },
                                            label: '20%',
                                          ),
                                          RadioButtonWidget(
                                            value: 3,
                                            groupValue: selectedValue,
                                            onChanged: (value) {
                                              selectedRadio.value = value;
                                            },
                                            label: '30%',
                                          ),
                                          RadioButtonWidget(
                                            value: 4,
                                            groupValue: selectedValue,
                                            onChanged: (value) {
                                              selectedRadio.value = value;
                                            },
                                            label: '40%',
                                          ),
                                          RadioButtonWidget(
                                            value: 5,
                                            groupValue: selectedValue,
                                            onChanged: (value) {
                                              selectedRadio.value = value;
                                            },
                                            label: '50%',
                                          ),
                                          RadioButtonWidget(
                                            value: 6,
                                            groupValue: selectedValue,
                                            onChanged: (value) {
                                              selectedRadio.value = value;
                                            },
                                            label: '60%',
                                          ),
                                          RadioButtonWidget(
                                            value: 7,
                                            groupValue: selectedValue,
                                            onChanged: (value) {
                                              selectedRadio.value = value;
                                            },
                                            label: '70%',
                                          ),
                                          RadioButtonWidget(
                                            value: 8,
                                            groupValue: selectedValue,
                                            onChanged: (value) {
                                              selectedRadio.value = value;
                                            },
                                            label: '80%',
                                          ),
                                          RadioButtonWidget(
                                            value: 9,
                                            groupValue: selectedValue,
                                            onChanged: (value) {
                                              selectedRadio.value = value;
                                            },
                                            label: '90%',
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                              SizedBox(
                                height: AppConstants.screenSize.height * 0.02,
                              ),
                              GradientElevatedButton(
                                width: AppConstants.screenSize.width / 1.5,
                                borderRadius: BorderRadius.circular(10),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await SellProductService()
                                        .uploadProductToDB(
                                      sellerUid: FirebaseAuth
                                          .instance.currentUser!.uid,
                                      sellerName:
                                          Get.find<UserDetialController>()
                                              .userDetials()
                                              .username,
                                      productName: itemNameController.text,
                                      price:
                                          double.parse(itemCostController.text),
                                      imageUrl: image.value,
                                      discount: AppConstants
                                          .discountKey[selectedRadio.value],
                                    );
                                  }
                                },
                                child: Text(
                                  'Sell',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: UiColors.blackColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: AppConstants.screenSize.height * 0.01,
                              ),
                              GradientElevatedButton(
                                bodercolor: Colors.grey,
                                width: AppConstants.screenSize.width / 1.5,
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: UiColors.secondaryButtonGradient,
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  'Back',
                                  style: GoogleFonts.aBeeZee(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: UiColors.blackColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
