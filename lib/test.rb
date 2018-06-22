require_relative 'question'
require 'yaml'

class Test

  attr_accessor :test

  def self.load_test_from_file(path)

    data = YAML.load(File.read(path)) #YAML парсинг

    questions = data["questions"] #парсинг файла по категориям
    answers = data["answers"]
    right_answers = data["right_answers"]
    results = data["results"]
    introduction = data["introduction"]
    array_of_questions = []


    questions.count.times do |i| #создаем фопросы для теста
      i = i+1
      array_of_questions << Question.new(questions[i], right_answers[i], answers[i])
    end

    Test.new(array_of_questions, results, introduction, right_answers) # возвращаем собранный Хеш со всеми данными для теста
  end

  def initialize(questions, results, intro, right_answers)
    @test = {  questions: questions,
              results: results,
              introduction: intro,
              right_answers: right_answers,
              current_question: 0,
              score: 0
    }
  end

  def print_result
    "Ваши реузльтаты:\n #{calculate_result}"
  end

  def calculate_result
    if test[:score] > 0 && test[:score] <= 2
      test[:results]["bad"]
    elsif test[:score] <= 6
      test[:results]["normal"]
    elsif test[:score] <= 10
      test[:results]["good"]
    else
      test[:results]["excellent"]
    end
  end

  def ask_question(question)
    puts question.read_question

    answer = get_user_input

    unless question.validate_answer(answer)
      update_score if question.evaluate_answer(answer)
      puts "Введите ответы, которые считаете правильными через запятую:"
      sleep 3
    end

    clear_screen
  end

  def question_answered?(question)
    question.status == :answered
  end

  def start_test #основной цикл теста
    test[:questions].each do |question|
      until question_answered?(question)
        ask_question(question)
      end
    end

  end

  def get_user_input # получения информации от пользователя
    user_input = STDIN.gets.chomp
    user_input.split(",")
  end

  def update_score
    test[:score] += 1
  end

  def clear_screen
    Gem.win_platform? ? (system "cls") : (system "clear")
  end
end
