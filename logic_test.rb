require_relative 'lib/Question.rb'
require_relative 'lib/test_builder.rb'

test = TestBuilder.load_test_from_file("data/logic_test.yml")

12.times do |i|
  i += 1 #компенсатор индекса ( 0 -> 1 )

  puts "#{i}. #{test[i].read_question}"
  puts 'Ваш ответ:'

  input = test[i].get_user_input #Получение ввода и его валидация

  if test[i].check(input) #проверка правильности вопроса
    test[:score] += 1
  end
end

puts TestBuilder.get_the_result(test) #вывод результатов
