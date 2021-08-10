class ChangeDataStatusToTasks < ActiveRecord::Migration[6.1]
  def change
     change_column :tasks, :status, :text
  end
end
