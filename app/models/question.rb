class Question < ApplicationRecord
  belongs_to :category
  has_many :game_questions
  has_many :games, through: :game_questions

  def answers
    # this is a large regex parser from the seed
    @answer_choices = self.incorrect_answers.scan(/\b[a-zA-Z0-9]+[ ]?[a-zA-Z]*[ ]?[a-zA-Z]*[ ]?[a-zA-Z]*[ ]?[a-zA-Z]*[ ]?[a-zA-Z]*/)
    @answer_choices.push(self.correct_answer).shuffle
  end
end
