$(document).ready(function(){
    $('.catalog_link').click(function(event){
        event.preventDefault();
        $.post($(this).attr('href'), {}, function(response){

        }, 'json');
    })
});