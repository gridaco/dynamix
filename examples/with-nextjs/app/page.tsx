import Image from "next/image";
import Link from "next/link";

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <h1 className="mb-10 text-center text-3xl md:text-6xl font-bold">
        Dynamix NextJS Example
      </h1>
      <div className="mb-32 grid text-center lg:max-w-5xl lg:w-full lg:mb-0 lg:grid-cols-4 lg:text-left">
        <Link
          href="/native-select"
          className="group rounded-lg border border-transparent px-5 py-4 transition-colors hover:border-gray-300 hover:bg-gray-100 hover:dark:border-neutral-700 hover:dark:bg-neutral-800/30"
        >
          <h2 className="mb-3 text-2xl font-semibold">
            Native Select <Arrow />
          </h2>
          <p className="m-0 max-w-[30ch] text-sm opacity-50">
            Open up a native select modal to select a value.
          </p>
        </Link>

        <Link
          href="/native-share"
          className="group rounded-lg border border-transparent px-5 py-4 transition-colors hover:border-gray-300 hover:bg-gray-100 hover:dark:border-neutral-700 hover:dark:bg-neutral-800/30"
        >
          <h2 className="mb-3 text-2xl font-semibold">
            Native Share <Arrow />
          </h2>
          <p className="m-0 max-w-[30ch] text-sm opacity-50">
            Use native share to social share your content on Instagram, Twitter,
            Facebook, etc.
          </p>
        </Link>

        <Link
          href="/route"
          className="group rounded-lg border border-transparent px-5 py-4 transition-colors hover:border-gray-300 hover:bg-gray-100 hover:dark:border-neutral-700 hover:dark:bg-neutral-800/30"
        >
          <h2 className="mb-3 text-2xl font-semibold">
            Native Route <Arrow />
          </h2>
          <p className="m-0 max-w-[30ch] text-sm opacity-50">
            Explore starter templates for Next.js.
          </p>
        </Link>

        <Link
          href="/native-photo"
          className="group rounded-lg border border-transparent px-5 py-4 transition-colors hover:border-gray-300 hover:bg-gray-100 hover:dark:border-neutral-700 hover:dark:bg-neutral-800/30"
        >
          <h2 className="mb-3 text-2xl font-semibold">
            Native Photo <Arrow />
          </h2>
          <p className="m-0 max-w-[30ch] text-sm opacity-50">
            Upload photo from album or camera.
          </p>
        </Link>

        <Link
          href="/user-actions"
          className="group rounded-lg border border-transparent px-5 py-4 transition-colors hover:border-gray-300 hover:bg-gray-100 hover:dark:border-neutral-700 hover:dark:bg-neutral-800/30"
        >
          <h2 className="mb-3 text-2xl font-semibold">
            User Actions <Arrow />
          </h2>
          <p className="m-0 max-w-[30ch] text-sm opacity-50">
            Define your action and interact between web with app.
          </p>
        </Link>
      </div>
    </main>
  );
}

function Arrow() {
  return (
    <span className="inline-block transition-transform group-hover:translate-x-1 motion-reduce:transform-none">
      -&gt;
    </span>
  );
}
