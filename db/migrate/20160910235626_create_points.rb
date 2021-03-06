class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points do |t|
      t.string :name
      t.integer :value
      t.references :user, foreign_key: true

      t.integer :status

      t.timestamps null:false
    end
  end
end
