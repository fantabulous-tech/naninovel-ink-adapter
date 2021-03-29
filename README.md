# Naninovel Ink Adapter

Allows [Inkle's Ink script](https://www.inklestudios.com/ink/) to run [Navinovel](https://naninovel.com)'s script commands.

## Demo

To run the demo:
1. Pull down this project
2. Open the Naninovel Ink Adapter Unity folder in Unity
3. Open the Assets/Scenes/StartScene scene
4. Press 'Play'

You should see the full Naninovel demo prefixed with 'You are now running an Ink script!'

## Setup

To create an Ink-run game from scratch:
1. Create a Unity project with both Naninovel and Ink add ons installed
2. Copy the `Assets/Naninovel Ink Adapter/` folder into your project
3. Create a gameObject to your start scene
4. Add the `NaninovelInkAdapter` component to your start scene
3. Fill in the `Ink JSON Asset` field with the ink JSON you want to run.
4. Open `Edit > Project Settings... > Naninovel > Scripts`
5. Click `Manage Scripts Resources` button at the bottom
6. Add the `Start Ink` script (found in the `Naninovel Ink Adapter` folder)
7. Click `<- Back to Configuration`
8. Assign `Start Ink` as the `Start Game Script`

Hitting 'Play' should now run the Ink script when you start your Naninovel game.

## Inky

`Inky/Inky.exe` is a version of Inky that will highlight all `@commands` to help with editing Navinovel scripts in Inky.

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
