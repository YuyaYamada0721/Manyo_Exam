class AddTaskContentToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :task_content, :text
  end
end
