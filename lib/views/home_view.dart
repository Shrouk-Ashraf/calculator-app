import 'package:flutter/material.dart';

import '../model/calculate_function.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  String s = "";

  List<Map> list = [
    {
      "list": [9,8,7,'+']
    },
    {
      "list": [6,5,4,'-']
    },
    {
      "list":[3,2,1,'/']
    },
    {
      "list": [0,'.',"+/-","*"]
    },
    {
      "list": ["clr","del","%", "="]
    }
  ];
  List<String> operators=[];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.calculate_rounded),
            SizedBox(
              width: 10,
            ),
            Text(
              "Calculator App",
            )
          ],
        ),
        titleSpacing: 10,
      ),
      body:  Container(
        child: Column(
          children:[
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 100,
              child: FittedBox(
                fit:BoxFit.contain,
                child: Text(s,
                  style: const TextStyle(fontSize: 45,),
                ),
                ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for(int row =0; row <list.length; row++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          for (int column = 0; column <4 ; column ++)
                            Column(
                              children: [
                                FloatingActionButton(
                                  backgroundColor: Colors.blue,
                                  child: Text(list[row]['list'][column].toString(),
                                    style: const TextStyle(
                                        fontSize: 20
                                    ),),
                                  onPressed: () {
                                    setState(() {
                                      whichButton(list[row]['list'][column], row, column);
                                    });
                                  },
                                ),
                              ],
                            )
                        ],
                      )
                  ],
                ),
              ),
            )

          ],
        ),
      )


    );
  }

  void whichButton(button, int row, int column) {
    switch(button){
      case "+":
        s+= ' + ';
        operators.add('+');
        break;
      case '-':
        s+= ' - ';
        operators.add('-');
        break;
      case '*':
        s+= ' * ';
        operators.add('*');
        break;
      case '/':
        s += ' / ';
        operators.add('/');
        break;
      case '%':
        s += ' % ';
        operators.add('%');
        break;
      case '+/-':
        s += '-';
        break;
      case 'del':
        s = s.substring(0, s.length -1);
        break;
      case 'clr':
        s = "";
        operators.clear();
        break;
      case '=':
        List equation = s.split(" ");
        double result =double.parse(calculateFunction(equation,operators).toStringAsFixed(1));
        if(result != -1000) {
          s = result.toString();
        }
        operators.clear();
        break;
      default:
        s += list[row]['list'][column].toString();
    }
  }
}
