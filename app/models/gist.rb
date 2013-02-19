class Gist < ActiveRecord::Base
  has_many :files, class_name: "GistFile", :inverse_of => :gist
  accepts_nested_attributes_for :files

  belongs_to :user
  has_many :favorites
  has_many :taggings
  has_many :tags, :through => :taggings, :inverse_of => :gists

  validates_presence_of :title
  validates_presence_of :user

  attr_accessible :title, :files_attributes, :tag_ids

end
