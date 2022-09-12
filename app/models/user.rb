class User < ApplicationRecord

  belongs_to :team, optional: true
  belongs_to :organization
  enum role: [:employee, :team_member, :team_leader, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :employee
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
 