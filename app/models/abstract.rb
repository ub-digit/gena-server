class Abstract < ActiveRecord::Base
  self.table_name = "abstract"
  belongs_to :disputation
end
