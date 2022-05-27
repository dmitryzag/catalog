$(document).ready(function(){
    $(document).on('click', '.catalog_link', function(event){
        event.preventDefault();
        let path = $(this).attr('href')
        let $csrf_token = $('[name="csrfmiddlewaretoken"]').attr('value');
        $.ajax({
            type: 'POST',
            url: path,
            dataType: 'json',
            headers: {'X-CSRFToken': $csrf_token},
            success: function (data){
                window.history.pushState(data, '', path)
                $('#catalog').replaceWith(data.rendered)
            }
        })
    })
});
