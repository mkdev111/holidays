var path = require("path");
var webpack = require('webpack');

module.exports = {
  context: __dirname,
  entry: {
    devise:  "./app/frontend/javascripts/devise.coffee",
    application:  "./app/frontend/javascripts/application.cjsx",
  },
  output: {
    path: path.join(__dirname, 'app', 'assets', 'javascripts'),
    filename: "[name]_bundle.js",
    publicPath: "/assets",
    devtoolModuleFilenameTemplate: '[resourcePath]',
    devtoolFallbackModuleFilenameTemplate: '[resourcePath]?[hash]'
  },
  resolve: {
    extensions: ["", ".jsx", ".cjsx", ".coffee", ".js"]
  },
  module: {
    loaders: [
      { test: /\.cjsx$/, loaders: ["coffee", "cjsx"]},
      { test: /\.coffee$/,   loader: "coffee-loader"}
    ]
  },
  plugins: [
    new webpack.ProvidePlugin({
      'React': 'react',
      'ReactDom': 'react-dom',
      '_': 'lodash'
    }),
    new webpack.IgnorePlugin(/^\.\/locale$/, [/moment$/])
  ]
}
