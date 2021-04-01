VAR triedMoving = false
VAR triedAngry = false
VAR tries = 0
VAR shakeCount = 0

You are now running an Ink script!
Here is Naninovel's Demo script running from `Assets/Naninovel Ink Demo Script/Demo.ink`

+ [Start Demo] -> Start

= Start
@printer Wide
@bgm Wind fade:1 wait:false
@spawn SunShafts params:0.5 wait:false
@back Desert time:1
@wait 1
@char n pos:75,-100 time:0
@hide n time:0
@sfx Paper volume:0.5
@char n pos:75,-85
@wait 1.5
@sfx FabricRightToLeft
@wait 0.15
@char n look:right pos:25,-75
@wait 0.35
@sfx Paper
@spawn ShakeCharacter params:n,1,0.3,0,0.5,0
@wait 0.5
@sfx Paper
@char n look:left pos:35,-80
@stopSfx Paper wait:false
...
@hidePrinter 
@sfx FabricLeftToRight
@wait 0.15
@char n look:right pos:85,-55
@wait 0.5
@sfx Paper volume:0.5
@char n look:left pos:85,-45
@sfx Paper
@char n.Surprise wait:false
@spawn ShakeCharacter params:n,1,0.15,0,0.3,0 wait:false
@wait 0.5
@char n.Default pos:50,-10 wait:false
@stopBgm Wind fade:5 wait:false
@bgm CloudNine fade:1 wait:false
@wait 0.25
n: Oh, hey there!
n: Welcome to the demo![i] I'll show what you can achieve with Naninovel along with some brief tutorials.
n: By the way, this whole demo is done entirely with Naninovel, without even a line of code.
n: Shall we get started then?
@save

@char n pos:50,-10 time:0

n: Imagine you've imported Naninovel package to your Unity project.[i][char b.CreateScript transition:Ripple time:1 pos:\{pos\} wait:false][char n pos:80 time:0.5 wait:false] For starters, create a <b>naninovel script</b>.[i] Naninovel scripts are text documents where you control what happens on scenes.[i] Open them with a text editor of your choice, like Notepad, Word or Atom.

@char b.OpenScript transition:Ripple time:1 wait:false
n: For example, here is the contents of a naninovel script used for this demo so far.[i] Don't worry if it looks complicated, I'll show how it works step by step a bit later.

@hide b wait:false
n: Now, open the script in a text editor.[i][char b.HelloWorld transition:Ripple time:1 pos:\{pos\} wait:false] Let's start with showing a simple text. Simply type the text you wish to show, like this.[i] Enter play mode and start new game to see the result.[skipInput]

+ [Hello World!] -> Hello


- (Hello)
Hello World!

@hide b wait:false
n: Easy, right?[i][char b.Name transition:Ripple time:1 pos:\{pos\} wait:false] To associate shown text with a character, just add its name followed by a colon before the text.[skipInput]

+ [John: Hello World!] -> John


- (John)
John: Hello World!

@hide b wait:false
n: Now, let's add a <b>character</b> on scene.[i] Characters in Naninovel can be based on regular and diced sprites, animated Live2D models and 3D meshes; you can add your own implementations as well.[i] To keep it simple, let's use a regular sprite implementation for now.

@char b.AddCharacter pos:\{pos\} transition:Ripple time:1 wait:false
n: Using Naninovel editor menu, open characters manager and add a new character record specifying its name. Double click the record to open settings, where you can select the implementation, add appearance assets and tweak other settings.

@save
@hide b wait:false
@stopBgm  fade:5 wait:false
@bgm Wind fade:5 wait:false
n: Alright, it's time to summon Kohaku-chan on scene![i][char b.ShowCharacter transition:Ripple time:1 pos:\{pos\} wait:false] Type the following expression in the naninovel script and run the game.[skipInput]

+ [@char Kohaku] -> Kohaku


- (Kohaku)
@hide b wait:false
@hidePrinter 
@wait 0.5
@char k look:right pos:25 tint:\#ffffff00 time:0
@char k.Default transition:Ripple easing:EaseOutCubic time:3 wait:false
@char k tint:\#ffffffff time:2
@style b
k: .[wait 0.5] .[wait 0.5] .
@hidePrinter  wait:false
@char k.Confidence
@char k.Default
@char k.Surprise
@char k look:left
@wait 0.25
@char k look:right
@spawn ShakePrinter params:,3 wait:false
@style default
k: Whoa, what's going on?! Where am I?

@sfx Paper
@spawn ShakeCharacter params:n,1,0.3,0,0.5,0 wait:false
n.Surprise: Oh dear, looks like we've snatched you away in the middle of a class.[i][char n.Default] Name's Nani-kun, sorry for the sudden call. Would you help us with this demo tutorial, please?

k.Angry: Gosh, yet another Asset Store stuff? Why they always use me to show it off?..
@char k.Default pos:35,0 wait:false
k: Though...[i][char k pos:37.5 wait:false] Those ears, so fluffy.[i][char k pos:40 wait:false][char n pos:80 scale:0.95 wait:false] I just can't resist...

@char n pos:85 scale:0.925
n: Uhm, wait...[i] What[skipInput]

@hidePrinter  wait:false
@stopBgm  fade:1 wait:false
@bgm JellyRolls fade:1 wait:false
@char k.Happy look:left pos:90,,1 wait:false
@char n.Pain look:left pos:82,-10,-1 scale:0.9
@spawn ShakeCharacter params:n,2,0.3,0,0.5,0
@sfx Paper

n: No, stop! My ears...

@hidePrinter  wait:false
@arrange k.15,n.25
@sfx Paper
@spawn ShakeCharacter params:n,2,0.3,0,0.5,0
n: You have to do something, use naninovel script![skipInput]

~ triedMoving=false
~ triedAngry=false
~ tries=0

- (Choices)

{tries == 2:
    @print "Hide! Use the hide command!" author:n
}

+ {!triedAngry}[@char Kohaku.Angry] -> Angry
+ {!triedMoving}[@char Kohaku pos:85] -> Move
+ {tries>=2}[@hide Kohaku] -> Hide


- (Move)
~ triedMoving=true
@char k.Pain look:left pos:85
n.Confidence: You've moved her away! Good job!
@char k.Default
k: You won't get away from my passion!
@char k.Happy look:right pos:15
@sfx Paper
@char n.Pain wait:false
@spawn ShakeCharacter params:n,1,0.3,0,0.5,0 wait:false
~ tries++
-> Choices

- (Angry)
~ triedAngry=true
@spawn Blur params:,1,0.5 wait:false
@camera offset:-2.8,1.5 zoom:0.3 easing:SmoothStep time:0.5
@char k.Angry
n.Surprise: You just made her angry! Not sure if it'll help...
k.Happy: No way!
@despawn Blur params:0.35 wait:false
@camera offset:0,0 zoom:0 wait:false
@sfx Paper
@char n.Pain wait:false
@spawn ShakeCharacter params:n,1,0.3,0,0.5,0 wait:false
~ tries++
-> Choices

- (Hide)
@hide k
n.Confidence: That's it! You've removed her from the scene!
@char n scale:1 wait:false
@arrange 
@stopBgm  fade:1 wait:false
@bgm Wind fade:1 wait:false
n: Guess we should have called someone else[sfx Glitter volume:0.25][spawn DigitalGlitch params:0.1] instead...
n.Default: Wait, did you hear[sfx Glitter volume:0.5][spawn DigitalGlitch params:0.25] that?
n.Surprise: No way...[i] She's hacking[sfx Glitter][sfx Bubbles volume:0.5][spawn DigitalGlitch] through![i] They don't call her <b>Unity</b>-chan for nothing!
@sfx Bubbles
@spawn DigitalGlitch params:2.5,1.5 wait:false
@sfx Glitter
@wait 1
@sfx Glitch
@hidePrinter  wait:false
@char n pos:65 scale:0.9 wait:false
@char k look:right pos:25 tint:\#ffffff00 time:0
@char k.Angry transition:Pixelate tint:\#ffffff easing:EaseOutCubic time:2.5 wait:false
@spawn Blur params:,1 wait:false
@camera offset:-3.75,2 zoom:0.45 easing:SmoothStep time:1
@wait 2
@char k.Happy wait:false
@wait 0.5
@despawn Blur wait:false
@camera offset:0,0 zoom:0 easing:SmoothStep time:1 wait:false
@arrange  wait:false
@hidePrinter  wait:false
@char n scale:0.9 wait:false
@stopBgm  fade:1 wait:false
@bgm JellyRolls fade:1 wait:false
@arrange k.85,n.75
@sfx Paper
@char n.Pain wait:false

~ shakeCount=0
- (ShakeLoop)
@spawn ShakeCharacter params:n,2,0.3,,0.5
@char n.Surprise
@char n.Pain wait:false
@spawn ShakeCharacter params:n,5,0.15,,0.25,,true,false
@char n.Surprise
~ shakeCount++
{shakeCount < 3:-> ShakeLoop}

k.Confidence: That's what I call happiness overdose!
@arrange  wait:false
@char n.Default scale:1 wait:false
@char k.Default
n.Pain: I was going to die...
@hidePrinter
@wait 1 

n.Default: By the way, those glitch effects were scary as hell; was it some kind of an <b>@spawn</b> command?
k.Confidence: Yep, similar to the one you've used for shaking text window.[i] Wanna try?[skipInput]

- (FXChoice)
+ [@spawn DigitalGlitch] -> Glitch
+ [@spawn ShakePrinter] -> Shake
+ [@spawn Rain] -> Rain
+ [@spawn Snow] -> Snow
+ [@spawn Blur] -> Blur
+ [That's enough] -> Enough



- (Glitch)
@spawn DigitalGlitch
-> FXChoice

- (Shake)
@spawn ShakePrinter
-> FXChoice

- (Rain)
@spawn Rain
-> FXChoice

- (Snow)
@spawn Snow
-> FXChoice

- (Blur)
@spawn Blur params:,0.75
-> FXChoice

- (Enough)
@despawn Rain wait:false
@despawn Snow wait:false
@despawn Blur wait:false
n: And of course you can add your own custom effects. It's as easy as dropping a prefab with the effect to spawn resources list; then use <b>@spawn</b> command followed by the prefab name to activate it.
n: It's also possible to place a command inside the text, so that it could be executed at the right moment. Like this.[skipInput]

+ [John: Shake\[spawn ShakePrinter\] it!] -> JohnShake

- (JohnShake)
John: Shake[spawn ShakePrinter] it!

@stopBgm  fade:10 wait:false
@bgm Wind fade:10 wait:false
k.Default: By the way, are there other ways to output the text? Like, if I want to print a whole paragraph — it won't even fit this window.
n: Actually, the window can resize to fit as mush as the screen allow, but there is another way.[i] You can use a <b>fullscreen</b> printer; it's specifically designed for cases like this. 
n: Use <b>@printer</b> command to switch printers. There are several built-in ones, and you can always add your own. Try it out![skipInput]

- (PrinterChoice)
+ [@printer Fullscreen] -> FullscreenPrinter
+ [@printer Dialogue] -> DialoguePrinter
+ [@printer Wide] -> WidePrinter
+ [@printer Bubble] -> BubblePrinter
+ [Ok, I've got it!] -> EndPrinter


- (FullscreenPrinter)
@hideChars wait:false
@printer Fullscreen
@resetText  wait:false
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam porta, turpis id porttitor maximus, mi tellus tempus justo, sit amet porttitor lorem velit vitae libero. Nunc dapibus maximus molestie. Etiam luctus arcu in lorem tristique tristique. Vestibulum tincidunt eget ante eget sodales.[i][br][br]Proin convallis purus mi, sit amet egestas nibh suscipit vitae. Praesent tempor lectus ex, at vehicula arcu condimentum vel. Vestibulum eu fermentum odio, eleifend euismod nibh. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.[i][br][br]Duis eu pellentesque magna, ut molestie eros. Integer iaculis accumsan nisl, vel rutrum enim bibendum non. Sed dui ipsum, sodales ut rutrum ac, elementum ac lectus. 
@hidePrinter 
-> PrinterChoice

- (DialoguePrinter)
@hideChars wait:false
@printer Dialogue
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam porta, turpis id porttitor maximus, mi tellus tempus justo, sit amet porttitor lorem velit vitae libero. Vestibulum tincidunt eget ante eget sodales.[i][br][br]Proin convallis purus mi, sit amet egestas nibh suscipit vitae. Praesent tempor lectus ex, at vehicula arcu condimentum vel. Vestibulum eu fermentum odio, eleifend euismod nibh. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.[i][br][br]Duis eu pellentesque magna, ut molestie eros. Integer iaculis accumsan nisl, vel rutrum enim bibendum non. Sed dui ipsum, sodales ut rutrum ac, elementum ac lectus. 
@hidePrinter 
-> PrinterChoice

- (WidePrinter)
@hideChars wait:false
@printer Wide
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam porta, turpis id porttitor maximus, mi tellus tempus justo, sit amet porttitor lorem velit vitae libero. Vestibulum tincidunt eget ante eget sodales.
@hidePrinter 
-> PrinterChoice

- (BubblePrinter)
@hideChars wait:false
@printer Bubble pos:50,50
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam porta, turpis id porttitor maximus, mi tellus tempus justo, sit amet porttitor lorem velit vitae libero. Vestibulum tincidunt eget ante eget sodales.
@hidePrinter 
-> PrinterChoice

- (EndPrinter)
@char n wait:false
@char k wait:false
@arrange 
@printer Wide
@stopBgm  fade:3 wait:false
@bgm CloudNine fade:3 wait:false
k: Okay, and what about making those windows something more than just boring rectangles?
n: Sure, you can modify them any way you want.
@spawn ShakePrinter wait:false
k.Surprise: Really?! Wanna try this!
n: Uhm, sure...
@char k.Confidence wait:false
@style b
@spawn Blur params:,1,3 wait:false
@camera offset:-3.75,2 zoom:0.45 time:3 wait:false
k: .[wait 0.5][spawn ShakePrinter] .[wait 0.5][spawn ShakePrinter] .[spawn ShakePrinter]
@hidePrinter 
@style default
@wait 1

@printer Pimped

k.Happy: Ta-daa~!
@despawn Blur params:0.5 wait:false
@camera offset:0,0 zoom:0 wait:false
@char n.Surprise look:right pos:50
n: ...[i] Why cats?
k.Surprise: What, you don't like cats?
@char n look:left
n.Happy: It's complicated...

+ [Keep the printer] -> PimpedKept
+ [Revert to default] -> PimpedChanged


- (PimpedKept)
@char n.Default wait:false
@char k.Happy
n: Whatever...
-> PimpedOut

- (PimpedChanged)
@printer Wide
@char n.Default wait:false
@char k.Angry wait:false
@arrange 
k: Boring!
-> PimpedOut

- (PimpedOut)
n: Guess we should defuse the situation. How about changing a background?
k.Default: Yeah, I would like some fresh air.
n: Add background assets the same way you've added characters and use <b>@back</b> command to switch them.

+ [@back Forest] -> SelectBack


- (SelectBack)
@hidePrinter 
@despawn SunShafts params:0 wait:false
@back Forest
@arrange 

n: You can also specify a transition effect to use when switching backgrounds. Aside from default cross-fade, there are a total of 23 different transition effects available out of the box and an option to add custom ones.[i] Here are some of them.

- (TransitionsChoice)
@hidePrinter 
@hideChars
+ [@back Desert.SlideIn] -> TransitionsSlideIn
+ [@back Desert.Crumble] -> TransitionsCrumble
+ [@back Desert.CloudReveal] -> TransitionsCloudReveal
+ [@back Desert.Pixelate] -> TransitionsPixelate
+ [@back Desert.Ripple] -> TransitionsRipple
+ [@back Desert.LineReveal] -> TransitionsLineReveal
+ [@back Desert.RadialBlur] -> TransitionsRadialBlur
+ [@back Desert.Blinds] -> TransitionsBlinds
+ [Ok, I've got it] -> TransitionsEnd


- (TransitionsSlideIn)
@back Desert.SlideIn time:3
@wait 1.5
@back Forest.SlideIn time:3
-> TransitionsChoice

- (TransitionsCrumble)
@back Desert.Crumble time:3
@wait 1.5
@back Forest.Crumble time:3
-> TransitionsChoice

- (TransitionsCloudReveal)
@back Desert.CloudReveal time:3
@wait 1.5
@back Forest.CloudReveal time:3
-> TransitionsChoice

- (TransitionsPixelate)
@back Desert.Pixelate time:3
@wait 1.5
@back Forest.Pixelate time:3
-> TransitionsChoice

- (TransitionsRipple)
@back Desert.Ripple time:3
@wait 1.5
@back Forest.Ripple time:3
-> TransitionsChoice

- (TransitionsLineReveal)
@back Desert.LineReveal time:3
@wait 1.5
@back Forest.LineReveal time:3
-> TransitionsChoice

- (TransitionsRadialBlur)
@back Desert.RadialBlur time:3
@wait 1.5
@back Forest.RadialBlur time:3
-> TransitionsChoice

- (TransitionsBlinds)
@back Desert.Blinds time:3
@wait 1.5
@back Forest.Blinds time:3
-> TransitionsChoice

- (TransitionsEnd)
@char k wait:false
@char n wait:false
@stopBgm  fade:10 wait:false
k: Hm, but all those backgrounds, they look a bit...[wait 0.7] flat?
n: Well, they are sprite backgrounds, after all.[i] Just like characters, backgrounds can be based on multiple implementations: sprites, animated objects, videos and even full-fledged Unity scenes.
k.Surprise: You said videos? 
n: Indeed. Simply add a video file as another background resource and use the same command.[i] Check this out.[skipInput]

+ [@back VideoForest] -> SelectVideoBack


- (SelectVideoBack)
@hidePrinter 
@hideChars
@back VideoForest id:Video time:1.5
@wait 3

@char n wait:false
k.Default: Impressive!
n: Though, I think <b>scene</b> and <b>generic</b> backgrounds are even more amazing. You can put literally anything into them: animated objects, particle systems, even scripted stuff!

k.Angry: Wait, I think we're missing something essential.
n: Like what?
k: Listen closely...
n: ...[i] Don't think I can hear anything.
k.Confidence: Exactly! 
n: Ah, I've got it. Right, let's talk about audio.
n: Use <b>@bgm</b> and <b>@sfx</b> commands to play background music and sound effects respectively.[i] Both music and sound effect audio files can be added in the same way as all the other resources via editor GUI.
n: The music will loop by default, though you can change this, as well as volume and fade duration.[i] Here, check out these music tracks.[skipInput]

- (BgmChoice)
+ [@bgm CloudNine] -> BgmCloudNine
+ [@bgm JellyRolls] -> BgmJellyRolls
+ [Ok, I've got it!] -> EndBgm


- (BgmCloudNine)
@hidePrinter 
@stopBgm  fade:1 wait:false
@bgm CloudNine fade:1 wait:false
@wait 3
-> BgmChoice

- (BgmJellyRolls)
@hidePrinter 
@stopBgm  fade:1 wait:false
@bgm JellyRolls fade:1 wait:false
@wait 3
-> BgmChoice

- (EndBgm)
@stopBgm  fade:1 wait:false
n.Default: On the contrary, sound effects won't loop by default.[skipInput]

- (SfxChoice)
+ [@sfx Glitch] -> SfxGlitch
+ [@sfx Glitter] -> SfxGlitter
+ [@sfx Bubbles] -> SfxBubbles
+ [Ok, I've got it!] -> EndSfx


- (SfxGlitch)
@hidePrinter 
@sfx Glitch
@wait 0.5
-> SfxChoice

- (SfxGlitter)
@hidePrinter 
@sfx Glitter
@wait 0.5
-> SfxChoice

- (SfxBubbles)
@hidePrinter 
@sfx Bubbles
@wait 0.5
-> SfxChoice

- (EndSfx)
@hide k wait:false
@arrange  wait:false
n: This concludes the demo.[i] For more information and tutorials check out <b>naninovel.com</b>.
n: See ya!

@title
-> END
