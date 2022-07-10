class Department < ApplicationRecord
  has_many :investigations, dependent: :delete_all

  validates_presence_of :name, :address, :jurisdiction, :active_cases
  validates :is_federal, inclusion: [false, true]

  def self.sort_created_descend
    order(:created_at).reverse_order
  end

  def num_cases
    investigations.count
  end
end
