// Lapse Exploit Loader for LAZARUS PS4 Host
// This script loads and initializes the PSFree Lapse exploit

(function() {
    'use strict';
    
    var LAPSE_CONFIG = {
        // URLs for Lapse exploit files (can be local or remote)
        psfreeUrl: 'psfree.js',
        lapseUrl: 'lapse.js',
        // Remote fallback URLs (if local files don't exist)
        remotePsfreeUrl: 'https://raw.githubusercontent.com/ciss84/PSFree900/main/psfree.js',
        remoteLapseUrl: 'https://raw.githubusercontent.com/ciss84/PSFree900/main/lapse.js',
        // Auto-start exploit
        autoStart: true,
        // Delay before starting (ms)
        startDelay: 1500
    };
    
    var progressEl = null;
    var messageEl = null;
    
    function updateProgress(msg) {
        if (progressEl) {
            progressEl.innerHTML = msg;
        }
        console.log('[Lapse] ' + msg);
    }
    
    function updateMessage(msg) {
        if (messageEl) {
            messageEl.innerHTML = msg;
        }
    }
    
    function loadScript(url, onSuccess, onError) {
        return new Promise(function(resolve, reject) {
            var script = document.createElement('script');
            script.src = url;
            script.onload = function() {
                if (onSuccess) onSuccess();
                resolve();
            };
            script.onerror = function() {
                if (onError) onError();
                reject(new Error('Failed to load: ' + url));
            };
            document.head.appendChild(script);
        });
    }
    
    function loadScriptWithFallback(localUrl, remoteUrl, name) {
        return loadScript(localUrl)
            .catch(function() {
                updateProgress('Loading ' + name + ' from remote source...');
                return loadScript(remoteUrl);
            });
    }
    
    function initLapseExploit() {
        progressEl = document.getElementById('progress');
        messageEl = document.getElementById('message');
        
        updateProgress('Initializing Lapse Exploit...');
        
        // Load PSFree framework
        loadScriptWithFallback(LAPSE_CONFIG.psfreeUrl, LAPSE_CONFIG.remotePsfreeUrl, 'PSFree')
            .then(function() {
                updateProgress('PSFree loaded. Loading Lapse exploit...');
                // Load Lapse exploit
                return loadScriptWithFallback(LAPSE_CONFIG.lapseUrl, LAPSE_CONFIG.remoteLapseUrl, 'Lapse');
            })
            .then(function() {
                updateProgress('Lapse exploit loaded. Initializing...');
                
                // Wait a bit for scripts to initialize
                setTimeout(function() {
                    // Try to initialize the exploit
                    if (typeof window.psfree !== 'undefined') {
                        if (typeof window.psfree.init === 'function') {
                            window.psfree.init();
                            updateProgress('Lapse Exploit Initialized!');
                            updateMessage('Exploit ready. Firmware 7.00-9.60 supported.');
                        } else if (typeof window.lapse !== 'undefined' && typeof window.lapse.init === 'function') {
                            window.lapse.init();
                            updateProgress('Lapse Exploit Initialized!');
                            updateMessage('Exploit ready. Firmware 7.00-9.60 supported.');
                        } else {
                            // Auto-start if available
                            updateProgress('Lapse Exploit Ready!');
                            updateMessage('Exploit loaded. Waiting for trigger...');
                        }
                    } else {
                        updateProgress('Lapse Exploit Loaded');
                        updateMessage('Exploit files loaded successfully.');
                    }
                }, 500);
            })
            .catch(function(error) {
                updateProgress('Error loading Lapse exploit');
                updateMessage('Failed to load exploit files: ' + error.message);
                console.error('[Lapse Loader] Error:', error);
            });
    }
    
    // Auto-start when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', function() {
            setTimeout(initLapseExploit, LAPSE_CONFIG.startDelay);
        });
    } else {
        setTimeout(initLapseExploit, LAPSE_CONFIG.startDelay);
    }
    
    // Export for manual initialization
    window.initLapseExploit = initLapseExploit;
    
})();
