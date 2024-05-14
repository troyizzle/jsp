class CreateTopics < ActiveRecord::Migration[7.1]
  def change
    create_table :topics do |t|
      t.string :title, null: false
      t.integer :views, default: 0, null: false

      t.belongs_to :forum, null: false, foreign_key: true
      t.belongs_to :created_by, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
