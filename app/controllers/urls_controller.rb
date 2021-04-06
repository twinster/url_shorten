class UrlsController < ApplicationController
  def shorten
    service = UrlsService.new(permit_params)
    service.shorten
    return render json: service.errors, status: 500 if service.errors.any?
    render json: service.shorten_json
  end

  def original_url
    service = UrlsService.new(permit_params)
    service.original_url
    return render json: service.errors, status: 500 if service.errors.any?
    render json: service.original_json
  end

  private
  def permit_params
    params.permit(:url)
  end
end