class DisputationSubject < ActiveRecord::Base
  self.table_name = "disputation_subject"
  belongs_to :disputation
  belongs_to :subject
end
