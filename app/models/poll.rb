# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  title      :string
#  author_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Poll < ActiveRecord::Base
  validates :title, uniqueness: { scope: :author_id }, presence: true
  validates :author_id, presence: true

  belongs_to :author, inverse_of: :authored_polls,
    class_name: "User",
    foreign_key: :author_id,
    primary_key: :id

  has_many :questions,
    class_name: "Question",
    foreign_key: :poll_id,
    primary_key: :id
end
