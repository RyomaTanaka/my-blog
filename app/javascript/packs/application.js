require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')

$(function(){
  $('.js-modal-open').each(function(){
    $(this).on('click', function(){
      let target = $(this).data('target');
      let modal = document.getElementById(target);
      $(modal).fadeIn();
      return false;
    });
  });
  $('.js-modal-close').on('click',function(){
      $('.js-modal').fadeOut();
      return false;
  });
});