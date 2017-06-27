class Lang < ActiveRecord::Base
  self.table_name = "lang"
  has_many :disputations
end
