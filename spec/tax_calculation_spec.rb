require 'rspec'
require_relative '../lib/tax_calculation'

describe TaxCalculation do
  let(:johnny) {TaxCalculation.new('Johnny', 'Smith', 120000, 28000, 38)}
  let(:jane) {TaxCalculation.new('Jane', 'Doe', 140000, 30000, 40)}
  let(:liz) {TaxCalculation.new('Liz', 'Lemon', 200000, 21000, 30)}
  let(:orson) {TaxCalculation.new('Orson', 'Orsillio', 40000, 8800, 18)}
  let(:eric) {TaxCalculation.new('Eric', 'Schmidt', 54000, 0, 28)}


  describe '#first_name' do
    it 'requires individuals first name' do
      expect(johnny.first_name).to eq('Johnny')
      expect(jane.first_name).to eq('Jane')
      expect(liz.first_name).to eq('Liz')
      expect(orson.first_name).to eq('Orson')
      expect(eric.first_name).to eq('Eric')
    end

  end

  describe '#last_name' do
    it 'requires individuals last name' do
      expect(johnny.last_name).to eq('Smith')
      expect(jane.last_name).to eq('Doe')
      expect(liz.last_name).to eq('Lemon')
      expect(orson.last_name).to eq('Orsillio')
      expect(eric.last_name).to eq('Schmidt')
    end
  end

  describe '#annual_income' do
    it 'requires individual annual income' do
      expect(johnny.annual_income).to eq(120000)
      expect(jane.annual_income).to eq(140000)
      expect(liz.annual_income).to eq(200000)
      expect(orson.annual_income).to eq(40000)
      expect(eric.annual_income).to eq(54000)
    end

  end

  describe '#tax_paid' do
    it 'requires amount of tax paid by individual' do
      expect(johnny.tax_paid).to eq(28000)
      expect(jane.tax_paid).to eq(30000)
      expect(liz.tax_paid).to eq(21000)
      expect(orson.tax_paid).to eq(8800)
      expect(eric.tax_paid).to eq(0)
    end

  end

  describe '#tax_rate' do
    it 'requires individual tax rate' do
      expect(johnny.tax_rate).to eq(38)
      expect(jane.tax_rate).to eq(40)
      expect(liz.tax_rate).to eq(30)
      expect(orson.tax_rate).to eq(18)
      expect(eric.tax_rate).to eq(28)
    end
  end

  describe '#tax_status' do
    it 'calculates whether tax is owed or refunded' do
      expect(johnny.tax_status).to eq('liability')
      expect(jane.tax_status).to eq('liability')
      expect(liz.tax_status).to eq('liability')
      expect(orson.tax_status).to eq('refund')
      expect(eric.tax_status).to eq('liability')
    end
  end

  describe '#amound_due_or_owed' do
    it 'calculates amount owed or refunded' do
      expect(johnny.amount_due_or_owed).to eq(17600)
      expect(jane.amount_due_or_owed).to eq(26000)
      expect(liz.amount_due_or_owed).to eq(39000)
      expect(orson.amount_due_or_owed).to eq(1600)
      expect(eric.amount_due_or_owed).to eq(15120)
    end
  end

  describe '#summary' do
    it 'provides summary of calculation in string' do
      expect(johnny.summary).to eq('Johnny Smith has a tax liability of $17,600')
      expect(jane.summary).to eq('Jane Doe has a tax liability of $26,000')
      expect(liz.summary).to eq('Liz Lemon has a tax liability of $39,000')
      expect(orson.summary).to eq('Orson Orsillio will receive a refund of $1,600')
      expect(eric.summary).to eq('Eric Schmidt has a tax liability of $15,120')
    end
  end


end
