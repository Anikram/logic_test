require_relative 'lib/test.rb'

test = Test.load_test_from_file("data/logic_test.yml")

test.start_test

puts test.print_result
