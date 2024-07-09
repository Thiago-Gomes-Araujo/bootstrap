class RemoveToPosition < ActiveRecord::Migration[7.1]
  def change
    remove_column :positions, :career, :integer
    remove_column :positions, :contract, :integer
  end
end
