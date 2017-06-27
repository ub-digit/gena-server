class V1::LangsController < ApplicationController
  def index
    langs = Lang.all.order('id DESC')
    render json: {langs: langs.as_json}, status: 200
  end
end
