class AddIntroColumnToCompilations < ActiveRecord::Migration
  def change
    add_column :compilations, :intro, :text
  end
end
