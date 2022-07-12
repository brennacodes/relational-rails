class Department < ApplicationRecord
  has_many :investigations, dependent: :delete_all

  validates_presence_of :name, :address, :jurisdiction, :active_cases
  validates :is_federal, inclusion: [false, true]

  def num_cases
    investigations.count
  end
end
