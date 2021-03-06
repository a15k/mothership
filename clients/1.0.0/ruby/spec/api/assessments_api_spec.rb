=begin
#Assessment Network API

#> Stores content for the Assessment Network  API Version is specified in the URL path as `api/<version>/resource` Version will default to the latest if it's ommited  All endpoints require an API key to be passed in the request header. API keys can be obtained by members at www.a15k.org. 

OpenAPI spec version: 1.0.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.1

=end

require 'spec_helper'
require 'json'

# Unit tests for A15kClient::AssessmentsApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'AssessmentsApi' do
  before do
    # run before each test
    @instance = A15kClient::AssessmentsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of AssessmentsApi' do
    it 'should create an instance of AssessmentsApi' do
      expect(@instance).to be_instance_of(A15kClient::AssessmentsApi)
    end
  end

  # unit tests for create_assessment
  # create an assessment
  # 
  # @param assessment Assessment to be created
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse2004]
  describe 'create_assessment test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for get_assessment
  # Retrieve an assessment
  # 
  # @param id UUID of assessment to fetch
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse2004]
  describe 'get_assessment test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for search_assessments
  # Search for assessments
  # 
  # @param q query to execute
  # @param [Hash] opts the optional parameters
  # @return [InlineResponse2004]
  describe 'search_assessments test' do
    it "should work" do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
