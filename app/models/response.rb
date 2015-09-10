# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  answer_choice_id :integer
#  user_id          :integer
#  created_at       :datetime
#  updated_at       :datetime


class Response < ActiveRecord::Base
  validates :answer_choice_id, uniqueness: { scope: :user_id }
  validates :answer_choice_id, :user_id, presence: true

  belongs_to :respondent, inverse_of: :responses,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id

  belongs_to :answer_choice,
    class_name: "AnswerChoice",
    foreign_key: :answer_choice_id,
    primary_key: :id

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    self.question.responses.where.not(id: self.id)
    # More verbose version:
    # self.question.responses.where(':id IS NULL OR responses.id != :id', { :id => self.id })
    # For comparison, this version doesn't work because it might
    # things to a null object:
    # self.question.responses.where('responses.id != ?', self.id)
  end
end
