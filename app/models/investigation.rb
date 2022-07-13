class Investigation < ApplicationRecord
  belongs_to :department, counter_cache: :active_cases

  validates_presence_of :subject, :uid, :active_leads
  validates_uniqueness_of :uid
  validates_associated :department
  validates :active, inclusion: { in: [true, false] }

  def self.sort_created_descend
    order(:created_at).reverse_order
  end

  def self.show_true
    where(:active => true)
  end

  def self.num_leads(input)
    where('active_leads > ?', input)
  end

  def self.search_investigations(input)
    if input.class == Integer
      where('active_leads = ?', input).or(where('uid ILIKE ?', "%#{input}%")).or(where('created_at ILIKE ?', "%#{input}%"))
    else
      where('subject ILIKE ?', "%#{input}%").or(where('uid ILIKE ?', "%#{input}%"))
    end
  end
end
