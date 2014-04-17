class AddCompilationIdColumnToLinks < ActiveRecord::Migration
  def change
    add_column :links, :compilation_id, :integer
    add_index :links, :compilation_id
  end
end
