(function() {
  chrome.runtime.onMessage.addListener(function(message) {
    var len;
    if (message.type === 'onActivated') {
      len = document.querySelectorAll('.lc-broken-link').length;
      len = len || '';
      return chrome.runtime.sendMessage({
        type: 'setBadgeText',
        value: len.toString()
      });
    }
  });

}).call(this);
