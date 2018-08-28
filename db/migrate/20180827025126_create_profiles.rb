class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :resume
      t.string :portfolio
      t.string :grade_level
      t.references :user, foreign_key: { on_delete: :cascade }
      t.references :address, foreign_key: { on_delete: :nullify }

      t.timestamps
    end
  end
end
