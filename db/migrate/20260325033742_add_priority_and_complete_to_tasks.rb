class AddPriorityAndCompleteToTasks < ActiveRecord::Migration[8.1]
  def change
    add_column :tasks, :priority, :integer
    add_column :tasks, :complete, :boolean
  end
end
