require 'spec_helper'

RSpec.describe Skeletron::EntityGateway do
  subject { described_class }

  describe 'implemented' do
    let(:test_class) do
      Class.new.tap do |klass|
        klass.send(:include, described_class)
      end
    end

    describe 'instance' do
      subject(:gateway) { test_class.new }

      describe 'behavior' do
        it { is_expected.to be_a_kind_of(described_class::Creatable) }
        it { is_expected.to be_a_kind_of(described_class::Readable) }
        it { is_expected.to be_a_kind_of(described_class::Updatable) }
        it { is_expected.to be_a_kind_of(described_class::Deletable) }
      end
    end
  end
end
