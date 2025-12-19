'use strict';

if (typeof module !== 'undefined') {
  module.exports = {
    test_page: 'tests/index.html?hidepassed',
    disable_watching: true,
    launch_in_ci: ['brave'],
    launch_in_dev: ['brave'],
    browser_start_timeout: 120,
  };
}
