class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.belongs_to :topic, null: false, foreign_key: true
      t.belongs_to :created_by, null: false, foreign_key: {to_table: :users}
      t.belongs_to :updated_by, null: false, foreign_key: {to_table: :users}
      t.string :content

      t.timestamps
    end
  end
end
