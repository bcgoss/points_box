class CreateRewards < ActiveRecord::Migration[5.0]
  def change
    create_table :rewards do |t|
      t.string :name
      t.integer :value

      t.timestamps null:false
    end
  end
end
