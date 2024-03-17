module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js'],
    plugins: [require("daisyui")],
    daisyui: {
      themes: [
        {
          mytheme: {
            "primary": "#ffedd5",
            "secondary": "#ed5752",
            "accent": "#a1be95",
            "neutral": "#92aac7",
            "base-100": "#ffff",
            "info": "#e2dfa2",
            "success": "#dc2626",
            "warning": "#fca5a5",
            "error": "#292524",
          },
        },
      ],
    }
}
