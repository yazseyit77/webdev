class AddColumnToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :name, :string
    add_column :projects, :description, :string
  end
end
