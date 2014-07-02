class ImageSubjectsController < ApplicationController
  def create
    image_subject = ImageSubject.create(image_params)
    current_user.shouts.create(subject: image_subject)
    redirect_to :dashboard
  end
    
    def image_params
      params.require(:image_subject).permit(:url)
    end

  end
