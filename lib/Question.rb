class Question
  def initialize(question,right_answer,answers)
    @question = question
    @answers = answers
    @right_answer = right_answer
  end

  def check(answer) #проверка основного правила
    right_answers_pointers = convert_to_array_of_pointers(@right_answer)
    answer = convert_to_array_of_pointers(answer)

    answer.each do |pointer|
      unless right_answers_pointers.include?(pointer)
        return nil
      end
    end

  end

  def read_question # вернуть текст вопроса
    @question + @answers.join("\n")
  end

  private #служебные методы

    def convert_to_array_of_pointers(item) # преобразование любового массива ответов в массив с номерами ответов
      result = []

      begin
        item.each do |i|
          result << i.to_i
        end
      rescue NoMethodError
        result << item.to_i
      end

      result
    end

  def validate_answer(input) # валидация - ответ должен быть из предложенных вариантов ответов
    answers_pointers = convert_to_array_of_pointers(@answers)

    input_pointers = convert_to_array_of_pointers(input)

    input_pointers.each do |pointer|
      unless answers_pointers.include?(pointer)
        return nil
      end
    end

    input
  end

  def get_user_input # получения информации от пользователя
    user_answer = nil

    until user_answer do
      user_input = STDIN.gets.chomp
      user_input.split(",")
      user_answer = validate_answer(user_input)
      puts "Введите ответы, которые считаете правильными через запятую:" unless user_answer
    end

    user_answer
  end
end

