let $csrf_token = $('[name="csrfmiddlewaretoken"]').attr('value');
$(document).ready(function(){
    $('.catalog_link').click(function(event){
        event.preventDefault();
        let path = $(this).attr('href')
        $.ajax({
            type: 'POST',
            url: $(this).attr('href'),
            dataType: 'json',
            headers: {'X-CSRFToken': $csrf_token},
            success: function (data){
                window.history.pushState(data, '', path)
                $('#catalog').replaceWith(data.rendered)
            }
        })
    })

    $('.breadcrumb').click(function (event){
        event.preventDefault();
    })
});
