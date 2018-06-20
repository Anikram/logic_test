require_relative 'Question'
require 'yaml'

class TestBuilder

  attr_accessor :test_instance

  def self.load_test_from_file(path)

    data = YAML.load(File.read(path))

    questions = data["questions"]
    answers = data["answers"]
    right_answers = data["right_answers"]
    results = data["results"]
    introduction = data["introduction"]
    test_instance = {}

    questions.count.times do |i|
      i = i+1
      test_instance[i] = Question.new(questions[i], right_answers[i], answers[i])
    end

    test_instance[:results] = results
    test_instance[:introduction] = introduction
    test_instance[:score] = 0

    test_instance
  end

  def self.get_the_result(test)
  test_result = "Ваши реузльтаты:\n"

  scores = test[:score]
  results = test[:results]

  if scores > 0 && scores <= 2
    test_result << results["bad"]
  elsif scores <= 6
    test_result << results["normal"]
  elsif scores <= 10
    test_result << results["good"]
  else
    test_result << results["excelent"]
  end
  puts test_result
  end
end
#test = TestBuilder.load_test_from_file("data/logic_test.yml")
