require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")
require('jquery')

$(function(){
  $('.js-modal-open').on('click',function(){
      $('.js-modal').fadeIn();
      return false;
  });
  $('.js-modal-close').on('click',function(){
      $('.js-modal').fadeOut();
      return false;
  });
});