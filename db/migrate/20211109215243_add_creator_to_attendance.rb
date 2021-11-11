class AddCreatorToAttendance < ActiveRecord::Migration[5.2]
  def change
    add_column :attendances, :creator, :boolean, default: false
  end
end
