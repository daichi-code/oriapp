class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|

      t.text :text
      t.integer :season_id
      t.integer :category_id
      t.integer :prefecture_id
      t.timestamps
    end
  end
end
