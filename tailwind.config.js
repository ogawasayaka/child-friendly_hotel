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
                "primary": "#f3f4f6",
                "secondary": "#fca5a5",
                "accent": "#ef4444",
                "neutral": "#fee2e2",
                "base-100": "#f5f5f4",
                "info": "#ef4444",
                "success": "#881337",
                "warning": "#ea580c",
                "error": "#fbbf24",
          },
        },
      ],
}
}
