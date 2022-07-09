class Department < ApplicationRecord
  has_many :investigations

  validates_presence_of :name, :address, :jurisdiction, :active_cases
  validates :is_federal, inclusion: [false, true]

  def self.sort_created_descend
    order(:created_at).reverse_order
  end

  def child_count
    self.investigations.count
  end
end
