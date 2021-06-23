class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,           presence: true
  validates :email,              presence: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一ー-龥々]\z/} do
    validates :family_name
    validates :first_name
    validates :family_name_kana
    validates :first_name_kana
  end
  validates :birthday,           presence: true
end