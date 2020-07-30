const { environment } = require('@rails/webpacker')
const webpack = require('webpack')
const path = require("path")

const customConfig = require('./loaders/file')
const fileLoader = require('./loaders/file')

resolve: {
  modules: [
    /* assuming that one up is where your node_modules sit,
       relative to the currently executing script
    */
    // path.join(__dirname, '../node_modules')
  ]
}
// resolveLoader: {
//   modules: ['node_modules'],
//   extensions: ['.js', '.json'],
//   mainFields: ['loader', 'main']
// }
// do something on environment
// environment.loaders.append({ key: 'file', value: fileLoader })

// Get a pre-configured plugin
// const manifestPlugin = environment.plugins.get('Manifest')
// manifestPlugin.options.writeToFileEmit = false

// Add an additional plugin of your choosing : ProvidePlugin
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    'window.Tether': 'tether',
    Popper: ['popper.js', 'default'],
    ActionCable: 'actioncable',
    _map: ['lodash', 'map'],
  })
)

// Insert before a given plugin
// environment.plugins.insert('CommonChunkVendor',
//   new webpack.optimize.CommonsChunkPlugin({
//     name: 'vendor', // Vendor code
//     minChunks: (module) => module.context && module.context.indexOf('node_modules') !== -1
//   })
//   , { before: 'manifest' })

// environment.config.merge(customConfig)

const jsonLoader = require('./loaders/jspn')

// Insert json loader at the end of list
// environment.loaders.append('json', jsonLoader)

// Insert json loader at the top of list
// environment.loaders.prepend('json', jsonLoader)

// // Insert json loader after/before a given loader
// environment.loaders.insert('json', jsonLoader, { after: 'style' })
// environment.loaders.insert('json', jsonLoader, { before: 'babel' })


/////////////////////////////////
const url = require('./loaders/url')
environment.loaders.prepend('url', url)
// avoid using both file and url loaders
environment.loaders.get('file').test = /\.(tiff|ico|svg|eot|otf|ttf|woff|woff2)$/i
////////////////////////////

// environment.splitChunks()
module.exports = environment
