class GistFile < ActiveRecord::Base
  attr_accessible :body, :gist_id

  validates_presence_of :gist

  belongs_to :gist, :inverse_of => :files
end
