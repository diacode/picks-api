class CreateCompilations < ActiveRecord::Migration
  def change
    create_table :compilations do |t|
      t.integer :installment, unique: true
      t.datetime :published_at
      t.timestamps
    end
  end
end
