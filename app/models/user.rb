class User < ApplicationRecord
  has_many :pages
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: { basic: 0, admin: 1 }

  def active_for_authentication?
    super && self.active
  end

  def ability
    @ability ||= Ability.new(self, admin? ? 'Admin' : nil)
  end
end
