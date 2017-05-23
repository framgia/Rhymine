class ReportsController < ApplicationController
  load_and_authorize_resource

  def create
    if @report.save
      flash[:success] = t "flash.success.report"
      redirect_to @report.song
    end
  end

  private
  def report_params
    params.require(:report).permit :user_id, :song_id, :description
  end
end
