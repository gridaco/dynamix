# react-native-webview-window-declaration

This package provides TypeScript declarations for an extended `window` object when using `react-native-webview`. It's designed to enhance type safety and developer experience by explicitly declaring the `ReactNativeWebView` property on the global `window` object.

## Installation

To install the package, run the following command in your project directory:

```bash
npm install react-native-webview-window-declaration
```

## Usage

Once installed, the TypeScript compiler will recognize the ReactNativeWebView property on the global window object in your React Native project. You do not need to import anything explicitly in your TypeScript files; the declaration is global.

Here's how you might use it in your project:

```ts
import "react-native-webview-window-declaration"

if (window.ReactNativeWebView) {
  window.ReactNativeWebView.postMessage("Hello from the web!");
}
```

## License

Distributed under the MIT License. See [LICENSE](./LICENSE) for more information.
