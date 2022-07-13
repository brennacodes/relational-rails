class Department < ApplicationRecord
  has_many :investigations, dependent: :delete_all

  validates_presence_of :name, :address, :jurisdiction, :active_cases
  validates :is_federal, inclusion: [false, true]

  scope :over_num_cases, -> (input) { where('investigations_count > ?', input) }
  scope :named, -> (input) { where('name ILIKE ?', "%#{ input }%-")}
  scope :named_like, -> { find("name ILIKE ?", input) }
  scope :address_contails, -> (input) { where('address LIKE ?', "%#{input}%-") }
  scope :has_jurisdiction, -> { find("jurisdiction = ?", input) }

  def num_cases
    investigations.count
  end

  def search_departments(input)
    [over_num_cases(input),
    named(input),
    named_like(input),
    address_contails(input),
    has_jurisdiction(input)].compact
  end

end
