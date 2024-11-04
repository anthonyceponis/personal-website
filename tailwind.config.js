// tailwind.config.js
module.exports = {
  content: [
    "./src/**/*.{html,js,ml}", // Includes all .html, .js, and .ml files in src/
    "./public/**/*.html", // Includes HTML files in the public folder
    "./bin/**/*.{html,js,ml}", // Includes all .html, .js, and .ml files in bin/
    "./app.ml", // Any specific files directly in the root
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Space Mono", "monospace"], // Set Space Mono as the default sans-serif font
      },
    },
  },
  plugins: [],
};
