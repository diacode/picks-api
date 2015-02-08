class AddApprovedColumnToLinks < ActiveRecord::Migration
  def change
    add_column :links, :approved, :boolean, default: false
  end
end
