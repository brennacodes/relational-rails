class Investigation < ApplicationRecord
  belongs_to :department

  validates_presence_of :subject
  validates_presence_of :uid
  validates_presence_of :active_leads
  validates_presence_of :department
  validates_associated :department

end
