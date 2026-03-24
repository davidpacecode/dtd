class AddProjectToTasks < ActiveRecord::Migration[8.1]
  def change
    add_reference :tasks, :project, null: false, foreign_key: true
  end
end
