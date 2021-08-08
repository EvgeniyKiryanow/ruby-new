class ApplicationController < ActionController::Base
  def render_403
    render file: 'public/403.html', status: :forbidden
  end
  def admin?
     render_403 unless params[:admin]
  end
end
