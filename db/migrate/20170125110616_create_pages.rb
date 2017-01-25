class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :link, :default => ""
      t.timestamps null: false
    end
  end
end
