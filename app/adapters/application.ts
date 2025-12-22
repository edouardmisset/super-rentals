import JSONAPIAdapter from '@ember-data/adapter/json-api';

// This adapter will be used to fetch data for all models of the app
export default class ApplicationAdapter extends JSONAPIAdapter {
  namespace = 'api';

  buildURL(...args) {
    return `${super.buildURL(...args)}.json`;
  }
}
