class Api::V1::ReadsController < ApplicationController
  before_action :cors_check
  def create
    @read = Read.new(read_params)
    if @read.save
      render json: @read, status: 201
    else
      render json: @read.errors.full_messages, status: 500
    end
  end

  private
  def read_params
    params.permit(:link_id, :link_url, :link_title)
  end

  def cors_check
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
end
