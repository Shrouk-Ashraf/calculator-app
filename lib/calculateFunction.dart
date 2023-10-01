
int calculateFunction(List equation, List operators){
  int result =0;
  int index;
  if(equation[0]=='+'||equation[0]=='-'||equation[0]=='*'||equation[0]=='/'||equation[0]=='' ){
    return -1;
  }
  if(operators.contains('*') ){
    index = equation.indexOf('*');
    equation[index -1] = (int.parse(equation[index -1]) * int.parse(equation[index+1])).toString();
  }
  if(operators.contains('/') ){
    index = equation.indexOf('/');
    equation[index -1] = (int.parse(equation[index -1]) ~/ int.parse(equation[index+1])).toString();
  }
  if(operators.contains('+') ){
    index = equation.indexOf('+');
    equation[index -1] = (int.parse(equation[index -1]) + int.parse(equation[index+1])).toString();
  }
  if(operators.contains('-') ){
    index = equation.indexOf('-');
    equation[index -1] = (int.parse(equation[index -1]) - int.parse(equation[index+1])).toString();
  }
  result = int.parse(equation [index -1]);
  return result;
}