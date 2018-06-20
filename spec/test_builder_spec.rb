require 'rspec'
require_relative '../test_builder.rb'

describe '#load_test_from_file' do

  before(:all) {
    @test = TestBuilder.load_test_from_file("path")
  }

  it 'should return an test hash' do
    expect(@test).to be_a(Hash)
  end

  it 'should grant access to questions' do
    expect(@test[1]).to be_a(Question)
    expect(@test[1].read_question).to include "Некоторые улитки являются горами. Все горы любят кошек. Следовательно, все улитки любят кошек"
  end
end