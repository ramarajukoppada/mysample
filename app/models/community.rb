class Community < ActiveRecord::Base
	attr_accessible :UserID, :CommunityName,:CommunityDesc
end
