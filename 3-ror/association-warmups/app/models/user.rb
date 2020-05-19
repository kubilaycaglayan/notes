class User < ApplicationRecord
  has_many :parties
  has_many :invitations
  has_many :followers, class_name: "Following", foreign_key: "followed_id"
  has_many :followings, class_name: "Following", foreign_key: "follower_id"
  has_many :posts

  def follow(user)
    unless following?(user)
      followings << Following.new(follower_id: self.id, followed_id: user.id)
      puts "Followed."
    else
      puts "Can't followed."
    end
  end

  def unfollow(user)
    if following?(user)
      Following.find_by(followed_id: user.id, follower_id: self.id).destroy
      puts "Unfollowed."
    else
      puts "Can't unfollow."
    end
  end

  def following?(user)
    !Following.find_by(followed_id: user.id, follower_id: self.id).nil?
  end

  def follower_names
    ids = followers.ids
    User.find(ids)
  end

  def following_names
    ids = followings.ids
    User.find(ids)
  end
end
