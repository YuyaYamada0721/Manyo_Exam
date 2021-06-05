class AddExpirationDeadlineToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :expiration_deadline, :date, null: false, default: -> { 'NOW()' }
  end
end
