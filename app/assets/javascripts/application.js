// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require bootstrap-sprockets
//= require rails-ujs
//= require activestorage
//= require_tree .



// users/informationのjs

window.onload = function() {
let sliderImages = document.querySelectorAll('.slide');
let arrowRight = document.getElementById('arrow-right');
let arrowLeft = document.getElementById('arrow-left');
let current = 0;
function startSlide(){
    sliderImages[0].style.display = 'block';
}

arrowRight.addEventListener('click', function() {
  console.log("ok")
    sliderImages[current].style.display = 'none';
    if(current === sliderImages.length - 1){
        current = -1;
    }
    sliderImages[current + 1].style.display = 'block';
    current++;
})

arrowLeft.addEventListener('click', function() {
    sliderImages[current].style.display = 'none';
    if(current === 0){
        current = sliderImages.length;
    }
    sliderImages[current - 1].style.display = 'block';
    current--;
})

startSlide();
};