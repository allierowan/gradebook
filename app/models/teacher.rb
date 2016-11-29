class Teacher < ApplicationRecord
  has_many :students
  has_one :user, as: :personable
end
