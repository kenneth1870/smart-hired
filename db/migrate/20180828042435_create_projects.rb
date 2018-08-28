class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :cliente
      t.decimal :buget
      t.datetime :start_date
      t.datetime :end_date
      t.text :description
      t.string :skills_needed, array: true, default: []
      t.integer :candidate_id

      t.timestamps
    end
  end
end
