library kf_drawer;

import 'package:flutter/material.dart';
import 'package:flutter_app/view/helper/bottom_navbar_visibility_notifier.dart';
import 'package:flutter_app/view/style/k_size.dart';

class KFDrawerController {
  KFDrawerController({this.items, @required KFDrawerContent initialPage}) {
    page = initialPage;
  }

  List<KFDrawerItem> items;
  Function close;
  Function open;
  KFDrawerContent page;
}

// ignore: must_be_immutable
class KFDrawerContent extends StatefulWidget {
  Function onMenuPressed;
  
  KFDrawerContent({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return null;
  }
}

// ignore: must_be_immutable
class KFDrawer extends StatefulWidget {
  KFDrawer({
    Key key,
    this.header,
    this.footer,
    this.items,
    this.controller,
    this.decoration,
    this.drawerWidth,
    this.minScale,
    this.borderRadius,
    this.shadowBorderRadius,
    this.shadowOffset,
    this.scrollable,
    this.menuPadding,
    this.disableContentTap,
    this.animationDuration,
  }) : super(key: key);

  Widget header;
  Widget footer;
  BoxDecoration decoration;
  List<KFDrawerItem> items;
  KFDrawerController controller;
  double drawerWidth;
  double minScale;
  double borderRadius;
  double shadowBorderRadius;
  double shadowOffset;
  bool scrollable;
  EdgeInsets menuPadding;
  bool disableContentTap;
  Duration animationDuration;

  @override
  _KFDrawerState createState() => _KFDrawerState();
}

class _KFDrawerState extends State<KFDrawer> with TickerProviderStateMixin {
  bool _menuOpened = false;
  bool _isDraggingMenu = false;

  double _drawerWidth = 0.66;
  double _minScale = 0.70;
  double _borderRadius = 32.0;
  double _shadowBorderRadius = 44.0;
  double _shadowOffset = 35.0;
  bool _scrollable = false;
  bool _disableContentTap = true;
  Duration _animationDuration = const Duration(milliseconds: 260);

  Animation<double> animation, scaleAnimation;
  Animation<BorderRadius> radiusAnimation;
  AnimationController animationController;

  _open() {
    animationController.forward();
    setState(() {
      _menuOpened = true;
    });
    appValueNotifier.hideBottomNavBar();
  }

  _close() {
    animationController.reverse();
    setState(() {
      _menuOpened = false;
    });
    appValueNotifier.showBottomNavBar();
  }

  _onMenuPressed() {
    _menuOpened ? _close() : _open();
  }

  _finishDrawerAnimation() {
    if (_isDraggingMenu) {
      var opened = false;
      setState(() {
        _isDraggingMenu = false;
      });
      if (animationController.value >= 0.4) {
        animationController.forward();
        opened = true;
      } else {
        animationController.reverse();
      }
      setState(() {
        _menuOpened = opened;
      });

      //appValueNotifier.hideBottomNavBar();
    }
  }

  List<KFDrawerItem> _getDrawerItems() {
    if (widget.controller.items != null) {
      return widget.controller.items.map((KFDrawerItem item) {
        if (item.page == null) return item;
        item.onPressed ??= () {
          widget.controller.page = item.page;
          widget.controller.close();
        };
        item.page.onMenuPressed = _onMenuPressed;
        return item;
      }).toList();
    }
    return widget.items;
  }

  @override
  void initState() {
    super.initState();
    if (widget.minScale != null) {
      _minScale = widget.minScale;
    }
    if (widget.borderRadius != null) {
      _borderRadius = widget.borderRadius;
    }
    if (widget.shadowOffset != null) {
      _shadowOffset = widget.shadowOffset;
    }
    if (widget.shadowBorderRadius != null) {
      _shadowBorderRadius = widget.shadowBorderRadius;
    }
    if (widget.drawerWidth != null) {
      _drawerWidth = widget.drawerWidth;
    }
    if (widget.scrollable != null) {
      _scrollable = widget.scrollable;
    }
    if (widget.disableContentTap != null) {
      _disableContentTap = widget.disableContentTap;
    }
    if (widget.animationDuration != null) {
      _animationDuration = widget.animationDuration;
    }
    animationController =
        AnimationController(duration: _animationDuration, vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController)
      ..addListener(() {
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
      });

    scaleAnimation =
        Tween<double>(begin: 1.0, end: _minScale).animate(animationController);
    radiusAnimation = BorderRadiusTween(
            begin: BorderRadius.circular(0.0),
            end: BorderRadius.circular(_borderRadius))
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.ease));
  }

  @override
  Widget build(BuildContext context) {
    widget.controller.page.onMenuPressed = _onMenuPressed;
    widget.controller.close = _close;
    widget.controller.open = _open;

    return Listener(
      onPointerDown: (PointerDownEvent event) {
        if (_disableContentTap) {
          if (_menuOpened &&
              event.position.dx / MediaQuery.of(context).size.width >=
                  _drawerWidth) {
            _close();
          } else {
            setState(() {
              _isDraggingMenu = (!_menuOpened && event.position.dx <= 8.0);
            });
          }
        } else {
          setState(() {
            _isDraggingMenu = (_menuOpened &&
                    event.position.dx / MediaQuery.of(context).size.width >=
                        _drawerWidth) ||
                (!_menuOpened && event.position.dx <= 8.0);
          });
        }
      },
      onPointerMove: (PointerMoveEvent event) {
        if (_isDraggingMenu) {
          animationController.value =
              event.position.dx / MediaQuery.of(context).size.width;
        }
      },
      onPointerUp: (PointerUpEvent event) {
        _finishDrawerAnimation();
      },
      onPointerCancel: (PointerCancelEvent event) {
        _finishDrawerAnimation();
      },
      child: Stack(
        children: <Widget>[
          _KFDrawer(
            padding: widget.menuPadding,
            scrollable: _scrollable,
            animationController: animationController,
            header: widget.header,
            footer: widget.footer,
            items: _getDrawerItems(),
            decoration: widget.decoration,
          ),
          Transform.scale(
            scale: scaleAnimation.value,
            child: Transform.translate(
              offset: Offset(
                  (MediaQuery.of(context).size.width * _drawerWidth) *
                      animation.value,
                  0.0),
              child: AbsorbPointer(
                absorbing: _menuOpened && _disableContentTap,
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 60.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(_shadowBorderRadius)),
                              child: Container(
                                decoration: const BoxDecoration(
                                  

                                ),
                                child: Image.asset(
                                  'assets/images/home2.png',
                                  height: 600,
                                  width: 190,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: animation.value * _shadowOffset),
                      child: ClipRRect(
                        borderRadius: radiusAnimation.value,
                        child: Container(
                          color: Colors.white,
                          child: widget.controller.page,
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
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

// ignore: must_be_immutable
class _KFDrawer extends StatefulWidget {
  _KFDrawer({
    this.animationController,
    this.header,
    this.footer,
    this.items,
    this.decoration,
    this.scrollable,
    this.padding,
  });

  Widget header;
  Widget footer;
  List<KFDrawerItem> items;
  BoxDecoration decoration;
  bool scrollable;
  EdgeInsets padding;

  Animation<double> animationController;

  @override
  __KFDrawerState createState() => __KFDrawerState();
}

class __KFDrawerState extends State<_KFDrawer> {
  var _padding = const EdgeInsets.symmetric(vertical: 100.0);

  Widget _getMenu() {
    if (widget.scrollable) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: widget.header,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.items,
          ),
          widget.footer,
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: widget.header,
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.items,
            ),
         
          widget.footer,
        ],
      );
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.padding != null) {
      _padding = widget.padding;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: widget.decoration,
      child: Padding(
        padding: _padding,
        child: _getMenu(),
      ),
    );
  }
}

// ignore: must_be_immutable
class KFDrawerItem extends StatelessWidget {
  KFDrawerItem({Key key, this.onPressed, this.text, this.icon})
      : super(key: key);

  KFDrawerItem.initWithPage(
      {Key key, this.onPressed, this.text, this.icon, this.alias, this.page})
      : super(key: key);

  Function onPressed;
  Widget text;
  Widget icon;

  String alias;
  KFDrawerContent page;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      left: KSize.getWidth(context, 30), right: 0.0),
                  child: icon,
                ),
                text,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
