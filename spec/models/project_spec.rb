require 'rails_helper'

RSpec.describe Project, type: :model do


  describe '#create' do
    let(:project) { FactoryGirl.create(:project) }

    it "should set status to active" do
      expect(project.status).to eql('active')
    end
  end

  describe '#materials' do
    context 'given a project with 2 of the same units' do
      let(:project) { FactoryGirl.create(:project, :with_units, unit_count: 2) }

      it 'returns an array of 1 unit' do
        expect(project.materials.count).to eql(1)
      end

      it 'returns subtotal equal to 2 times unit cost' do
        expect(project.materials.first[:subtotal]).to eql(project.units.first.cost * 2)
      end
    end

    context 'given a project with 2 different units' do
      let(:project) { FactoryGirl.create(:project, :with_random_units, unit_count: 2) }

      it 'returns an array of 2 unit' do
        expect(project.materials.count).to eql(2)
      end
    end
  end

  describe '#total_material_units' do
    context 'given a project with 2 of the same units' do
      let(:project) { FactoryGirl.create(:project, :with_units, unit_count: 2) }

      it 'returns 2' do
        expect(project.total_material_units).to eql(2)
      end
    end

    context 'given a project with 2 different units' do
      let(:project) { FactoryGirl.create(:project, :with_random_units, unit_count: 2) }

      it 'returns 2' do
        expect(project.total_material_units).to eql(2)
      end
    end
  end

  describe '#total_material_cost' do
    context 'given a project with 2 of the same units' do
      let(:project) { FactoryGirl.create(:project, :with_units, unit_count: 2) }

      it 'returns 2 times value of single unit' do
        cost = project.units.first.cost * 2
        expect(project.total_material_cost).to eql(cost)
      end
    end

    context 'given a project with 2 different units' do
      let(:project) { FactoryGirl.create(:project, :with_random_units, unit_count: 2) }

      it 'returns total of both units' do
        cost = project.units.first.cost + project.units.last.cost
        expect(project.total_material_cost).to eql(cost)
      end
    end
  end
end
