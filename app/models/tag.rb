class Tag < ActiveRecord::Base
  attr_accessible :name, :tag_ids
  has_many :taggings
  has_many :gists, :through => :taggings, :inverse_of => :tags
end
