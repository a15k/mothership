import SwaggerUi, { plugins, presets } from 'swagger-ui';
import 'swagger-ui/dist/swagger-ui.css'

SwaggerUi({
  dom_id: '#swagger-docs-root',
  url: '/api-docs/v1/swagger.json',
  presets: [
    presets.apis
  ],
  plugins: [
    // plugins.SpecIndex,
    // plugins.LayoutIndex
  ],
  //layout: ''
});