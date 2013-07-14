require 'spec_helper_lite'
needs 'models'
require 'expert_questioning'


describe ExpertQuestioning do

  it 'initializes with a questioner and a question' do
    questioner = Object.new
    question = 'what?'
    lambda {
      described_class.new(questioner, question)

    }.should_not raise_error
  end


  it 'error without a questioner and question' do
    lambda { described_class.new }.should
    raise_error(ArgumentError, %r{0 for 2})
  end


  context 'when starting the questioning' do
    it 'assigns as available expert to the question'
    it 'notifies the questioner that the answer is queued'
    it 'notifies the assigned expert of the question'
  end

  context 'when finishing the questioning' do
    it 'answer the question'
    it 'notifies the questioner of the answer'
  end
end