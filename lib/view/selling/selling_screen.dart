import 'dart:typed_data';
import 'package:amazon_clone/core/constants.dart';
import 'package:amazon_clone/core/utils.dart';
import 'package:amazon_clone/view/selling/widgets/radio_button_widget.dart';
import 'package:amazon_clone/widgets/cutom_textform_field.dart';
import 'package:amazon_clone/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
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
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemConstController = TextEditingController();
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
                                controller: itemConstController,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RadioButtonWidget(
                                    value: true,
                                    groupValue: true,
                                    onChanged: (value) {},
                                    label: '10',
                                  ),
                                  RadioButtonWidget(
                                    value: true,
                                    groupValue: false,
                                    onChanged: (value) {},
                                    label: '25',
                                  ),
                                  RadioButtonWidget(
                                    value: true,
                                    groupValue: false,
                                    onChanged: (value) {},
                                    label: '35',
                                  ),
                                  RadioButtonWidget(
                                    value: true,
                                    groupValue: false,
                                    onChanged: (value) {},
                                    label: '50',
                                  ),
                                  RadioButtonWidget(
                                    value: true,
                                    groupValue: false,
                                    onChanged: (value) {},
                                    label: '60',
                                  ),
                                  RadioButtonWidget(
                                    value: true,
                                    groupValue: false,
                                    onChanged: (value) {},
                                    label: '70',
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: AppConstants.screenSize.height * 0.02,
                              ),
                              GradientElevatedButton(
                                width: AppConstants.screenSize.width / 1.5,
                                borderRadius: BorderRadius.circular(10),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {}
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
                                onPressed: () async {},
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
