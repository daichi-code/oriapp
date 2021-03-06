class Address < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :address
    validates :age_id, numericality: { other_than: 1 }
    validates :sex_id, numericality: { other_than: 1 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :sex
  belongs_to_active_hash :age

end
