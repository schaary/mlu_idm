class CreateSosStudents < ActiveRecord::Migration
  def change
    create_table :sos_students do |t|
      t.integer :matrikel, null: false
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.date :date_of_birth, null: false
      t.integer :gender, null: false

      t.timestamps
    end

    add_index :sos_students, [:matrikel], unique: true
    add_index :sos_students, [:firstname, :lastname, :date_of_birth]
    add_index :sos_students, [:gender]
  end
end
