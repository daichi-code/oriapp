class Tweet < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :season
  belongs_to_active_hash :prefecture


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

  def self.search(search)
    if search != ""
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end

end
