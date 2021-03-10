class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :created_at
end
