class CreateChapters < ActiveRecord::Migration[7.2]
  def change
    create_table :chapters do |t|
      t.text :name
      t.text :description
      t.string :status
      t.references :notebook, null: false, foreign_key: true

      t.timestamps
    end
  end
end
