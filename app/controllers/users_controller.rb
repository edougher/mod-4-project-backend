class UsersController < ApplicationController
    
    def show
        
        username = params[:username] + '.com'
        user = User.find_by(username: username)
        if user.username == "admin@d.com"
            appts = Appointment.all
            render json: {user: user, appts: appts}
        elsif user && user.appointments
            #allAdventures = all.map {|x|{adventure: x, image: rails_blob_path(x.image)}}
            #appts = user.appointments.map{|x| x.image.attached? ? x : nil }
            appts = Appointment.where(user_id: user.id)
            apptsAndImgs = appts.map{|x| {appt: x, firebase_image_urls: x.firebase_image_urls}}
            render json: {user: user, appts: apptsAndImgs}
        else 
            appts = nil
            render json: {error: 'Invalid username or password.'}
        end
        #elseif user.appointments
        #    appts = user.appointments
        #else
        #    appts = nil
        #end

        ##if user.appointments
        ##    appts = user.appointments
        ##else
        ##    appts = nil
        ##end
        
        # if user
        #     render json: {user: user, appts: appts}
        # else
        #     render json: {error: 'Invalid username or password.'}
        # end
    end
    
    
    
    def create
        user = User.find_or_create_by(username: params[:email])
        appts = user.appointments

        #if(user.username)
#
        #else
        #end
        
        if user
            render json: {user: user, password: params[:password], appts: appts}
        else
            render json: {error: 'Invalid username or password.'}
        end
    end

end
