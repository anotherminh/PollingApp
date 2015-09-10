# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  user_name  :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  validates :user_name, uniqueness: true, presence: true
  
  has_many :authored_polls, inverse_of: :author,
    class_name: "Poll",
    foreign_key: :author_id,
    primary_key: :id

  has_many :responses, inverse_of: :respondent,
    class_name: "Response",
    foreign_key: :user_id,
    primary_key: :id

end
