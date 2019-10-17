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


  let articles_list = $('#serch-result')

  function buildHTML(article) {
    let html = `<p class="result"><a href="/articles/${article.id}/comments">${article.title}</a></p>`
    articles_list.append(html);
  }

  $('#serch-form').on('keyup', function(){
    let input = $('#serch-form').val();

    $.ajax({
      url: '/articles/serch',
      type: 'GET',
      data: {keyword: input},
      dataType: 'json'
    })

    .done(function(articles) {
      articles_list.empty();
      if (articles !== 0) {
        articles.forEach(function(article) {
          buildHTML(article)
        });
      } else {
        alert('該当の投稿がありません');
      }
    })

    .fail(function() {
      alert('検索に失敗しました。');
    });


  });
});