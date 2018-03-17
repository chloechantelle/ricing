console.log('ayy' + ' ' + 'lmao'); 

$(document).ready(function(){
    $('.tooltipped').tooltip({delay: 50});	
    $(".button-collapse").sideNav();
    $('.modal').modal();
    $('.scrollspy').scrollSpy();
});

Materialize.toast('I am a toast!', 5000);