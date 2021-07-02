class Oreder < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :buying

  with_options presence: true do
    validates :portal_code
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number
  end
end
