class Api::Features::FeatureController < ApplicationController
  def index
    page = params[:page].to_i
    per_page = params[:per_page].to_i
    mag_types = params[:mag_type].present? ? params[:mag_type].split(',') : nil

    if page < 1
      render json: { error: 'Invalid page number' }, status: :bad_request
      return
    end
    if per_page < 1 or per_page > 1000
      render json: { error: 'Invalid per_page number' }, status: :bad_request
      return
    end

    if mag_types.present?
      features = FeatureRepository.paginate_by_mag_type(page: page, per_page: per_page, mag_types: mag_types)
      total_features = FeatureRepository.count_by_mag_type(mag_types)
    else
      features = FeatureRepository.paginate(page: page, per_page: per_page)
      total_features = FeatureRepository.count
    end

    render json: { 
      data: features,
      pagination: {
        current_page: page,
        total: total_features / per_page + 1,
        per_page: per_page,
      }
    }
  end
end
