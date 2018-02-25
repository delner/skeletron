require 'spec_helper'

RSpec.describe Skeletron::Entity::Equivalency do
  describe 'implemented' do
    let(:test_class) do
      (stub_const "TestClass", (Class.new do
        def initialize(attributes = {})
          attributes.each do |key, value|
            self.send("#{key}=", value)
          end
        end
      end)).tap do |klass|
        klass.send(:include, described_class)
        klass.send(:attr_accessor, *class_attributes)
      end
    end
    let(:class_attributes) { [:foo, :bar] }

    describe 'class' do
      subject(:object) { test_class }

      describe 'behavior' do
        describe '#hash_attributes' do
          subject(:hash_attributes) { object.hash_attributes }

          context 'when no definition given' do
            it { is_expected.to eq([]) }
          end

          context 'when definition given' do
            before(:each) { object.define_hash(*class_attributes) }
            it { is_expected.to eq(class_attributes) }
          end
        end

        describe '#equality_attributes' do
          subject(:equality_attributes) { object.equality_attributes }

          context 'when no definition given' do
            it { is_expected.to eq([]) }
          end

          context 'when definition given' do
            before(:each) { object.define_equality(*class_attributes) }
            it { is_expected.to eq(class_attributes) }
          end
        end
      end
    end

    describe 'instance' do
      describe 'behavior' do
        describe '#hash' do
          before(:each) { test_class.define_hash(:foo, :bar) }

          context 'given objects that' do
            context 'have the same hash attribute values' do
              let(:first_object) { test_class.new(foo: 1, bar: 2) }
              let(:second_object) { test_class.new(foo: 1, bar: 2) }
              it { expect(first_object.hash).to eq(second_object.hash) }
            end

            context 'have different attribute values' do
              let(:first_object) { test_class.new(foo: 1, bar: 2) }
              let(:second_object) { test_class.new(foo: 3, bar: 4) }
              it { expect(first_object.hash).to_not eq(second_object.hash) }
            end
          end
        end

        describe 'equality' do
          before(:each) { test_class.define_equality(:foo, :bar) }

          context 'given objects that' do
            context 'have the same hash attribute values' do
              let(:first_object) { test_class.new(foo: 1, bar: 2) }
              let(:second_object) { test_class.new(foo: 1, bar: 2) }
              it { expect(first_object).to eq(second_object) }
              it { expect(first_object.eql?(second_object)).to be true }
              it { expect(first_object == second_object).to be true }
            end

            context 'have different attribute values' do
              let(:first_object) { test_class.new(foo: 1, bar: 2) }
              let(:second_object) { test_class.new(foo: 3, bar: 4) }
              it { expect(first_object).to_not eq(second_object) }
              it { expect(first_object.eql?(second_object)).to be false }
              it { expect(first_object == second_object).to be false }
            end
          end
        end
      end
    end
  end
end
