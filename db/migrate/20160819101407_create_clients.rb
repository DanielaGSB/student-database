class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :school_id
      t.integer :student_id

      t.timestamps null: false
    end
  end
end
