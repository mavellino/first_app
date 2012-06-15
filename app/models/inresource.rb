class Inresource < ActiveRecord::Base
  belongs_to :outresource
  attr_accessible :descr, :name
end
