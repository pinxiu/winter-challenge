class AddStudentMultiplierToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :student_multiplier, :integer, default: 1
  end
end
