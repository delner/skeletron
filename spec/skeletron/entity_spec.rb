RSpec.describe Skeletron::Entity do
  subject { described_class }

  describe 'implemented' do
    let(:test_class) do
      Class.new.tap do |klass|
        klass.send(:include, described_class)
      end
    end

    describe 'instance' do
      subject(:entity) { test_class.new }

      describe 'behavior' do
        it { is_expected.to be_a_kind_of(described_class::Identifiable) }
        it { is_expected.to be_a_kind_of(described_class::Relatable) }
      end
    end
  end
end
