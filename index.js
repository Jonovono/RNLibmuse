
import { NativeModules } from 'react-native';

const { RNLibmuse } = NativeModules;

export default {
  startScan: function () {
  	console.log('WTF');
  	console.log(RNLibmuse);
	RNLibmuse.startScan();
  },
  pop: function() {
  	console.log('HUSTLE')
  }
};
