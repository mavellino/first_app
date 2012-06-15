class Outresource < ActiveRecord::Base
  attr_accessible :descr, :name
  has_many :inresources, :dependent => :destroy
end
