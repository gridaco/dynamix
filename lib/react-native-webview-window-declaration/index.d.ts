// Extend the Window interface to include ReactNativeWebView
declare global {
  interface Window {
    ReactNativeWebView: {
      postMessage(msg: string): void;
    };
  }
}

export {};
