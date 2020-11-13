class Tweet < ApplicationRecord
  has_one_attached :image
  belongs_to :user


  with_options presence: true do
    validates :text
    validates :category_id
    validates :prefecture_id
    validates :season_id
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :season_id
    validates :prefecture_id
  end

end
