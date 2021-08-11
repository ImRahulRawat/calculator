import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()=>runApp(myApp());

class myApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Calculator',
     theme: ThemeData(
       primarySwatch: Colors.red,
     ),
      home: Myhomepage(),
    );
  }
}

class Myhomepage extends StatefulWidget{
  @override
 _Myhomepage createState() => _Myhomepage();
}

class _Myhomepage extends State<Myhomepage>{

  late int firstnum;
  late int secondnum;
  String texttodisplay="";
  late String res;
  late String operatorperform;
void btnclicked(String btnvl){
  if(btnvl=="C"){
    texttodisplay="";
    firstnum=0;
    secondnum=0;
    res="";
  }
  else if(btnvl=="+" || btnvl=="-" || btnvl=="*" || btnvl=="/"){
    firstnum=int.parse(texttodisplay);
    res="";
    operatorperform=btnvl;
  }
else if(btnvl =="="){
  secondnum=int.parse(texttodisplay);
  if(operatorperform=="+"){
    res=(firstnum + secondnum).toString();
  }
  if(operatorperform=="-"){
    res=(firstnum-secondnum).toString();
  }
  if(operatorperform=="*"){
    res=(firstnum*secondnum).toString();
  }
  if(operatorperform=="/"){
    res=(firstnum/secondnum).toString();
  }
  }
else{
   res=int.parse(texttodisplay+btnvl).toString();
  }

setState(() {
  texttodisplay=res;
});
}

  Widget custombutton(String btnvl){
    return Expanded(
        child:OutlineButton(
          padding: EdgeInsets.all(25.0),
          onPressed:() => btnclicked(btnvl),
          child: Text('$btnvl',
          style: TextStyle(
              fontSize: 25.0,
          )
          ,),
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               Expanded(
                   child: Container(
                     padding: EdgeInsets.all(10.0),
                     alignment: Alignment.bottomRight,
                 child: Text(
                     "$texttodisplay",style: TextStyle(
                   fontSize: 25.0,fontWeight: FontWeight.w600,
                 ),
                 ),
               )
               ),
               Row(
                 children: [
                   custombutton("9"),
                   custombutton("8"),
                   custombutton("7"),
                   custombutton("+"),
                 ],
               ),
               Row(
                 children: [
                   custombutton("6"),
                   custombutton("5"),
                   custombutton("4"),
                   custombutton("-"),
                 ],
               ),
               Row(
                 children: [
                   custombutton("3"),
                   custombutton("2"),
                   custombutton("1"),
                   custombutton("*"),
                 ],
               ),
               Row(
                 children: [
                   custombutton("C"),
                   custombutton("0"),
                   custombutton("="),
                   custombutton("/"),
                 ],
               ),
             ],
           ),
      ),
    );
  }

}