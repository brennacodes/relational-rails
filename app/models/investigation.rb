class Investigation < ApplicationRecord
  belongs_to :department, counter_cache: :active_cases

  validates_presence_of :subject, :uid, :active_leads
  validates_uniqueness_of :uid
  validates_associated :department
  validates :active, inclusion: { in: [true, false] }

  def self.sort_created_descend
    order(:created_at).reverse_order
  end
end
