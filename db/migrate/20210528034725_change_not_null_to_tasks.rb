class ChangeNotNullToTasks < ActiveRecord::Migration[5.2]
  def change
    change_column_null :tasks, :name, false
    change_column_null :tasks, :task_content, false
  end
end
