class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :UserID
      t.string :CommunityName
      t.string :CommunityDesc
      t.timestamps
    end
  end
end

