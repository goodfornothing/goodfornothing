class ImagesController < ApplicationController
  
  def create

    file = params[:attachment][:file]
    
    image = Image.new 
    image.file = file

    if image.save
      render :json => image
    else
      render :json => image.errors
    end

  end

end