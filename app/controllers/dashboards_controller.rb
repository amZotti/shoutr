class DashboardsController < ApplicationController
  def show
    @shouts = Shout.all
    @text_subject = TextSubject.new
  end
end
