class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :moderator, null: false
      t.timestamps null: false
    end

    add_index :subs, :moderator
    add_index :subs, :title
  end
end
