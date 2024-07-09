class RemoveRemoteToPosition < ActiveRecord::Migration[7.1]
  def change
    remove_column :positions, :remote, :boolean
  end
end
