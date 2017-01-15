
import { NativeModules } from 'react-native';

const { RNLibmuse } = NativeModules;

export default {
  start: function () {
	RNLibmuse.start();
  },
  connectToMuse: function() {
  	RNLibmuse.connectToMuse()
  },
  MUSES_AVAILABLE: RNLibmuse.MUSES_AVAILABLE
};
