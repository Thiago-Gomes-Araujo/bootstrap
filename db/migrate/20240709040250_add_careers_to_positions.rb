class AddCareersToPositions < ActiveRecord::Migration[7.1]
  def change
    add_reference :positions, :career, null: false, foreign_key: true
  end
end
