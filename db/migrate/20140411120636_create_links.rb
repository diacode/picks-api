class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :title
      t.text :description
      t.string :category
      t.string :status

      t.timestamps
    end
  end
end
