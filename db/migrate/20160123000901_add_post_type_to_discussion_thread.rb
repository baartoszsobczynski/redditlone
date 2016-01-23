class AddPostTypeToDiscussionThread < ActiveRecord::Migration
  def change
    add_column :discussion_threads, :post_type, :string
  end
end
