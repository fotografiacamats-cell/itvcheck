// Toggle del menu movil para .itv-header
(function () {
  function initMobileNav() {
    var toggles = document.querySelectorAll('.itv-nav-toggle');
    toggles.forEach(function (btn) {
      if (btn.dataset.navInit === '1') return;
      btn.dataset.navInit = '1';
      btn.addEventListener('click', function () {
        var headerInner = btn.closest('.itv-header-inner');
        if (!headerInner) return;
        var nav = headerInner.querySelector('.itv-nav');
        if (!nav) return;
        var isOpen = nav.classList.toggle('open');
        btn.classList.toggle('open', isOpen);
        btn.setAttribute('aria-expanded', isOpen ? 'true' : 'false');
      });
    });
  }
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initMobileNav);
  } else {
    initMobileNav();
  }
})();