class Compilation < ActiveRecord::Base
  before_create :generate_installment

  def generate_installment
    last_installment = Compilation.maximum(:installment)    
    self.installment = last_installment ? last_installment+1 : 1
  end
end
