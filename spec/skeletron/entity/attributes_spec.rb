require 'spec_helper'

RSpec.describe Skeletron::Entity::Attributes do
  describe 'implemented' do
    let(:test_class) do
      (stub_const "TestClass", Class.new).tap do |klass|
        klass.send(:include, described_class)
      end
    end

    describe 'class' do
      subject(:type) { test_class }

      describe 'behavior' do
        describe '#attributes' do
          subject(:attributes) { type.attributes }

          context 'when no definition given' do
            it { is_expected.to eq([]) }
          end

          context 'when definition given' do
            let(:definition) { [:foo, :bar] }
            before(:each) { type.define_attributes(*definition) }
            it { is_expected.to eq(definition) }
          end
        end
      end
    end

    describe 'instance' do
      subject(:object) { test_class.new }

      describe 'behavior' do
        describe '#initialize' do
          subject(:object) { test_class.new(**attributes) }
          before(:each) { test_class.define_attributes(*definition) }
          let(:definition) { [:foo, :bar] }
          let(:attributes) { { foo: 'foo', bar: 'bar' } }

          it do
            attributes.each do |key, value|
              expect(object.send(key)).to eq(value) 
            end
          end
        end

        describe 'object attr_accessors' do
          before(:each) { test_class.define_attributes(*definition) }
          let(:definition) { [:foo, :bar] }

          it do
            definition.each do |attribute|
              expect(object).to respond_to(attribute)
              expect(object).to respond_to("#{attribute}=".to_sym)
            end
          end
        end
      end
    end
  end
end
