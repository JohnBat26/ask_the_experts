# Primary Actor: a regular user
# Goal: user gain information about specific finance question
# Supporting Actors: a financial expert
# Preconditions: use is authenticated and authorized

class ExpertQuestioning

  def initialize(questioner, question_text)
    @questioner = questioner
    @question = initialize_question(question_text)
    @expert = available_expert
  end

  def initialize_question(text)
    Question.new(text: text)
  end

  def available_expert
    # TODO: Expert selection requires consideration
    # Expert.first_available
  end


  def start
    # 1. An available expert is assigned to the question.
    #  1a. No expert is available.
    #  1a.1 The user is notified that no expert is available.
    # 2. A notification is sent to the user the her question will be answered soon.
    # 3. The expert is notified of the unanswered question.
  end

  def finish
    # 4. The expert submits an answer to the question.
    #  4a. The expert determines that the question has already been answered.
    #  4a.1 The expert assigns the question to an existing answer.
    # 5. The user is notified of the answer to her question.
  end

end


