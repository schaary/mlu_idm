class CreateSosGrades < ActiveRecord::Migration
  def change
    create_table :sos_grades do |t|
      t.string :abint, null: false
      t.string :description, null: false

      t.timestamps
    end

    add_index :sos_grades, [:abint], unique: true
    add_index :sos_grades, [:abint, :description]
  end
end
