class CreateDiscussionThreads < ActiveRecord::Migration
  def change
    create_table :discussion_threads do |t|
      t.string :title
      t.string :text
      t.string :url

      t.timestamps
    end
  end
end
