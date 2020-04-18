class CreateTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :topics do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.string :slug

      t.timestamps
    end
    add_index :topics, :slug, unique: true
  end
end
