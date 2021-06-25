class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :ssn, :address, :phone_number, :slots_field
  
  has_one :slots_field
end
