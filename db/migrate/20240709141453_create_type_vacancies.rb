class CreateTypeVacancies < ActiveRecord::Migration[7.1]
  def change
    create_table :type_vacancies do |t|
      t.string :name

      t.timestamps
    end
  end
end
