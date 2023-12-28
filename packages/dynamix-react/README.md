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
# for npm
npm install @dynamix/react

# for yarn
yarn add @dynamix/react

# for pnpm
pnpm add @dynamix/react
```

> Important! You also need to setup for your app side.

- [Setup for React Native](https://github.com/gridaco/dynamix/tree/main/packages/dynamix-react-native)
<!-- - [Setup for React Flutter](https://github.com/gridaco/dynamix/tree/main/platforms/flutter) -->

## Usage

```tsx
import dynamix, { DynamixProvider, Navigation } from "@dynamix/react";

export default function () {
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
import dynamix, { Navigation, Platform } from "@dynamix/react";

// basic usage
export default function () {
  return (
    <>
      {/* this will render anchor tag on web, and button on webview */}
      <Navigation.Link href="/mypage">Go to settings on app</Navigation.Link>

      {/* if you want to disable navigation on web, use Platform.App, so it would appear only on app's webview */}
      <Platform.App>
        <Navigation.Link href="/mypage">
          Go to settings on app only
        </Navigation.Link>
      </Platform.App>
    </>
  );
}

// modal usage
export default function () {
  return (
    <>
      <Navigation.Link href="/mypage" presentation="modal">
        Go to settings on app only
      </Navigation.Link>
      <Navigation.Link href="/mypage" presentation="full-screen-modal">
        Go to settings on app only
      </Navigation.Link>
      <Navigation.Link href="/mypage" presentation="bottom-sheet">
        Go to settings on app only
      </Navigation.Link>
      <Navigation.Link href="/mypage" presentation="bottom-sheet-modal">
        Go to settings on app only
      </Navigation.Link>
    </>
  );
}
```

**Social Share**

```tsx
import dynamix, { SocialShare, Platform } from "@dynamix/react";

export default function () {
  return (
    <>
      <Platform.App>
        <SocialShare.InstagramStory
          asChild
          share={{
            image: dynamix("https://xxx.xxx/image.png"),
            color: "#000000",
            uri: dynamix.link("https://xxx.xxx"),
          }}
        >
          <button>Share on Instagram</button>
        </SocialShare.InstagramStory>
      </Platform.App>
      <Platform.Web>
        <p>Instagram Story sharing is not supported on web</p>
      </Platform.Web>
    </>
  );
}
```

**Photo Library**

```tsx
import dynamix, { Upload } from "@dynamix/react";

dynamix.fs.configure({
  storage: "supabase",
});

export default function () {
  return (
    <>
      <Platform.App>
        <Upload.Session fromLibrary fromCamera multiple asChild>
          <Upload.Trigger>
            <button>Share on Instagram</button>
          </Upload.Trigger>
          <Upload.Result>
            {(result) => (
              <img src={result[0].uri} style={{ width: 100, height: 100 }} />
            )}
          </Upload.Result>
        </Upload.Session>
      </Platform.App>
      <Platform.Web>
        <input type="file" multiple />
      </Platform.Web>
    </>
  );
}
```

**Platform Specific**

```tsx
import { Platform } from "@dynamix/react";

// rather this component is displayed on web (browser) or app (webview)
<Platform.Web>Web, browser specific view</Platform.Web>
<Platform.App>App, webview specific view</Platform.App>

// rather this component is displayed on ios or android (on mobile browser, we will use user agent to detect)
<Platform.IOS>IOS specific view</Platform.IOS>
<Platform.Android>Android specific view</Platform.Android>

// if you are mixing multiple frameworks for your app, you can detect the framework with below.
<Platform.ReactNative />
<Platform.Flutter />
<Platform.AndroidNative />
<Platform.IOSNative />

```
