class Tagging < ActiveRecord::Base
  attr_accessible :gist_id, :tag_id
  belongs_to :gist
  belongs_to :tag
  # validates_presence_of :gist_id
  # validates_presence_of :tag_id
end
