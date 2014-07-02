class DashboardsController < ApplicationController
  def show
    @text_subject = TextSubject.new
    @shouts = current_user.timeline
  end
end
