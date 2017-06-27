class V1::DisciplinesController < ApplicationController
  def index
    disciplines = Discipline.all.order('id ASC')
    render json: {disciplines: disciplines.as_json}, status: 200
  end
end
