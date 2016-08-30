class CreateReclamos < ActiveRecord::Migration
  def change
    create_table :reclamos do |t|
      t.references :user_id, index: true, foreign_key: true
      t.references :empresa, index: true, foreign_key: true
      t.string :texto

      t.timestamps null: false
    end
  end
end
