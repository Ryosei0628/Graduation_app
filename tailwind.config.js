module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'
  ],
  theme: {
    extend: {
      colors: {
        primary: '#5A7B8C',  // 例: プライマリーカラーの定義
        secondary: '#EDEDED', // 例: セカンダリーカラーの定義  
        button: '#4C6B5C',
        subbutton: '#A3C1DA',
        menu:'#4A6B7C',

      },
      fontFamily: {
        Spicyrice: ['Spicy Rice', 'serif'],
        Kaisei: ['Kaisei Decol', 'serif']
          }
    },
  },
  plugins: [],
}
