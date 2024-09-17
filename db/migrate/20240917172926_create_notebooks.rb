class CreateNotebooks < ActiveRecord::Migration[7.2]
  def change
    create_table :notebooks do |t|
      t.text :name
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
