class AddIndexToDrawings < ActiveRecord::Migration[5.0]
  def change
    add_index :drawings, [:user_id, :created_at]
  end
end
