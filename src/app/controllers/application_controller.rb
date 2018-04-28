class ApplicationController < ActionController::Base
  rescue_from(StandardError) do |error|
    render json: { error: {
      status: I18n.t('exceptions.status'),
      code: 500,
      message: error
    } }, status: 500
  end
end
