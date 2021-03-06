class UserSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :name,
    :email,
    :about,
    :address,
    :latitude,
    :longitude,
    :range,
    :completion,
    :slots,
    :slot_available,
    :aasm_state,
    :created_at,
    :updated_at
  )
end
