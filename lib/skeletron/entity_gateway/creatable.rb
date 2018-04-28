module Skeletron
  module EntityGateway
    module Creatable
      # Build a new entity, without persisting it
      # attributes:  Hash of attributes for the entity
      # Returns:  Entity object.
      def build(attributes = {})
        raise NotImplementedError.new
      end

      # Create a new entity and persist it
      # attributes:  Hash of attributes for the entity
      # Returns:  Entity object.
      def create(attributes = {})
        raise NotImplementedError.new
      end
    end
  end
end
