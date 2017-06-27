class V1::SubjectsController < ApplicationController
  def index
    subjects = Subject.all.order('id ASC')
    render json: {subjects: subjects.as_json}, status: 200
  end
end
