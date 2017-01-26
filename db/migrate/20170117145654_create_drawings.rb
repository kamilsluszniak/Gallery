class CreateDrawings < ActiveRecord::Migration[5.0]
  def change
    create_table :drawings do |t|
      t.string :title
      t.string :attachment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
