class Favorite < ActiveRecord::Base
  attr_accessible :gist_id, :user_id

  belongs_to :gist
  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :gist_id

  validates_uniqueness_of :gist_id, scope: :user_id

  def self.favorited?(user_id, gist_id)
    Favorite.where("user_id = ? AND gist_id = ?", user_id, gist_id).any?
  end
end
