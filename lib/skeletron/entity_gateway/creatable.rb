module Skeletron
  module EntityGateway
    module Creatable
      # Build a new entity, without persisting it
      # attributes:  Hash of attributes for the entity
      # block:       Proc { |entity| }, called after build.
      # Returns:  Entity object.
      def build(attributes = {}, &block)
        raise NotImplementedError.new
      end

      # Create a new entity and persist it
      # attributes:  Hash of attributes for the entity
      # block:       Proc { |entity| }, called after build, before save.
      # Returns:  Entity object.
      def create(attributes = {}, &block)
        raise NotImplementedError.new
      end
    end
  end
end
