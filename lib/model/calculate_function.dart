

double calculateFunction(List equation, List operators){
  double result = 0.0;
  if(equation[0]=='+'||equation[0]=='-'||equation[0]=='*'||equation[0]=='/'||equation[0]=='' ){
    return -1000;
  }

  while(operators.length >0){
    if(operators.contains('*') ){
      equation = executeHigherOrderOperation(operator: '*',equation: equation,result:result!);
      operators.remove('*');
    }
    else if(operators.contains('/') ){
      equation = executeHigherOrderOperation(operator: '/',equation: equation,result :result!);
      operators.remove('/');
    }
    else if(operators.contains('%') ){
      equation = executeHigherOrderOperation(operator: '%',equation: equation,result :result!);
      operators.remove('%');
    }
    else if(operators.contains('+')){
      equation = executeLowerOrderOperation('+',equation,result!);
      operators.remove('+');
    }
    else if(operators.contains('-')){
      equation = executeLowerOrderOperation('-',equation,result!);
      operators.remove('-');
    }
  }

  if(equation.length ==1){
    result = double.parse(equation[0]);
  }
  return result!;
}

List executeHigherOrderOperation({required String operator,required List equation,required double result}){
  int indexOfOperator = equation.indexOf(operator);
  switch(operator){
    case '*':
      result = double.parse(equation[indexOfOperator-1]) * double.parse(equation[indexOfOperator+1]);
      break;
    case '/':
      result = double.parse(equation[indexOfOperator-1]) / double.parse(equation[indexOfOperator+1]);
      break;
    case '%':
      result = double.parse(equation[indexOfOperator-1]) % double.parse(equation[indexOfOperator+1]);
      break;
  }
  equation.removeRange(indexOfOperator, indexOfOperator+2);
  equation[indexOfOperator-1] = result.toString();
  return equation;
}

List executeLowerOrderOperation(String operator,List equation,double result){
  int indexOfOperator = equation.indexOf(operator);
  switch(operator){
    case '+':
      result = double.parse(equation[indexOfOperator-1]) + double.parse(equation[indexOfOperator+1]);
      break;
    case '-':
      result = double.parse(equation[indexOfOperator-1]) - double.parse(equation[indexOfOperator+1]);
      break;
  }
  equation.removeRange(indexOfOperator, indexOfOperator+2);
  equation[indexOfOperator-1] = result.toString();
  return equation;
}