class PositionsToState < ActiveRecord::Migration[7.1]
  def change
    add_reference :positions, :state, null: false, foreign_key: true

  end
end
