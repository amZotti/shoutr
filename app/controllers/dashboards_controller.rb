class DashboardsController < ApplicationController
  def show
    @text_subject = TextSubject.new
    @image_subject = ImageSubject.new
    @shouts = current_user.timeline
  end
end
