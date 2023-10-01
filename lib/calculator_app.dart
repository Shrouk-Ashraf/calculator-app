import 'package:flutter/material.dart';
import 'calculateFunction.dart';
import 'data.dart';


class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String s = "";
  List<String> operators=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
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
      body: Container(
        color: Colors.grey.withOpacity(0.1),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(s,
                          style: TextStyle(fontSize: 30),
                            )
                          ],
              ),
            ),
            SizedBox(height: 20,),
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
                                        style: TextStyle(
                                          fontSize: 20
                                        ),),
                                  onPressed: () {
                                    setState(() {
                                      switch(list[row]['list'][column]){
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
                                        case 'del':
                                          s = '';
                                          break;
                                        case '=':
                                          List equation = s.split(" ");
                                          int result =calculateFunction(equation,operators);
                                          if(result != -1)
                                            s = result.toString();
                                          break;
                                        default:
                                          s += list[row]['list'][column].toString();
                                      }
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
      ),
    );
  }


}
