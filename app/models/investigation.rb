class Investigation < ApplicationRecord
  belongs_to :department

  validates_presence_of :subject, :uid, :active, :active_leads
  validates_uniqueness_of :uid
  validates_associated :department

  def self.sort_created_descend
    order(:created_at).reverse_order
  end
end
