class Department < ApplicationRecord
  has_many :investigations

  validates_presence_of :name, :address, :jurisdiction, :active_cases
  validates_uniqueness_of :name
  validates :is_federal, inclusion: [false, true]
end
