class Compilation < ActiveRecord::Base
  # Relations
  has_many :links

  # Callbacks
  before_create :generate_installment

  def generate_installment
    last_installment = Compilation.maximum(:installment)    
    self.installment = last_installment ? last_installment+1 : 1
  end

  def is_published?
    !published_at.blank?
  end
end
