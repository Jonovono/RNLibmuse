
# react-native-libmuse

## Getting started

`$ npm install react-native-libmuse --save`

### Mostly automatic installation

`$ react-native link react-native-libmuse`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-libmuse` and add `RNLibmuse.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNLibmuse.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNLibmusePackage;` to the imports at the top of the file
  - Add `new RNLibmusePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-libmuse'
  	project(':react-native-libmuse').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-libmuse/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-libmuse')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNLibmuse.sln` in `node_modules/react-native-libmuse/windows/RNLibmuse.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Cl.Json.RNLibmuse;` to the usings at the top of the file
  - Add `new RNLibmusePackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNLibmuse from 'react-native-libmuse';

// TODO: What do with the module?
RNLibmuse;
```
  