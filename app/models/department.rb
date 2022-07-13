class Department < ApplicationRecord
  has_many :investigations, dependent: :delete_all

  validates_presence_of :name, :address, :jurisdiction, :active_cases
  validates :is_federal, inclusion: [false, true]

  def num_cases
    investigations.count
  end

  def self.search_departments(input)
    if input.class == Integer
      where('active_cases = ?', input).or(where('address ILIKE ?', "%#{input}%"))
    else
      where('name ILIKE ?', "%#{ input }%").or(where('address ILIKE ?', "%#{input}%")).or(where('jurisdiction ILIKE ?', "%#{input}%"))
    end
  end
end
