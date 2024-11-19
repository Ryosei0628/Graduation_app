// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

document.addEventListener('turbo:load', () => {
    const button = document.getElementById('button');
    const bars = document.getElementById('bars');
    const x = document.getElementById('x');
    const menu = document.getElementById('menu');
    const overlay = document.getElementById('overlay');

    if (button) {
        button.addEventListener('click', event => {
            bars.classList.toggle('hidden');
            x.classList.toggle('hidden');
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
        x.classList.add('hidden');
    });
});

