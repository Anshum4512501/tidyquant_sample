ScrollReveal().reveal('.headline',{
    delay: 375,
    duration: 500,
    reset: true,
    scale: 0.85,
    distance: '10px',
    origin :'left',
});

let list= ["text-mining","Natural Language Processing","Computer Vision"]
let element = document.querySelector('.pop-up');
let name = document.querySelector('.timeandcontent-pop-up');


var myVar = setInterval(myTimer, 1000);
var newvar = setInterval(print, 3000);

function myTimer() {
  var d = new Date();
  var t = d.toLocaleTimeString();
  element.innerHTML = t;

}

function print(){
    list.forEach(item=>{
        setTimeout(function(){name.innerHTML = item;  }, 1000);

    })
    }

