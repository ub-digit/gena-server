class Subject < ActiveRecord::Base
  self.table_name = "subject"
  has_many :disputation_subjects
  has_many :disputations, through: :disputation_subjects, source: "disputation"

end
