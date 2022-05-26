let $crsf_token = $('[name="csrfmiddlewaretoken"]').attr('value');


$(document).ready(function(){
    $('.catalog_link').click(function(event){
        event.preventDefault();
        $.ajax({
            type: 'POST',
            url: $(this).attr('href'),
            dataType: 'json',
            headers: {'X-CSRFToken': $crsf_token},
            success: function (data){
                $('#catalog').html(data.test)
                console.log(data)
            }
        })
    })
});