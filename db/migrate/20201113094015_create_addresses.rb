class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.integer :postal_code
      t.text :address
      t.integer :age_id
      t.integer :sex_id
      t.references :user
      t.timestamps
    end
  end
end
