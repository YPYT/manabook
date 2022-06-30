document.addEventListener('DOMContentLoaded', () => {
 
    const $navbarBurgers = document.querySelectorAll('.navbar-burger');
   
    if ($navbarBurgers.length > 0) {
   
      $navbarBurgers.forEach( el => {
   
        el.addEventListener('click', () => {
   
          // ナビゲーションバーガーのdata-target属性の値を取得します。
          const target = el.dataset.target;
          // メニュー（data-target属性の値をIDとして持つ要素）を取得します。
          const $target = document.getElementById(target);
   
          // ナビゲーションバーガーでis-activeクラスを切り替えます。
          el.classList.toggle('is-active');
          // メニューでis-activeクラスを切り替えます。
          $target.classList.toggle('is-active');
   
        });
      });
    }
  });
  