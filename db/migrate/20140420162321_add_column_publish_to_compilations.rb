class AddColumnPublishToCompilations < ActiveRecord::Migration
  def change
    add_column :compilations, :publish, :boolean
  end
end
