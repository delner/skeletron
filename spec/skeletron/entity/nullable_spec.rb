require 'spec_helper'

RSpec.describe Skeletron::Entity::Nullable do
  describe 'implemented' do
    let(:test_class) do
      (stub_const "TestClass", Class.new).tap do |klass|
        klass.send(:include, described_class)
      end
    end

    describe 'class' do
      subject(:type) { test_class }

      describe 'behavior' do
        describe '::Null' do
          context 'when no definition given' do
            it { expect(defined?(test_class::Null)).to be nil }
          end

          context 'when definition given' do
            before(:each) { type.define_null_object }
            it { expect(defined?(test_class::Null)).to_not be nil }
            it { expect(test_class::Null.null_object?).to be true }
          end
        end
      end
    end

    describe 'instance' do
      subject(:object) { test_class.new }

      describe 'behavior' do
        describe '#null_object?' do
          subject(:result) { object.null_object? }
          it { is_expected.to be false }
        end
      end
    end
  end
end
