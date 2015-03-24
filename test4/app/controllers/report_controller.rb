class ReportController < ApplicationController
  def index
  end

  def show
     render file: File.join(Rails.root, 'public', 'reports', params[:item])
  end
end
