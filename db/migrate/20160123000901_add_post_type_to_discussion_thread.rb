class AddPostTypeToDiscussionThread < ActiveRecord::Migration
  def change
    add_column :discussion_threads, :type, :string
  end
end
