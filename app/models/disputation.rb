class Disputation < ActiveRecord::Base
  self.table_name = "disputation"
  belongs_to :discipline
  belongs_to :place
  belongs_to :lang
  has_many :abstracts
  has_many :wordindexes
  has_many :disputation_subjects
  has_many :subjects, through: :disputation_subjects, source: "subject"

  def as_json
    result = super(except: [:stamp_create, :stamp_update, :stamp_import, :user_sign, :tmp, :place_id, :lang_id, :discipline_id])

    result.merge({
      abstract: abstracts.first ? abstracts.first.content : nil,
      discipline: discipline,
      place: place,
      lang: lang,
      subjects: subjects
    })
  end

  scope :subject_id, -> (subject_ids) { joins(:subjects).where(:'subject.id' => subject_ids) }

end
