// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

document.addEventListener('turbo:load', () => {
    const button = document.getElementById('button');
    const bars = document.getElementById('bars');
    const menu = document.getElementById('menu');
    const overlay = document.getElementById('overlay');

    if (button) {
        button.addEventListener('click', event => {
            menu.classList.toggle('right-[-20rem]');
            menu.classList.toggle('right-0');
            overlay.classList.toggle('hidden');
        });
    }

    overlay.addEventListener('click', () => {
        menu.classList.add('right-[-20rem]');
        menu.classList.remove('right-0'); 
        overlay.classList.add('hidden');  // オーバーレイを非表示
        bars.classList.remove('hidden');
    });
});

