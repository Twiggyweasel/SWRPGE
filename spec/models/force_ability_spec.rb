require 'rails_helper'

RSpec.describe ForceAbility, type: :model do
  subject {
    described_class.create(name: 'Test', 
                          description: 'Testing', 
                          source: Source.create(name: 'Test', page: 25), 
                          force_power: ForcePower.create(name: 'Test', description: 'Testing', source: Source.last))
  }

  describe 'Associations' do
    it { should belong_to(:source).optional }
    it { should belong_to(:force_power) }
  end

  describe 'Validations' do
    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'should be invalid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'should be invalid without a description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end
  end
end
