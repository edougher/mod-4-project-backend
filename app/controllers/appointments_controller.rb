class AppointmentsController < ApplicationController
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