class Trip < ApplicationRecord
  belongs_to :origin, class_name: 'Place', foreign_key: :origin_id, dependent: :destroy
  belongs_to :destination, class_name: 'Place', foreign_key: :destination_id, dependent: :destroy
  has_many :itineraries

  accepts_nested_attributes_for :origin
  accepts_nested_attributes_for :destination

  scope :approved, -> { where(approved: true)}
  scope :not_approved, -> { where(approved: false) }

end
