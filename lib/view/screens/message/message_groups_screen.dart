import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_widget/k_appbar.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class MessageGroupScreen extends StatefulWidget {
  const MessageGroupScreen({Key key}) : super(key: key);

  @override
  State<MessageGroupScreen> createState() => _MessageGroupScreenState();
}

class _MessageGroupScreenState extends State<MessageGroupScreen> {
  TextEditingController userNameController = TextEditingController();
  final bool isTyping = false;

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    userNameController.dispose();
    super.dispose();
  }

  final List<String> imageList = [
    'assets/images/avatar1.png',
    'assets/images/avatar2.png',
    'assets/images/avatar3.png',
    'assets/images/avatar4.png',
    'assets/images/avatar5.png',
    'assets/images/avatar6.png',
  ];
  final List<String> nameList = [
    'Saim Ahmed',
    'Avatar Aljl',
    'Sudipto Dasd',
    'NOyon',
    'Najmul Chy',
    'Bangla',
  ];
  var selecteIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.white,
      appBar: KAppBar(
        onPressed: () {
          Navigator.pop(context);
        },
        isCustomLeading: true,
        customTitle: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              Transform.translate(
                offset: const Offset(-15, 0),
                child: Text(
                  'Team Align',
                  style: KTextStyle.bodyText,
                ),
              ),
              const Spacer(),
              Transform.translate(
                offset: const Offset(0, 0),
                child: Image.asset('assets/images/ellipse1.png',
                    height: KSize.getHeight(context, 36),
                    width: KSize.getWidth(context, 36),
                    fit: BoxFit.contain),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.screenHeight - KSize.getHeight(context, 100),
          child: Column(
            children: [
              SizedBox(height: KSize.getHeight(context, 40)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: KSize.getWidth(context, 24)),
                child: Center(
                    child: Text('Today at 10.35', style: KTextStyle.caption)),
              ),
              SizedBox(height: KSize.getHeight(context, 30)),

              /// Hello,where r u // Time
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: KSize.getWidth(context, 24)),
                child: Row(
                  children: [
                    Image.asset('assets/images/avatar5.png',
                        height: KSize.getHeight(context, 48),
                        width: KSize.getWidth(context, 48),
                        fit: BoxFit.contain),
                    SizedBox(width: KSize.getWidth(context, 15)),
                    Container(
                      height: KSize.getHeight(context, 48),
                      width: KSize.getWidth(context, 196),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: KColor.whiteSmoke2,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('Hello,where are you?',
                          style: KTextStyle.bodyText2
                              .copyWith(fontSize: 15, color: KColor.black)),
                    )
                  ],
                ),
              ),

              const Spacer(),

              if (userNameController.text == '@')

                /// card
                Material(
                  elevation: 15,
                  child: Container(
                      width: KSize.getWidth(context, 320),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          children: List.generate(
                              5,
                              (index) => InkWell(
                                    onTap: () {
                                      setState(() {
                                        selecteIndex = index;
                                      });
                                    },
                                    child: Member(
                                      selectedColor: selecteIndex == index
                                          ? KColor.skyblue.withOpacity(0.1)
                                          : KColor.white,
                                      imagePath: imageList[index],
                                      name: nameList[index],
                                    ),
                                  )),
                        ),
                      )),
                ),

              /// SMS SEND TEXTFIELD

              Container(
                height: KSize.getHeight(context, 62),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: KColor.grey.withOpacity(0.5),
                      offset: const Offset(0.0, 1.0), //(x,y)
                      blurRadius: 5.0,
                    ),
                  ],
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30.0)),
                  color: Colors.white,
                ),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      value == '@';
                      userNameController.text == value;
                    });
                  },
                  controller: userNameController,
                  scrollPadding: const EdgeInsets.all(20.0),
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Type your message here...',
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                        left: KSize.getWidth(context, 24),
                        right: KSize.getWidth(context, 14),
                        top: KSize.getHeight(context, 16),
                        bottom: KSize.getHeight(context, 22),
                      ),
                      child: Image.asset('assets/images/Icon.png'),
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(
                        left: KSize.getWidth(context, 24),
                        right: KSize.getWidth(context, 23),
                        top: KSize.getHeight(context, 9),
                        bottom: KSize.getHeight(context, 9),
                      ),
                      child: Image.asset('assets/images/sendButton.png'),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 20),
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Member extends StatelessWidget {
  String imagePath;
  String name;
  Color selectedColor;
  GestureTapCallback ontap;
  Member({
    Key key,
    this.imagePath,
    this.name,
    this.selectedColor,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            alignment: Alignment.center,
            width: 260,
            height: 55,
            decoration: BoxDecoration(
                color: selectedColor, borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(imagePath),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    name,
                    style: KTextStyle.bodyText,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
