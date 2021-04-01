# Naninovel Ink Adapter

Allows [Inkle's Ink script](https://www.inklestudios.com/ink/) to run [Navinovel](https://naninovel.com)'s script commands.

## Demo

To run the demo:
1. Clone this project
2. Open the Naninovel Ink Adapter Unity folder in Unity
3. Open the Assets/Scenes/StartScene scene
4. Press 'Play'

You should see the full Naninovel demo prefixed with 'You are now running an Ink script!'

## Setup

To create an Ink-driven game that runs Naninovel commands from scratch:
1. Create a Unity project with both [Naninovel](https://assetstore.unity.com/packages/tools/game-toolkits/naninovel-visual-novel-engine-135453) and [Ink](https://assetstore.unity.com/packages/tools/integration/ink-unity-integration-60055) Unity Store packages installed
2. Copy the `Assets/Naninovel Ink Adapter/` folder into your project
3. Add the `NaninovelInkAdapter` component to a gameObject in your start scene
4. Fill in the `Ink Json Asset` field with the ink JSON you wish to run.
5. Open `Edit > Project Settings... > Naninovel > Scripts`
6. Click `Manage Scripts Resources` button at the bottom
7. Add the custom `Start Ink` Naninovel script (found in the `Naninovel Ink Adapter` folder)
8. Click `<- Back to Configuration`
9. Assign `Start Ink` as the `Start Game Script` property

Hitting 'Play' in the Unity Editor should now run the Ink script when you start your Naninovel game.

## Custom Inky Highlighting

The included `Inky/Inky.exe` is a version of Inky that will highlight all `@commands` and scope words used in those commands to help with editing Navinovel scripts in Inky.

## License

MIT License

Copyright (c) 2021 Fantabulous

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
