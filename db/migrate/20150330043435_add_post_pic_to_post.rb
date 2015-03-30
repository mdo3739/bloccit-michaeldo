class AddPostPicToPost < ActiveRecord::Migration
  def change
    add_column :posts, :pic, :string
  end
end
