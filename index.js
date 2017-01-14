
import { NativeModules } from 'react-native';

const { RNLibmuse } = NativeModules;

export default {
  start: function () {
	RNLibmuse.start();
  },
  MUSES_AVAILABLE: RNLibmuse.MUSES_AVAILABLE
};
