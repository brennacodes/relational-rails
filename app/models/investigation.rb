class Investigation < ApplicationRecord
  belongs_to :department, counter_cache: :active_cases

  validates_presence_of :subject, :uid, :active_leads
  validates_uniqueness_of :uid
  validates_associated :department
  validates :active, inclusion: { in: [true, false] }

  scope :num_leads, -> (input) { where('active_leads > ?', input) }
  scope :over_num_cases, -> (input) { where('investigations_count > ?', input) }
  scope :named, -> (input) { where('name ILIKE ?', "#{ input }%-")}
  scope :named_like, -> { find("name ILIKE", input) }
  scope :address_contails, -> (input) { where('address ILIKE ?', "%#{input}%-") }
  scope :has_jurisdiction, -> { find("jurisdiction ILIKE", input) }

  def self.sort_created_descend
    order(:created_at).reverse_order
  end

  def self.show_true
    where(:active => true)
  end

  def search_investigations(input)
    [num_leads(input),
    over_num_cases(input),
    named(input),
    named_like(input),
    address_contails(input),
    has_jurisdiction(input)].compact
  end
end
