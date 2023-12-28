<p align="center">
  <a href="https://grida.co/dynamix">
    <image src="https://github.com/gridaco/dynamix/blob/main/.readme/cover.png?raw=true" />
    <h3 align="center">Dynamix by Grida</h3>
  </a>
</p>

<p align="center">
  <code>@dynamix/react</code>
</p>

## Installation

```sh
npm install @dynamix/react
```

> Important! You also need to setup for your app side.

- [Setup for React Native](https://github.com/gridaco/dynamix/tree/main/packages/dynamix-react-native)
<!-- - [Setup for React Flutter](https://github.com/gridaco/dynamix/tree/main/platforms/flutter) -->

## Usage

```tsx
import dynamix, { DynamixProvider, Navigation } from "@dynamix/react";

function App() {
  return (
    <DynamixProvider>
      <button></button>
      <Navigation.Link href="/mypage">Go to settings on app</Navigation.Link>
    </DynamixProvider>
  );
}
```

**Navigation**

```tsx
import dynamix, { Navigation, IfWebView } from "@dynamix/react";

function App() {
  return (
    <>
      {/* this will render anchor tag on web, and button on webview */}
      <Navigation.Link href="/mypage">Go to settings on app</Navigation.Link>

      {/* if you want to disable navigation on web, use IfWebView prop */}
      <IfWebView>
        <Navigation.Link href="/mypage">
          Go to settings on app only
        </Navigation.Link>
      </IfWebView>
    </>
  );
}
```

**Social Share**

```tsx
import { SocialShare, Platform } from "@dynamix/react";

function App() {
  return (
    <>
      <Platform.Web>
        <p>Instagram Story sharing is not supported on web</p>
      </Platform.Web>
      <Platform.App>
        <SocialShare.InstagramStory asChild>
          <button>Share on Instagram</button>
        </SocialShare.InstagramStory>
      </Platform.App>
    </>
  );
}
```

**Platform Specific**

```tsx
import { Platform } from "@dynamix/react";

// rather this component is displayed on web (browser) or app (webview)
<Platform.Web />
<Platform.App />

// rather this component is displayed on ios or android
<Platform.IOS />
<Platform.Android />

// if you are mixing multiple frameworks for your app, you can detect the framework with below.
<Platform.ReactNative />
<Platform.Flutter />
<Platform.AndroidNative />
<Platform.IOSNative />

```
