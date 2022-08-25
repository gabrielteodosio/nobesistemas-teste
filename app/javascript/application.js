// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


document.addEventListener('change', function () {
  const notice = document.getElementById('notice-paragraph')
  const alert = document.getElementById('alert-paragraph')

  let noticeTimeout, alertTimeout;

  if (notice) {
    noticeTimeout = setTimeout(function() {
      notice.hidden = true;
      clearTimeout(noticeTimeout);
    }, 3000);
  }

  if (alert) {
    alertTimeout = setTimeout(function() {
      alert.hidden = true;
      clearTimeout(alertTimeout);
    }, 3000);
  }
})
