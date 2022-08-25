// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"


document.addEventListener('DOMContentLoaded', function () {
  const notice = document.getElementById('notice-paragraph')
  const alert = document.getElementById('alert-paragraph')

  let noticeTimeout, alertTimeout;

  if (notice) {
    noticeTimeout = setTimeout(function() {
      notice.remove();
      clearTimeout(noticeTimeout);
    }, 3000);
  }

  if (alert) {
    alertTimeout = setTimeout(function() {
      alert.remove();
      clearTimeout(alertTimeout);
    }, 3000);
  }
})
