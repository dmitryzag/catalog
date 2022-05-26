let $csrf_token = $('[name="csrfmiddlewaretoken"]').attr('value');
$(document).ready(function(){
    $('.catalog_link').click(function(event){
        event.preventDefault();
        $.ajax({
            type: 'POST',
            url: $(this).attr('href'),
            dataType: 'json',
            headers: {'X-CSRFToken': $csrf_token},
            success: function (data){
                console.log($('#catalog'))
            }
        })
    })
});