class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :created_at, :height, :width, :location, :note, :colors, :status
end
