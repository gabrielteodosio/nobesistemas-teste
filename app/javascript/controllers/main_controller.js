import { Controller } from "@hotwired/stimulus"

class MainController extends Controller {
  static targets = [ "preloader", "alertParagraph", "noticeParagraph" ]

  initialize() {
    AOS.init({
      duration: 800,
      easing: 'slide',
      once: true,
      mirror: false
    });

    GLightbox({
      selector: '.glightbox'
    });
  }

  alertParagraphTargetConnected(target) {
    if (target) {
      let alertTimeout = setTimeout(function() {
        target.remove();
        clearTimeout(alertTimeout);
      }, 3000);
    }
  }

  noticeParagraphTargetConnected(target) {
    if (target) {
      const timeout = setTimeout(function() {
        target.remove();
        clearTimeout(timeout);
      }, 3000);
    }
  }

  preloaderTargetConnected(target) {
    if (target) {
      target.remove();
    }
  }

  connect() {
    this.layout()
  }

  layout() {
    const selectHeader = document.querySelector('#header');
    if (selectHeader) {
      document.addEventListener('scroll', () => {
        window.scrollY > 100 ? selectHeader.classList.add('sticked') : selectHeader.classList.remove('sticked');
      });
    }

    const mobileNavShow = document.querySelector('.mobile-nav-show');
    const mobileNavHide = document.querySelector('.mobile-nav-hide');

    document.querySelectorAll('.mobile-nav-toggle').forEach(el => {
      el.addEventListener('click', function(event) {
        event.preventDefault();
        mobileNavToogle();
      })
    });

    function mobileNavToogle() {
      document.querySelector('body').classList.toggle('mobile-nav-active');
      mobileNavShow.classList.toggle('d-none');
      mobileNavHide.classList.toggle('d-none');
    }

    const navDropdowns = document.querySelectorAll('.navbar .dropdown > a');

    navDropdowns.forEach(el => {
      el.addEventListener('click', function(event) {
        if (document.querySelector('.mobile-nav-active')) {
          event.preventDefault();
          this.classList.toggle('active');
          this.nextElementSibling.classList.toggle('dropdown-active');

          let dropDownIndicator = this.querySelector('.dropdown-indicator');
          dropDownIndicator.classList.toggle('bi-chevron-up');
          dropDownIndicator.classList.toggle('bi-chevron-down');
        }
      })
    });
  }
}

export default MainController
