class Parent < ApplicationRecord
  belongs_to :student
  has_one :user, as: :personable
  validates :full_name, presence: true
end
