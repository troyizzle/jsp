class CreateForums < ActiveRecord::Migration[7.1]
  def change
    create_table :forums do |t|
      t.string :title, null: false
      t.integer :views, default: 0, null: false

      t.belongs_to :parent, null: true, foreign_key: {to_table: :forums}
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
