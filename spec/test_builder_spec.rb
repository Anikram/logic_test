require 'rspec'
require_relative '../lib/test_builder.rb'

describe '#load_test_from_file' do

  before(:all) {
    @test = TestBuilder.load_test_from_file("data/logic_test.yml")
  }

  it 'should return an test hash' do
    expect(@test).to be_a(Hash)
  end

  it 'should grant access to questions' do
    expect(@test[1].read_question).to eq"Некоторые улитки являются горами. Все горы любят кошек. Следовательно, все улитки любят кошек\n1) правильно\n2) не правильно"
  end
end