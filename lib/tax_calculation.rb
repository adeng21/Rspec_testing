class TaxCalculation

  attr_reader :first_name, :last_name, :annual_income, :tax_paid, :tax_rate

  def initialize(first_name, last_name, annual_income, tax_paid, tax_rate)
    @first_name = first_name
    @last_name = last_name
    @annual_income = annual_income
    @tax_paid = tax_paid
    @tax_rate = tax_rate
  end

  def tax_status

    if tax_paid > annual_income * tax_rate/100
      'refund'
    else
      'liability'
    end
  end

  def amount_due_or_owed

    if tax_status == 'refund'
      tax_paid - (annual_income * tax_rate/100)

    else
      (annual_income * tax_rate/100) - tax_paid

    end
  end

  def summary
    if tax_status == 'refund'
      "#{first_name} #{last_name} will receive a #{tax_status} of $#{amount_due_or_owed.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}"
    else
      "#{first_name} #{last_name} has a tax #{tax_status} of $#{amount_due_or_owed.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}"

    end
  end

end

