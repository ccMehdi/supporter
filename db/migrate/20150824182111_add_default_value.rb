class AddDefaultValue < ActiveRecord::Migration
  def change
    change_column_default(:suppliers, :qualification, 0)
  end
end
