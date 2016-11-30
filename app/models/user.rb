class User < ApplicationRecord
  belongs_to :personable, polymorphic: true
  validates :email, uniqueness: true

  def password=(unhashed_password)
    @_password = BCrypt::Password.create(unhashed_password)
    self.password_hash = @_password
  end

  def password
    @_password ||= BCrypt::Password.new(password_hash)
  end

  def teacher?
    self.personable_type == "Teacher"
  end
end
