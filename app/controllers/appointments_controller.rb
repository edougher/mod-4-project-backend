class AppointmentsController < ApplicationController
    
    def show 
        appts = Appointment.where(user_id: params[:id])
        render json: appts
    end

    def edit
        appt = Appointment.find(params[:id])
        appt.update( 
            width: params[:width], 
            height: params[:height], 
            location: params[:location], 
            note: params[:note],
            status: params[:status]
        )
        render json: appt
    end
    
    
    def create
        appt = Appointment.create(
            user_id: params[:user_id], 
            width: params[:width], 
            height: params[:height], 
            location: params[:location], 
            note: params[:comments],
            status: params[:status])
        if appt
            render json: appt
        else
            render json: {error: 'Oops, something went wrong...'}
        end
        
    end
end