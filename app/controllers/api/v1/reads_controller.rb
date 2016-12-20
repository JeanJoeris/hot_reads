class Api::V1::ReadsController < ApplicationController
  before_action :cors_check

  def index
    @reads = Read.top_reads
    render json: @reads, status: 201
  end

  def create
    @read = Read.find_or_create_by(read_params)

    if @read.save
      @read.mark_read_count
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
