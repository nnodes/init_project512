class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: [:basic, :admin]

  def admin?
    role == 'admin'
  end

  def active_for_authentication?
    super && self.active
  end

  def ability
    @ability ||= Ability.new(self, 'Admin')
  end
end
