class AddMultiplierToComments < ActiveRecord::Migration[5.0]
  def change
	add_column :comments, :multiplier, :string, default: 1
  end
end
