# CALCULATOR
# prompt user for first number
# prompt user for second number
# prompt user to choose operator
# check input and handle potential errors (division by zero)
# convert input to floats
# perform operation
# convert result to integer if there is no decimal value
# output result

def msg_text(message)
  puts message
end

msg_text("=> Please enter the first number:")
num1 = gets.chomp

msg_text("=> Please enter the second number:")
num2 = gets.chomp

msg_text("=> Please choose the operation by entering the corresponding number:\n\t1 addition\n\t2 subtraction\n\t3 multiplication\n\t4 division")
operation = gets.chomp

if num2.to_f != 0                              

  if operation == "1"
    operator = "+"
    result = num1.to_f + num2.to_f
  elsif operation == "2"
    operator = "-"
    result = num1.to_f - num2.to_f
  elsif operation == "3"
    operator = "*"
    result = num1.to_f * num2.to_f
  elsif operation == "4"
    operator = "/"
    result = num1.to_f / num2.to_f
  end

  if result % 1 != 0
    msg_text("#{num1} #{operator} #{num2} = #{result}")
  else
    result = result.to_i
    msg_text("#{num1} #{operator} #{num2} = #{result}")
  end

else
  msg_text("You cannot divide by zero. Pleas restart the calculator and enter new numbers.")
end