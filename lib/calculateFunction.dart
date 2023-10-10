
int calculateFunction(List equation, List operators){
  int result;
  if(equation[0]=='+'||equation[0]=='-'||equation[0]=='*'||equation[0]=='/'||equation[0]=='' ){
    return null;
  }

  while(operators.length >0){
    if(operators.contains('*') ){
      equation = executeHigherOrderOperation('*', equation,result);
      operators.remove('*');
    }
    else if(operators.contains('/') ){
      equation = executeHigherOrderOperation('/', equation,result);
      operators.remove('/');
    }
    else if(operators.contains('+')){
      equation = executeLowerOrderOperation('+',equation,result);
      operators.remove('+');
    }
    else if(operators.contains('-')){
      equation = executeLowerOrderOperation('-',equation,result);
      operators.remove('-');
    }
  }

  if(equation.length ==1){
    result = int.parse(equation[0]);
  }
  return result;
}

List executeHigherOrderOperation(String operator,List equation,int result){
  int indexOfOperator = equation.indexOf(operator);
  switch(operator){
    case '*':
      result = int.parse(equation[indexOfOperator-1]) * int.parse(equation[indexOfOperator+1]);
      break;
    case '/':
      result = int.parse(equation[indexOfOperator-1]) ~/ int.parse(equation[indexOfOperator+1]);
      break;
  }
  equation.removeRange(indexOfOperator, indexOfOperator+2);
  equation[indexOfOperator-1] = result.toString();
  return equation;
}

List executeLowerOrderOperation(String operator,List equation,int result){
  int indexOfOperator = equation.indexOf(operator);
  switch(operator){
    case '+':
      result = int.parse(equation[indexOfOperator-1]) + int.parse(equation[indexOfOperator+1]);
      break;
    case '-':
      result = int.parse(equation[indexOfOperator-1]) - int.parse(equation[indexOfOperator+1]);
      break;
  }
  equation.removeRange(indexOfOperator, indexOfOperator+2);
  equation[indexOfOperator-1] = result.toString();
  return equation;
}