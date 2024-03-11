class RenameColumnOfTasks < ActiveRecord::Migration[6.0]
  def change
    rename_column :tasks , :Description,:description
  end
end
