class Question
  def initialize(question,right_answer,answers)
    @question = question
    @answers = answers
    @right_answer = right_answer
  end

  def check(answer)
    validate_answer(answer)
    return 1 if @right_answer =~ /answer/
  end

  def read_question
    @question + @answers.join("\n")
  end

  def get_answer_indexes
    answers_indexes = []

    @answers.each do |item|
      answers_indexes << item.to_i
    end

    answers_indexes
  end

  def validate_answer(answer)
    answers_indexes = get_answer_indexes
    answer if answers_indexes.include?(answer)
  end
end

