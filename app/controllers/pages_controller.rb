class PagesController < ApplicationController
       before_action :authenticate_user!, only:[:show, :users]
    
  def home
      @gratitudes = Gratitude.all.reverse
      @readings = Reading.all
      @first_reading = @readings.first
  end
    
  def users
      @users = User.all
      @images = Picture.all
      @mains = @images.select{ |i| i.main == true }
      
      if params[:commit]=="Enter"
        if params[:zip]=="all"    
            @users
        else
            @users = User.where('zip = ?', params[:zip])
        end
      end
  end
    
  def show
      @users = User.all
      @images = Picture.all
      @mains = @images.select{ |i| i.main == true }
      
      @user = User.find(params[:id])
      
      if params[:commit]=="Send Request"
#          m = ManagePhoto.where('requestor_id = ?, requestee_id = ?', current_user.id, params[:id].to_i)
#          
#          if m.nil?
            ManagePhoto.create('requestor_id': current_user.id, 'requestee_id': params[:id].to_i, 'granted': 'pending', 'user_id': current_user.id)
              email = @user.email
              name = current_user.name
              id = current_user.id
              UserMailer.photo_access(email,name,id).deliver_now
#          end 
      end
      
      @pictures = @user.pictures
      @main_photo = @pictures.find{ |pic| pic.main == true }
      @private_photos = @pictures.select{ |photo| photo.private == true }
      @public_photos = @pictures - [@main_photo] - @private_photos
      
      @permitted = permitted?
      @pending = pending?
  end
    
   def meditate
       
   end
    
    
    private
    
    def permitted?
                
        granted = ManagePhoto.where('requestor_id = ? and requestee_id = ? and granted = ?', current_user.id, params[:id], "yes" )
        
        (current_user.id == params[:id].to_i) || !(granted.empty?)
    end
    
    def pending?
                
        pending = ManagePhoto.where('requestor_id = ? and requestee_id = ? and granted = ?', current_user.id, params[:id], "pending" )
        !(pending.empty?)
        
    end
end
