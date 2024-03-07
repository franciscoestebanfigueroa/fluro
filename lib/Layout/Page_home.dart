import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

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
    return GestureDetector(
      onTap: (){
        if(_onOff==true) {
          _controller.forward();
        _onOff= false;
        }
        else{
          _controller.reverse();
          _onOff=true;
        }
        setState(() {
          
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Align(
          alignment: Alignment.topLeft,
          
          child: AnimatedContainer(
            duration:  Duration(milliseconds: 10000),
            width: _onOff? 200:100,
            height:_onOff? 300:30,
            color: Colors.amber,
            child: Column(
             
              children: [
                Row(                
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Menu"),
                    Expanded(child: Container(
                      height: 0,
                      color: Colors.grey,)),
                    AnimatedIcon(
                      icon: AnimatedIcons.close_menu, 
                      progress: _controller,
                        
                      ),
                      Container(height: 20,),
                      
                      
                      
                  ],
                ),
                      !_onOff?
                      
                      FadeIn(
                        delay: Duration(seconds: 5),
                        child: Container(
                          color: Colors.red,
                          width: 190,
                          height: 190,
                          child: ListView.builder(
                           
                          itemCount:item.length,
                          itemBuilder: (context, index) =>  FadeInLeft(
                            delay: Duration(milliseconds: (1+index)*600),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(item[index]),
                              ))), 
                          
                          
                                                ),
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