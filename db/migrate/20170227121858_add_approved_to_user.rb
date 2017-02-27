class AddApprovedToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :approved, :boolean
    add_index  :users, :approved
  end
  
  
end
