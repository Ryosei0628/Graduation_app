// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

const button = document.getElementById('button');
const bars = document.getElementById('bars');
const x = document.getElementById('x');
const menu = document.getElementById('menu');

button.addEventListener('click', event => {
    bars.classList.toggle('hidden');
    x.classList.toggle('hidden');
    menu.classList.toggle('translate-x-full');
})