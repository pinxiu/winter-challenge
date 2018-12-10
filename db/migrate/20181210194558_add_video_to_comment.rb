class AddVideoToComment < ActiveRecord::Migration[5.0]
   def self.up
    add_attachment :comments, :video
  end

  def self.down
    remove_attachment :comments, :video
  end
end
