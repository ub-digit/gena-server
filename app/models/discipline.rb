class Discipline < ActiveRecord::Base
  self.table_name = "discipline"
  has_many :disputations
end
