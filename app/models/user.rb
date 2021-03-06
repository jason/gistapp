class User < ActiveRecord::Base
  attr_accessible :name

  validates_presence_of   :name
  validates_uniqueness_of :name, case_insensitive: false

  has_many :gists
  has_many :favorites
end
