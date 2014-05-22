class AddErrorColumnToCompilations < ActiveRecord::Migration
  def change
    add_column :compilations, :error, :text
  end
end
