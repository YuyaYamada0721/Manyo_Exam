class AddIndexTasks < ActiveRecord::Migration[5.2]
  def change
    add_index :tasks, %i[name status]
  end
end
