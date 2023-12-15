<p align="center">
  <a href="https://grida.co/dynamix">
    <image src="https://github.com/gridaco/dynamix/blob/main/.readme/cover.png?raw=true" />
    <h3 align="center">Dynamix by Grida</h3>
  </a>
</p>

<p align="center">
  <code>@dynamix/fs</code>
</p>

# `@dynamix/fs`

> Dynamix filesystem utilities. This package is a utility package for handling file transfer between the host and the webview.

This package is compatible with

- [x] React Native
- [x] React
- [x] Vue
- [x] Other JS frameworks

## Installation

```bash
yarn add @dynamix/fs
```

## Usage

Below example is using React for host and React Native for webview.

```tsx
// WEB NextJS
// mypage/page.tsx
import { useDynamix } from "@dynamix/react";

function WebMyPage(){
  const [photo, setPhoto] = useState(null);

  const onPhotoSelectClick = usePhotoPicker({
    readAs: "DataURL",
    multiple: false,
    onLoad: setPhoto
  });

  return (
    <Avatar onClick={onPhotoSelectClick} src={photo}/>
  )
}

// WEBVIEW on React Native
// pages/mypage.tsx
import { WebView } from "@dymamix/react-native";
import fs from "@dynamix/fs";

function AppMyPage() {
  return (
    <Webview>
      <DynamixFSProvider fs={fs}/>
    </WebView>
  )
}
```
