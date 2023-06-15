class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_validation :set_default_is_admin

  enum role: [:teacher, :pupil, :relative]

  private

  def set_default_is_admin
    self.is_admin = false if new_record? && is_admin.nil?
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
