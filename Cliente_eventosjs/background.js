chrome.runtime.onInstalled.addListener(function() {
    chrome.declarativeContent.onPageChanged.removeRules(undefined, function() {
        chrome.declarativeContent.onPageChanged.addRules([{
            conditions: [
                new chrome.declarativeContent.PageStateMatcher({
                    pageUrl: { urlContains: 'studio.code.org/s/starwarsblocks/stage/1/puzzle/' },
                }) ],
            actions: [ new chrome.declarativeContent.ShowPageAction() ]
        }]);
    });
});