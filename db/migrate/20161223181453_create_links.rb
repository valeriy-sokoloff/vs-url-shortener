class CreateLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :links do |t|
      t.string :original_url
      t.timestamps
      t.index :original_url, unique: true
    end
  end
end
