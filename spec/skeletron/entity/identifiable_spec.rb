require 'spec_helper'

RSpec.describe Skeletron::Entity::Identifiable do
  subject { described_class }

  describe 'implemented' do
    let(:test_class) do
      (stub_const "TestClass", Class.new).tap do |klass|
        klass.send(:include, described_class)
      end
    end

    describe 'instance' do
      subject(:object) { test_class.new(id) }
      let(:id) { double('id') }

      describe 'behavior' do
        describe '#id' do
          subject(:entity) { object.id }
          it { is_expected.to be(id) }
        end
      end
    end
  end
end
