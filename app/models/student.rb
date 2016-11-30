class Student < ApplicationRecord
  belongs_to :teacher
  has_many :parents
  has_many :grades
  has_one :user, as: :personable
end
