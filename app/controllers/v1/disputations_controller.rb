class V1::DisputationsController < ApplicationController

  def index
    page = params[:page] || 1
    disputations = Disputation.where(tmp: false)

    disputations = apply_filters(disputations)
    disputations = disputations.order('id DESC')

    render json: create_response(resource: disputations, resource_name: "disputations", page: page, per_page: WillPaginate.per_page), status: 200
  end

  def show
    id = params[:id]
    disputation = Disputation.find_by_id(id)
    if disputation
      render json: {disputation: disputation.as_json}, status: 200
    else
      render json: {error: {code: 404, msg: "Not Found"}}, status: 404
    end
  end

private
  def apply_filters(disputations)
    disputations = disputations.subject_id(params[:subject_id].split(";")) if params[:subject_id].present?
    disputations = disputations.where(discipline_id: params[:discipline_id].split(";")) if params[:discipline_id].present?
    disputations = disputations.where(place_id: params[:place_id].split(";")) if params[:place_id].present?

    disputations
  end

  def create_response(resource:, resource_name:, page:, per_page:)
    result = {}
    metaquery = {}

    metaquery[:total] = resource.count

    result[:meta] = {}
    result[:meta][:query] = metaquery

    pagination = {}
    if !resource.empty?
      tmp = resource.paginate(page: page, per_page: per_page)
      if tmp.current_page > tmp.total_pages
        resource = resource.paginate(page: 1, per_page: per_page)
      else
        resource = tmp
      end
      pagination[:pages] = resource.total_pages
      pagination[:page] = resource.current_page
      pagination[:next] = resource.next_page
      pagination[:previous] = resource.previous_page
      pagination[:per_page] = resource.per_page
    else
      pagination[:pages] = 0
      pagination[:page] = 0
      pagination[:next] = nil
      pagination[:previous] = nil
      pagination[:per_page] = nil
    end

    result[:meta][:pagination] = pagination
    result[resource_name.to_sym] = resource.as_json

    return result
  end
end
