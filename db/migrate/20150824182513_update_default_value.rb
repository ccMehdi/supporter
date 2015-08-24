class UpdateDefaultValue < ActiveRecord::Migration
  def change
    change_column_default(:sup_requests, :is_done, 0)

  end
end
