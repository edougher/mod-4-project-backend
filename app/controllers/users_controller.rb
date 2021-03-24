class UsersController < ApplicationController
    
    def show
        username = params[:username] + '.com'
        user = User.find_by(username: username)
        if user.username == "admin@d.com"
            appts = Appointment.all
            #byebug
            render json: {user: user, appts: appts}
        elsif user && user.appointments
            appts = user.appointments            
            render json: {user: user, appts: appts}
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
