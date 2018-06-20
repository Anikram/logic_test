class Question
  def initialize(question,right_answer,answers)
    @question = question
    @answers = answers
    @right_answer = right_answer
  end

  def check(answer)

  end

  def read_question
    @question + @answers.join("\n")
  end

  def get_user_input
    user_answer = nil

    until user_answer do
      user_input = STDIN.gets.chomp
      user_input.split(",")
      user_answer = validate_answer(user_input)
      puts "Введите ответы, которые считаете правильными через запятую:" unless user_answer
    end

    user_answer
  end

  def get_answer_pointers
    answers_pointers = []

    @answers.each do |item|
      answers_pointers << item.to_i
    end

    answers_pointers
  end

  def validate_answer(input)
    answers_pointers = get_answer_pointers
    input_pointers = []

    begin
      input.each do |i|
        input_pointers << i.to_i
      end
    rescue
      input_pointers << input.to_i
    end

    input_pointers.each do |pointer|
      unless answers_pointers.include?(pointer)
        return nil
      end
    end

    input
  end
end

