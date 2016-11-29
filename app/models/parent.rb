class Parent < ApplicationRecord
  belongs_to :student
  has_one :user, as: :personable
end
