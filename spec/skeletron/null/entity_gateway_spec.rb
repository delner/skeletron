require 'spec_helper'
require 'skeletron/null/entity_gateway'

RSpec.describe Skeletron::Null::EntityGateway do
  describe 'implemented' do
    let(:test_class) do
      Class.new.tap do |klass|
        klass.send(:include, described_class)
      end
    end

    describe 'class' do
      subject(:gateway) { test_class }

      describe 'behavior' do
        describe '#default_object' do
          subject(:default_object) { gateway.default_object }

          context 'when no definition given' do
            it { is_expected.to be nil }
          end

          context 'when object given' do
            let(:object) { double('object') }
            before(:each) { gateway.define_default_object(object) }
            it { is_expected.to be(object) }
          end

          context 'when block given' do
            let(:object) { double('object') }
            let(:block) { Proc.new { object } }
            before(:each) { gateway.define_default_object(&block) }
            it { is_expected.to be(object) }
          end
        end
      end
    end

    describe 'instance' do
      subject(:gateway) { test_class.new }

      describe 'behavior' do
        let(:default_object) { gateway.class.default_object }

        describe '#build' do
          subject(:result) { gateway.build }

          it { is_expected.to be(default_object) }
          it { expect { |b| gateway.build(&b) }.to yield_with_args(default_object) }
        end

        describe '#create' do
          subject(:result) { gateway.create }

          it { is_expected.to be(default_object) }
          it { expect { |b| gateway.build(&b) }.to yield_with_args(default_object) }
        end

        describe '#find' do
          subject(:result) { gateway.find(id) }
          let(:id) { double('id') }

          it { expect { result }.to raise_error(Skeletron::EntityGateway::NotFoundError) }
        end

        describe '#find_by_id' do
          subject(:result) { gateway.find_by_id(id) }
          let(:id) { double('id') }

          it { is_expected.to be(default_object) }
        end

        describe '#find_all_by' do
          subject(:result) { gateway.find_all_by(attributes) }
          let(:attributes) { double('attributes') }

          it { is_expected.to eq([]) }
        end

        describe '#update' do
          subject(:result) { gateway.update(id: id, attributes: attributes) }
          let(:id) { double('id') }
          let(:attributes) { double('attributes') }

          it { is_expected.to be(default_object) }
        end

        describe '#update_all' do
          subject(:result) { gateway.update_all(by: by, with: with) }
          let(:by) { double('id') }
          let(:with) { double('with') }

          it { is_expected.to eq([]) }
        end

        describe '#delete' do
          subject(:result) { gateway.delete(id) }
          let(:id) { double('id') }

          it { is_expected.to be true }
        end

        describe '#delete_all' do
          subject(:result) { gateway.delete_all(attributes) }
          let(:attributes) { double('attributes') }

          it { is_expected.to eq(0) }
        end
      end
    end
  end
end
