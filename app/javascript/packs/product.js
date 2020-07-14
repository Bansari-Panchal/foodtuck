$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();

      reader.onload = function (e) {
        $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }

  $("#image-upload").change(function(){
    $('#img_prev').removeClass('hidden');
    readURL(this);
  });
});



/*
{
  $("#new").click(function () {
    var clon=$('.box:first').clone(true).appendTo(".col-md-12");
            clon.find(".name").val("");
  });
  $("#remove").click(function () {
    $('.box:last').remove();
  });
});*/