class Department < ApplicationRecord
  has_many :cases

  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :jurisdiction
  validates_presence_of :active_cases
end
