(function() {
  chrome.runtime.onMessage.addListener(function(message) {
    if (message.type === 'setBadgeText') {
      return chrome.browserAction.setBadgeText({
        text: message.value
      });
    }
  });

  chrome.tabs.onActivated.addListener(function(activeInfo) {
    return chrome.tabs.sendMessage(activeInfo.tabId, {
      type: 'onActivated'
    });
  });

  chrome.tabs.onUpdated.addListener(function(tabId, changeInfo) {
    if (changeInfo.status === 'complete') {
      return chrome.tabs.sendMessage(tabId, {
        type: 'onActivated'
      });
    }
  });

}).call(this);
