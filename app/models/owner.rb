class Owner < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/,
      message: 'must be a valid email address' }

  has_many :buildings, inverse_of: :owner, dependent: :nullify

end
