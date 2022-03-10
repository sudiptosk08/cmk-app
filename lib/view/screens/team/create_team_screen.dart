import 'package:flutter/material.dart';
import 'package:flutter_app/view/global_widget/k_button.dart';
import 'package:flutter_app/view/global_widget/k_textfield.dart';
import 'package:flutter_app/view/screens/bottomNavigation/bottom_navigation_screen.dart';
import 'package:flutter_app/view/screens/member/add_members_screen.dart';
import 'package:flutter_app/view/style/k_color.dart';
import 'package:flutter_app/view/style/k_size.dart';
import 'package:flutter_app/view/style/k_textStyle.dart';
import 'package:velocity_x/velocity_x.dart';

class CreateTeamScreen extends StatefulWidget {
  const CreateTeamScreen({Key key}) : super(key: key);

  @override
  State<CreateTeamScreen> createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen> {
  String dropdownValue = 'Design Agency';

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: () async {
        return moveToLastScreen();
      },
      child: Scaffold(
        backgroundColor: KColor.white,
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: KSize.getWidth(context, 40)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: KSize.getHeight(context, 50)),
                  Center(
                      child: Image.asset('assets/images/logo.png',
                          height: KSize.getHeight(context, 74),
                          width: KSize.getWidth(context, 55),
                          fit: BoxFit.fill)),
                  SizedBox(height: KSize.getHeight(context, 100)),
                  Center(child: Text('Create Team', style: KTextStyle.headline6)),
                  SizedBox(height: KSize.getHeight(context, 50)),
    
                  /// Team Name
                  Text('Team Name', style: KTextStyle.caption),
                  SizedBox(height: KSize.getHeight(context, 20)),
                  const KTextField(hintText: 'Enter Team Name'),
                  SizedBox(height: KSize.getHeight(context, 35)),
    
                  /// Business Direction
                  Text('Business Direction', style: KTextStyle.caption),
                  SizedBox(height: KSize.getHeight(context, 20)),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton<String>(
                      underline: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(color: KColor.whiteSmoke,height: 0.5,),
                      ),
                      icon: Image.asset('assets/images/down.png',
                          height: KSize.getHeight(context, 10),
                          width: KSize.getWidth(context, 12),
                          fit: BoxFit.cover),
                      focusColor: Colors.white,
                      isExpanded: true,
                      value: dropdownValue,
                      style: const TextStyle(color: Colors.white),
                      items: <String>[
                        'Design Agency',
                        'Align Team',
                        'Gap Analysis',
                        'Market Research',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: KTextStyle.bodyText
                                  .copyWith(color: KColor.deepBlue)),
                        );
                      }).toList(),
                      onChanged: (String value) {
                        setState(() {
                          dropdownValue = value;
                        });
                      },
                    ),
                  ),
    
                  SizedBox(height: KSize.getHeight(context, 35)),
    
                  /// How many People
                  Text('How many people in your team?', style: KTextStyle.caption),
                  SizedBox(height: KSize.getHeight(context, 20)),
    
                  /// Category List
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      runSpacing: 14,
                      spacing: 15,
                      children: [
                        _generateItem(75,36,'Only Me',0),
                        _generateItem(46,36,'1-5',1),
                        _generateItem(54,36,'5-10',2),
                        _generateItem(58,36,'10-15',3),
                        _generateItem(61,36,'15-20',4),
                        _generateItem(64,36,'20-25',5),
                        _generateItem(64,36,'25-30',6),
                      ]
                    ),
                  ),
    
                  SizedBox(height: KSize.getHeight(context, 60)),
    
                  ///  Next Button
    
                   KButton(buttonText: 'Next',onPressed: (){
                    context.nextPage(const AddMembersScreen());
                  },),
    
                  SizedBox(height: KSize.getHeight(context, 62)),
    
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

int selectedIndex=0;
  void changeIndex(int index){
    selectedIndex=index;
  }

  Widget _generateItem(double width, double height,String text,int index) {
    return GestureDetector(
      onTap: (){
        setState(() {
          changeIndex(index);
        });
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: selectedIndex==index?KColor.primary:KColor.transparent,
          borderRadius: BorderRadius.circular(15)
        ),
        child:  Center(
          child:  Text(text, style: KTextStyle.caption.copyWith(color:selectedIndex==index?KColor.white: KColor.deepBlue)),
        ),
      ),
    );
  }

Future<bool> moveToLastScreen() {
    context.nextReplacementPage(BottomNavigationScreen());
  }


}
