class UploadController < ActionController::Base

  before_action :authenticate_user!, except: access_file

  def upload_file
    if params[:file]
      FileUtils::mkdir_p(Rails.root.join("public/uploads/files"))
 
      ext = File.extname(params[:file].original_filename)
      file_name = "#{SecureRandom.urlsafe_base64}#{ext}"
      path = Rails.root.join("public/uploads/files/", file_name)
 
      File.open(path, "wb") {|f| f.write(params[:file].read)}
      view_file = ActionController::Base.asset_host + Rails.root.join("/download_file/", file_name)
      render :json => {:link => view_file}.to_json
 
    else
      render :text => {:link => nil}.to_json
    end
  end

 
  def upload_image
    if params[:file]
      FileUtils::mkdir_p(Rails.root.join("public/uploads/files"))
 
      ext = File.extname(params[:file].original_filename)
      file_name = "#{SecureRandom.urlsafe_base64}#{ext}"
      path = Rails.root.join("public/uploads/files/", file_name)
 
      File.open(path, "wb") {|f| f.write(params[:file].read)}
      view_file = ActionController::Base.asset_host + Rails.root.join("/download_file/", file_name).to_s
      render :json => {:link => view_file}.to_json
 
    else
      render :text => {:link => nil}.to_json
    end
  end
 
  def access_file
    if File.exists?(Rails.root.join("public", "uploads", "files", params[:name]))
      send_data File.read(Rails.root.join("public", "uploads", "files", params[:name])), :disposition => "attachment"
    else
      render :nothing => true
    end
  end
end