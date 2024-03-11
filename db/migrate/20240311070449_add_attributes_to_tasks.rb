class AddAttributesToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks , :title ,:string
    add_column :tasks , :Description ,:string
    add_column :tasks , :due_date ,:date
    add_column :tasks , :level ,:string
  end
end
