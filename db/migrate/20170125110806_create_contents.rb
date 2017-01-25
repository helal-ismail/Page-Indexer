class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :target
      t.text :occurrence
      t.integer :page_id
      t.timestamps null: false
    end
  end
end
