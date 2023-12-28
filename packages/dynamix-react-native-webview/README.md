<p align="center">
  <a href="https://grida.co/dynamix">
    <image src="https://github.com/gridaco/dynamix/blob/main/.readme/cover.png?raw=true" />
    <h3 align="center">Dynamix by Grida</h3>
  </a>
</p>

<p align="center">
  <code>@dynamix/react-native-webview</code>
</p>

Wrapper for React Native WebView component with easy custom event handlers.

## Installation

```sh
npm install @dynamix/react-native-webview
```

## Usage

```tsx
import dynamix from "@dynamix/react-native";
import { WebView } from "@dynamix/react-native-webview";

function MyWebView() {
  return (
    <WebView
      source={{ uri: "https://grida.co" }}
      // disable redirecting on it's own
      preventDefaultAnchorClick
      // use dynamix
      dynamix={dynamix.configure({
        onRoute: ({ route }) => {
          // handle in-app routing.
          // don't forget to to add `preventDefaultAnchorClick` prop to prevent webview from redirecting on it's own
        },
        onMessage: ({ message }) => {
          // handle your custom message from web
        },
      })}
      scalesPageToFit
      allowsLinkPreview={false}
      onMessage={(event) => {
        console.log(event.nativeEvent.data);
      }}
    />
  );
}
```

**Props**

Below are the extra props that are available on top of the default [`WebView` props](https://github.com/react-native-webview/react-native-webview/blob/master/docs/Reference.md).

| name                         | type                                      | default | description                                                                                                                                                                     |
| ---------------------------- | ----------------------------------------- | ------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `dynamix`                    | `DynamixReactNative`                      | `null`  | dynamix instance                                                                                                                                                                |
| `disableZoom`                | `boolean`                                 | `false` | Disable zooming (which is a default webview behaviour) by injecting javascript                                                                                                  |
| `preventDefaultTouchstart`   | `boolean`                                 | `false` | Prevent default touchstart event by injecting javascript                                                                                                                        |
| `preventDefaultGestureStart` | `boolean`                                 | `false` | Prevent default gesturestart event by injecting javascript                                                                                                                      |
| `disableUserSelect`          | `boolean`                                 | `false` | Disable user select by injecting javascript                                                                                                                                     |
| `disableAnchorDrag`          | `boolean`                                 | `false` | Disable `<a>` anchor drag on long press by injecting javascript                                                                                                                 |
| `preventDefaultAnchorClick`  | `boolean`                                 | `false` | Prevent default anchor click by injecting javascript                                                                                                                            |
| `propagteAnchorClick`        | `boolean`                                 | `true`  | Propagate anchor click with `window.ReactNativeWebView.postMessage(target.href)` by injecting javascript, this won't be available via `onMessage`, use `onAnchorClick` instead. |
| `onAnchorClick`              | `(href: string, target?: string) => void` | `null`  | Callback for anchor (link) click                                                                                                                                                |
| `debug_injected_javascript`  | `boolean`                                 | `false` | If set, it will log the final injected javascript combined with the one you provided.                                                                                           |
