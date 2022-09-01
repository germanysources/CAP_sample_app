const path = require('path');

module.exports = {
  publicPath: '/vue/',
  outputDir: path.resolve('app', 'vue'),
  pages: {
    index: {
      entry: path.resolve('vue_src', 'main.js'),
      template: path.resolve('vue_public', 'index.html'),
      filename: 'index.html'
    }
  }
};
