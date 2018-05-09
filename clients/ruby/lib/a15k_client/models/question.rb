=begin
#Assessment Network API

#> Stores content for the Assessment Network Requests to this API must include application/json in the `Accept` header. All endpoints require an API key to be passed in the request header.  API keys can be obtained by members at www.a15k.org. 

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: unset

=end

require 'date'

module A15kClient
  # The container for all of the content needed to present an assessment and to grade it. E.g. for a multiple-choice assessment, the question would contain the stem, the answer choices, and the correct choice would be flagged.  Assessments typically only have one question. Multiple questions are allowed to support generative assessments. A generative assessment is a single assessment that has many variants, which are often randomly generated. Typically, the author of a generative assessment uses a small amount of code to create many variants of the same question where all of the numbers change between variants. Because these variants are essentially the same one original question, we bundle them all under one Assessment. 
  class Question
    # The uuid of a previously registered format
    attr_accessor :format_id

    # A key that links multiple questions together to form variants
    attr_accessor :variant

    # The content of the question. The formatting the the content is indicated by the assessment's linked format
    attr_accessor :content

    attr_accessor :solutions


    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'format_id' => :'format_id',
        :'variant' => :'variant',
        :'content' => :'content',
        :'solutions' => :'solutions'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'format_id' => :'String',
        :'variant' => :'String',
        :'content' => :'String',
        :'solutions' => :'Array<Solution>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'format_id')
        self.format_id = attributes[:'format_id']
      end

      if attributes.has_key?(:'variant')
        self.variant = attributes[:'variant']
      end

      if attributes.has_key?(:'content')
        self.content = attributes[:'content']
      end

      if attributes.has_key?(:'solutions')
        if (value = attributes[:'solutions']).is_a?(Array)
          self.solutions = value
        end
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @format_id.nil?
        invalid_properties.push("invalid value for 'format_id', format_id cannot be nil.")
      end

      if @content.nil?
        invalid_properties.push("invalid value for 'content', content cannot be nil.")
      end

      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @format_id.nil?
      return false if @content.nil?
      return true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          format_id == o.format_id &&
          variant == o.variant &&
          content == o.content &&
          solutions == o.solutions
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [format_id, variant, content, solutions].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = A15kClient.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
