import Image from 'next/image'

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <h1 className='text-6xl font-black'>Dynamix</h1>
      <p className='text-sm'>
        Dynamix is a web / webview / server / app bridge for cross-platform ui development.
        With dynamix, you can trigger native action from web, via webview on your app.
        Works with NextJS, React, React Native, Flutter.
      </p>
    </main>
  )
}
