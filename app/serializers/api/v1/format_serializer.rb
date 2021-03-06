module Api
  module V1

    class FormatSerializer < Serializer
      swagger_schema :Format do
        key :description, 'Formats define how assessments are encoded'
        key :required, [:id, :identifier, :name, :specification]
      end

      property :id, type: :string, format: 'uuid'
      property :identifier, type: :string
      property :name, type: :string, description: 'A short description of the format'
      property :specification, type: :string, specification: 'A comprehensive description of the format'

      property :created_by,
               document: false,
               readable: false,
               reader: ->(user_options:, **) {
        new_record? ? user_options[:current_member] : nil
      }

    end
  end
end
