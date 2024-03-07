import 'dart:js';

import 'package:animate_do/animate_do.dart';
import 'package:flurox/provider/custom_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final Widget child;
  const Home({
    super.key, 
    required this.child,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Expanded(child: child),
          Menu()
        
        ],

        
      ),
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MenuAnimation();
  }
}




class MenuAnimation extends StatefulWidget {
  const MenuAnimation({super.key});

  @override
  State<MenuAnimation> createState() => _MenuAnimationState();
}

class _MenuAnimationState extends State<MenuAnimation>
    with SingleTickerProviderStateMixin {
    late AnimationController _controller;
    bool _onOff=false;
    int _isHover=-1;
    List<String> item=[
      "Page 1",
      "Page 2",
      "Page 3",
      "Page 4",
    ];


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: const Duration(milliseconds: 600));
  _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  final _provider = Provider.of<MyCustomProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Align(
        alignment: Alignment.topLeft,
        
        child: MouseRegion(
          onEnter: (_) {
                 setState(() {
                 _onOff=true; 
                   
                 });
                  
                },
                onExit: (event) {
                  setState(() {
                    _onOff=false;
                  }
                  );
                },
          child: AnimatedContainer(
            duration:  const Duration(milliseconds: 150),
            width: _onOff? 130:100,
            height:_onOff? 200:30,
            color: Colors.grey[400],
            child: Stack(
             
              children: [
                Row(
                  mainAxisAlignment: _onOff? MainAxisAlignment.end :MainAxisAlignment.spaceAround,                
                  
                  children: [
                    const Text("Menu",style: TextStyle(fontSize: 20),),
                    AnimatedIcon(
                      icon: AnimatedIcons.close_menu, 
                      progress: _controller,
                        
                      ),
                      
                  ],
                ),
                      _onOff?
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: ListView.builder(
                         
                        itemCount:item.length,
                        itemBuilder: (context, index) =>  FadeInLeft(
                          delay: Duration(milliseconds: (1+index)*100),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8,right: 4,left: 4),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                onEnter: (_) {
                                  setState(() {
                                    _provider.controller.animateToPage(
                                      index, duration: const Duration(milliseconds: 200), 
                                      curve: Curves.bounceIn);
                                    
                                 _isHover=index;   
                                  });
                                } ,
                                onExit: (_) {
                                  setState(() {
                                    
                                  _isHover=-1;
                                  });
                                },
                                child: ClickMenu(
                                  isHover: _isHover,
                                   item: item,
                                   index: index
                                   )),
                            ))), 
                        
                        
                                              ),
                      ):const Spacer()
              ],
            ),
          ),
        ),
      ),
    );
      
  }
}

class ClickMenu extends StatelessWidget {
   ClickMenu({
    super.key,
    required int isHover,
    required this.item,
    required this.index
  }) : _isHover = isHover;
  final int index;
  final int _isHover;
  final List<String> item;

  @override
  Widget build(BuildContext context) {

  final _provider = Provider.of<MyCustomProvider>(context);
    return GestureDetector(
      onTap: () {
        _provider.controller.jumpToPage(index);
        
        
      },
      child: Container(
        alignment: Alignment.bottomRight,
        width: 200,
        color: _isHover==index?Colors.grey:Colors.transparent,
        child: Text(item[index],style: const TextStyle(fontSize: 18),)),
    );
  }
}


