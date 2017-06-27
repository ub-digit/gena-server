class Place < ActiveRecord::Base
  self.table_name = "place"
  has_many :disputations
end
