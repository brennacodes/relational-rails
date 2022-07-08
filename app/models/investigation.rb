class Investigation < ApplicationRecord
  belongs_to :department

  validates_presence_of :subject, :uid, :active, :active_leads
  validates_uniqueness_of :uid
  validates_associated :department
  validates :active, inclusion: [false, true]
  
end
