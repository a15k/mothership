/*
 * Assessment Network API
 * > Stores content for the Assessment Network  API Version is specified in the URL path as `api/<version>/resource` Version will default to the latest if it's ommited  All endpoints require an API key to be passed in the request header. API keys can be obtained by members at www.a15k.org. 
 *
 * OpenAPI spec version: 1.0.0
 * 
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 * Do not edit the class manually.
 */


package org.a15k.client.v1.client.api;

import org.a15k.client.v1.client.ApiException;
import org.a15k.client.v1.client.model.Error;
import org.a15k.client.v1.client.model.Format;
import org.a15k.client.v1.client.model.InlineResponse2002;
import org.a15k.client.v1.client.model.InlineResponse2003;
import org.junit.Test;
import org.junit.Ignore;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * API tests for FormatsApi
 */
@Ignore
public class FormatsApiTest {

    private final FormatsApi api = new FormatsApi();

    
    /**
     * create  a format
     *
     * 
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void createFormatTest() throws ApiException {
        Format format = null;
        InlineResponse2003 response = api.createFormat(format);

        // TODO: test validations
    }
    
    /**
     * Get all formats
     *
     * List all known formats
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void getFormatsTest() throws ApiException {
        InlineResponse2002 response = api.getFormats();

        // TODO: test validations
    }
    
}