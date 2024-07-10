class PositionsToTypeVacancy < ActiveRecord::Migration[7.1]
  def change
    add_reference :positions, :type_vacancy, null: false, foreign_key: true
  end
end
