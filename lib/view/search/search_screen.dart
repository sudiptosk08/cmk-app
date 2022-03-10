import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_widget/calendar_dialog_screen.dart';
import 'package:flutter_app/view/global_widget/k_button.dart';
import 'package:flutter_app/view/screens/bottomNavigation/bottom_navigation_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectedIndex = 0;
  int primaryIndex = 0;

  void changePrimaryIndex(int index) {
    primaryIndex = index;
  }

  void changeSelectedIndex(int index) {
    selectedIndex = index;
  }

  int secondaryIndex = 0;

  void changeIndex(int index) {
    secondaryIndex = index;
  }

  
  final List<String> titleList = [
    'IOS NATIVE',
    'Web App',
    'Website',
    'Project',
  ];
  final List<String> subTitleList = [
    'E-Commerce App Ui',
    'Banking Web App Ux',
    'Food Landing Page....',
    'Behance Project'
  ];

  final List<String> imageList = [
    'assets/images/Image.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
    'assets/images/image4.png',
  ];

  final List<String> reporterImageList = [
    'assets/images/photo.png',
    'assets/images/avatar5.png',
    'assets/images/avatar3.png',
  ];

  final List<String> reporterNameList = [
    'Sami Ahmed',
    'Tony Stark',
    'Sayem Ahmed'
  ];

  List<String> notes = [];

  List<String> search(String key) {
    return titleList
        .where(
            (itemName) => itemName.toLowerCase().startsWith(key.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return moveToLastScreen();
      },
      child: Scaffold(
        backgroundColor: KColor.white,
        body: SafeArea(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 24)),
            child: Column(
              children: [
                SizedBox(height: KSize.getHeight(context, 30)),

                /// TextField
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: KSize.getHeight(context, 48),
                        width: KSize.getHeight(context, 253),
                        decoration: BoxDecoration(
                            color: KColor.aliceBlue,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: TextField(
                            onChanged: (key) {
                              setState(() {
                                if (key.isEmpty) {
                                  notes = [];
                                } else {
                                  notes = search(key);
                                }
                              });
                            },
                            decoration: InputDecoration(
                                hintText: 'Search...',
                                prefixIcon: Padding(
                                  padding: EdgeInsets.only(
                                    top: KSize.getHeight(context, 14),
                                    bottom: KSize.getHeight(context, 14),
                                    left: KSize.getHeight(context, 18),
                                    right: KSize.getHeight(context, 14),
                                  ),
                                  child: Image.asset(
                                    'assets/images/search.png',
                                    height: KSize.getHeight(context, 20),
                                    width: KSize.getWidth(context, 20),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(
                                    top: KSize.getHeight(context, 14),
                                    bottom: KSize.getHeight(context, 14),
                                    left: KSize.getHeight(context, 18),
                                    right: KSize.getHeight(context, 14),
                                  ),
                                  child: Image.asset(
                                    'assets/images/close.png',
                                    height: KSize.getHeight(context, 24),
                                    width: KSize.getWidth(context, 24),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 12)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: KSize.getWidth(context, 23)),
                    //const Spacer(),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Cancel',
                        style: KTextStyle.button,
                      ),
                    )
                  ],
                ),
                SizedBox(height: KSize.getHeight(context, 20)),

                /// Projects/ Events  Selection
                Row(
                  children: [
                    InkWell(
                      hoverColor: KColor.transparent,
                      splashColor: KColor.transparent,
                      highlightColor: KColor.transparent,
                      onTap: () {
                        setState(() {
                          changeSelectedIndex(0);
                        });
                      },
                      child: Container(
                        height: KSize.getHeight(context, 32),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: selectedIndex == 0
                              ? KColor.primary
                              : KColor.transparent,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: KSize.getWidth(context, 16),
                          ),
                          child: Text(
                            'Projects',
                            textAlign: TextAlign.center,
                            style: KTextStyle.button.copyWith(
                                color: selectedIndex == 0
                                    ? KColor.white
                                    : KColor.grey),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: KSize.getWidth(context, 19.5)),
                    InkWell(
                      hoverColor: KColor.transparent,
                      splashColor: KColor.transparent,
                      highlightColor: KColor.transparent,
                      onTap: () {
                        setState(() {
                          changeSelectedIndex(1);
                        });
                      },
                      child: Container(
                        height: KSize.getHeight(context, 32),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: selectedIndex == 1
                                ? KColor.primary
                                : KColor.transparent,
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: KSize.getWidth(context, 16),
                          ),
                          child: Text(
                            'Events',
                            style: KTextStyle.button.copyWith(
                                color: selectedIndex == 1
                                    ? KColor.white
                                    : KColor.grey),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),

                    /// bottom Sheet
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                builder: (BuildContext context, setState) {
                                  void changeIndex(int index) {
                                    setState(() {
                                      primaryIndex = index;
                                    });
                                  }

                                  return Container(
                                    height: KSize.getHeight(context, 604),
                                    decoration: const BoxDecoration(
                                        color: KColor.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(30.0),
                                            topRight: Radius.circular(30.0))),
                                    child: SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: KSize.getWidth(
                                                    context, 24)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                    height: KSize.getHeight(
                                                        context, 15)),
                                                Center(
                                                  child: Image.asset(
                                                    'assets/images/holder.png',
                                                    height: KSize.getHeight(
                                                        context, 4),
                                                    width: KSize.getWidth(
                                                        context, 54),
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),
                                                SizedBox(
                                                    height: KSize.getHeight(
                                                        context, 30)),
                                                Row(
                                                  children: [
                                                    const Spacer(),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return Dialog(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24)),
                                                                  child:
                                                                      const CalendarDialogScreen());
                                                            });
                                                      },
                                                      child: Image.asset(
                                                        'assets/images/calendar.png',
                                                        height: KSize.getHeight(
                                                            context, 20),
                                                        width: KSize.getWidth(
                                                            context, 18),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width: KSize.getWidth(
                                                            context, 20)),
                                                    Text(
                                                      'Select Time',
                                                      style: KTextStyle
                                                          .subTitle1
                                                          .copyWith(
                                                              color:
                                                                  KColor.black),
                                                    ),
                                                    const Spacer(),
                                                  ],
                                                ),
                                                SizedBox(
                                                    height: KSize.getHeight(
                                                        context, 40)),

                                                /// Task Type
                                                Text('Task Type',
                                                    style: KTextStyle.subTitle1
                                                        .copyWith(
                                                            color:
                                                                KColor.black)),
                                                SizedBox(
                                                    height: KSize.getHeight(
                                                        context, 15)),

                                                /// Task Type List
                                                Wrap(
                                                  direction: Axis.horizontal,
                                                  spacing: KSize.getWidth(
                                                      context, 15),
                                                  runSpacing: KSize.getHeight(
                                                      context, 20),
                                                  children: [
                                                    CategoryList(
                                                        index: 0,
                                                        categoryList: 'Design',
                                                        width: KSize.getWidth(
                                                            context, 91)),
                                                    CategoryList(
                                                        index: 1,
                                                        categoryList:
                                                            'Development',
                                                        width: KSize.getWidth(
                                                            context, 150)),
                                                    CategoryList(
                                                        index: 2,
                                                        categoryList: 'Testing',
                                                        width: KSize.getWidth(
                                                            context, 95)),
                                                    CategoryList(
                                                        index: 3,
                                                        categoryList:
                                                            'Marketing',
                                                        width: KSize.getWidth(
                                                            context, 120)),
                                                  ],
                                                ),
                                                SizedBox(
                                                    height: KSize.getHeight(
                                                        context, 40)),

                                                /// Reporter ,,, Search Image
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Reporter',
                                                      style: KTextStyle
                                                          .subTitle1
                                                          .copyWith(
                                                              color:
                                                                  KColor.black),
                                                    ),
                                                    Image.asset(
                                                      'assets/images/search.png',
                                                      height: KSize.getHeight(
                                                          context, 20),
                                                      width: KSize.getWidth(
                                                          context, 20),
                                                      fit: BoxFit.fill,
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                    height: KSize.getHeight(
                                                        context, 20)),

                                                /// Reporter List
                                                SizedBox(
                                                  height: KSize.getHeight(
                                                      context, 135),
                                                  child: ListView.builder(
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      itemCount:
                                                          reporterImageList
                                                              .length,
                                                      shrinkWrap: true,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return InkWell(
                                                          onTap: () {
                                                            changeIndex(index);
                                                          },
                                                          child: Padding(
                                                            padding: EdgeInsets.only(
                                                                bottom: KSize
                                                                    .getHeight(
                                                                        context,
                                                                        20)),
                                                            child: Row(
                                                              children: [
                                                                Image.asset(
                                                                  reporterImageList[
                                                                      index],
                                                                  height: KSize
                                                                      .getHeight(
                                                                          context,
                                                                          24),
                                                                  width: KSize
                                                                      .getWidth(
                                                                          context,
                                                                          24),
                                                                  fit: BoxFit
                                                                      .fill,
                                                                ),
                                                                SizedBox(
                                                                    width: KSize
                                                                        .getWidth(
                                                                            context,
                                                                            12)),
                                                                Text(
                                                                  reporterNameList[
                                                                      index],
                                                                  style: KTextStyle
                                                                      .bodyText
                                                                      .copyWith(
                                                                          color: primaryIndex == index
                                                                              ? KColor.black
                                                                              : KColor.grey),
                                                                ),
                                                                SizedBox(
                                                                    width: KSize
                                                                        .getWidth(
                                                                            context,
                                                                            12)),
                                                                if (primaryIndex ==
                                                                    index)
                                                                  Image.asset(
                                                                    'assets/images/selected.png',
                                                                    height: KSize
                                                                        .getHeight(
                                                                            context,
                                                                            20),
                                                                    width: KSize
                                                                        .getWidth(
                                                                            context,
                                                                            20),
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  )
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                ),

                                                SizedBox(
                                                    height: KSize.getHeight(
                                                        context, 60)),

                                                /// Button
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          KSize.getWidth(
                                                              context, 16)),
                                                  child: KButton(
                                                    buttonText: 'Search',
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                    height: KSize.getHeight(
                                                        context, 30)),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            });
                      },
                      child: Image.asset(
                        'assets/images/filter.png',
                        fit: BoxFit.fill,
                        height: KSize.getHeight(context, 25),
                        width: KSize.getWidth(context, 24),
                      ),
                    )
                  ],
                ),
                SizedBox(height: KSize.getHeight(context, 30)),
                Expanded(
                  child: ListView.builder(
                      itemCount: notes.length,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: KSize.getHeight(context, 20)),
                          child: Container(
                            height: KSize.getHeight(context, 141),
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      offset: Offset(-2, 1),
                                      color: KColor.snow,
                                      blurRadius: 10,
                                      spreadRadius: 10),
                                  BoxShadow(
                                    color: KColor.snow,
                                    blurRadius: 15.0,
                                    offset: Offset(10.0, 10.0),
                                  ),
                                ],
                                color: KColor.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              children: [
                                const Spacer(),

                                /// Image/ IOS NATIVE/ E COMMERCE APP UI
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: KSize.getWidth(context, 20)),
                                  child: SizedBox(
                                    height: KSize.getHeight(context, 60),
                                    child: Row(
                                      children: [
                                        /// Category Image List
                                        Image.asset(imageList[index],
                                            height:
                                                KSize.getHeight(context, 48),
                                            width: KSize.getWidth(context, 48),
                                            fit: BoxFit.contain),
                                        SizedBox(
                                            width: KSize.getWidth(context, 19)),
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(notes[index],
                                                  style: KTextStyle.bodyText2
                                                      .copyWith(
                                                          color: KColor.grey,
                                                          height: 1.8)),
                                              const Spacer(),
                                              Text(subTitleList[index],
                                                  style: KTextStyle.headline8
                                                      .copyWith(
                                                          fontSize: 18,
                                                          height: 1.1)),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),

                                SizedBox(height: KSize.getHeight(context, 30)),

                                /// Calendar  /  created May
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: KSize.getWidth(context, 20)),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/calendar.png',
                                        height: KSize.getHeight(context, 20),
                                        width: KSize.getWidth(context, 18),
                                        fit: BoxFit.fill,
                                        color: KColor.grey,
                                      ),
                                      SizedBox(
                                          width: KSize.getWidth(context, 9.98)),
                                      Text(
                                        'Created May 24,2021',
                                        style: KTextStyle.caption
                                            .copyWith(fontSize: 13),
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        height: KSize.getHeight(context, 24),
                                        width: KSize.getWidth(context, 87),
                                        child: Stack(
                                          children: [
                                            Image.asset(
                                                'assets/images/photo.png',
                                                height: KSize.getHeight(
                                                    context, 24),
                                                width:
                                                    KSize.getWidth(context, 24),
                                                fit: BoxFit.fill),
                                            Positioned(
                                                left: 17,
                                                child: Image.asset(
                                                    'assets/images/photo2.png',
                                                    height: KSize.getHeight(
                                                        context, 24),
                                                    width: KSize.getWidth(
                                                        context, 24),
                                                    fit: BoxFit.fill)),
                                            Positioned(
                                                left: 35,
                                                child: Image.asset(
                                                    'assets/images/photo3.png',
                                                    height: KSize.getHeight(
                                                        context, 24),
                                                    width: KSize.getWidth(
                                                        context, 24),
                                                    fit: BoxFit.fill)),
                                            Positioned(
                                                left: 52,
                                                child: Image.asset(
                                                    'assets/images/blue.png',
                                                    height: KSize.getHeight(
                                                        context, 24),
                                                    width: KSize.getWidth(
                                                        context, 24),
                                                    fit: BoxFit.fill)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> moveToLastScreen() {
    context.nextReplacementPage(BottomNavigationScreen());
  }
}

class CategoryList extends StatefulWidget {
  final String categoryList;
  final double width;
  final int index;

  const CategoryList({
    Key key,
    @required this.categoryList,
    this.index,
    this.width,
  }) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedIndex = 0;
  final List<int> _selectedItems = [];

  void changeIndex(int index) {
    selectedIndex = index;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_selectedItems.contains(widget.index)) {
          setState(() {
            _selectedItems.removeWhere((val) => val == widget.index);
          });
        } else {
          setState(() {
            _selectedItems.add(widget.index);
          });
        }
      },
      child: Column(
        children: [
          Container(
            height: KSize.getHeight(context, 35),
            width: widget.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: (_selectedItems.contains(widget.index))
                    ? KColor.primary
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(18)),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 10)),
              child: Text(
                widget.categoryList,
                style: KTextStyle.button.copyWith(
                    color: (_selectedItems.contains(widget.index))
                        ? KColor.white
                        : KColor.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
