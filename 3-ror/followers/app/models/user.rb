class User < ApplicationRecord
	has_and_belongs_to_many :follower, class_name: "User", foreign_key: "follower_id"
	has_and_belongs_to_many :leader, class_name: "User", foreign_key: "leader_id"
end
