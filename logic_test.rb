require_relative 'Question.rb'
require_relative 'test_builder.rb'

test = TestBuilder.load_test_from_file("data/logic_test.yml")


12.times do |i|
  i += 1
  puts test[i].read_question
  puts "Ваш ответ:"

  input = test[i].get_user_input

  if test[i].check(input)
    test[:scores] += 1
  end
end

TestBuilder.get_the_result(test)











