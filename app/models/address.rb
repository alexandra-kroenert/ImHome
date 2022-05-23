class Address < ApplicationRecord
  has_many :safe_places
	has_many :starting_point_journey, class_name: "Journey", foreign_key: "starting_point_id"
	has_many :destination_journey, class_name: "Journey", foreign_key: "destination_id"
  # validates :address_line1, :city, presence: true
end
