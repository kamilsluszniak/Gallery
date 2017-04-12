class AddProgramToDrawings < ActiveRecord::Migration[5.0]
  def change
    add_column :drawings, :program, :string
  end
end
