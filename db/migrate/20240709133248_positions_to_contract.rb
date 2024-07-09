class PositionsToContract < ActiveRecord::Migration[7.1]
  def change
    add_reference :positions, :contract, null: false, foreign_key: true
  end
end
