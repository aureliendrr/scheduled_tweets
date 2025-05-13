class CreateInteractions < ActiveRecord::Migration[8.0]
  def change
    create_table :interactions do |t|
      t.references :prospect, null: false, foreign_key: true
      t.integer :kind
      t.text :content
      t.datetime :occurred_at

      t.timestamps
    end
  end
end
